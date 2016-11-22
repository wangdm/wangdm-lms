package com.wangdm.lms.course.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangdm.core.constant.EntityStatus;
import com.wangdm.core.constant.EntityType;
import com.wangdm.core.constraint.Constraint;
import com.wangdm.core.constraint.ConstraintFactory;
import com.wangdm.core.dao.Dao;
import com.wangdm.core.dto.Dto;
import com.wangdm.core.service.BaseService;
import com.wangdm.lms.course.dto.AttributeMapDto;
import com.wangdm.lms.course.dto.AttributeNameDto;
import com.wangdm.lms.course.dto.AttributeValueDto;
import com.wangdm.lms.course.entity.AttributeMap;
import com.wangdm.lms.course.entity.AttributeName;
import com.wangdm.lms.course.entity.AttributeValue;
import com.wangdm.lms.course.service.AttributeService;

@Service("attributeServie")
@Transactional
public class AttributeServiceImpl extends BaseService<AttributeName> implements AttributeService {

    @Autowired
    Dao<AttributeName> attributeNameDao;
    
    @Autowired
    Dao<AttributeValue> attributeValueDao;
    
    @Autowired
    Dao<AttributeMap> attributeMapDao;
    
    @Autowired
    private ConstraintFactory constraintFactory;
    
    @Override
    public Serializable create(Dto dto) {

        Serializable id = null;
        if(dto instanceof AttributeNameDto){
            AttributeNameDto attrNameDto = (AttributeNameDto)dto;
            AttributeName name = (AttributeName)attrNameDto.toEntity(AttributeName.class);
            id = attributeNameDao.create(name);
            
            List<AttributeValueDto> valueDtoList = attrNameDto.getValues();
            if(valueDtoList!=null && valueDtoList.size()>0){
                for(AttributeValueDto attrValueDto : valueDtoList){
                    AttributeValue value = (AttributeValue)attrValueDto.toEntity(AttributeValue.class);
                    value.setName(name);
                    attrValueDto.setId(attributeValueDao.create(value).toString());
                }
            }
        }
        
        return id;
    }

    
    @Override
    public void update(Dto dto) {

        if(dto instanceof AttributeNameDto && dto.getEntityId()>0){
            AttributeNameDto attrNameDto = (AttributeNameDto)dto;
            AttributeName name = attributeNameDao.findById(AttributeName.class, attrNameDto.getEntityId());
            if(name != null){
                List<AttributeValueDto> newValueDtoList = attrNameDto.getValues();
                if(newValueDtoList!=null && newValueDtoList.size()>0){
                    for(AttributeValueDto newValueDto : newValueDtoList){
                        if(newValueDto.getEntityId()>0){
                            AttributeValue value = attributeValueDao.findById(newValueDto.getEntityId());
                            newValueDto.toEntity(value);
                            attributeValueDao.update(value);
                        }
                        else{
                            AttributeValue value = (AttributeValue) newValueDto.toEntity(AttributeValue.class);
                            attributeValueDao.create(value);
                        }
                    }
                }
                attrNameDto.toEntity(name);
                attributeNameDao.update(name);
            }
        }

    }
    

    @Override
    public void delete(Serializable id) {
        
        AttributeName name = attributeNameDao.findById(AttributeName.class, id);
        if(name != null){
            attributeMapDao.deleteByColumn("name.id", id);
            attributeValueDao.deleteByColumn("name.id", id);
            attributeNameDao.delete(name);
        }
    }

    
    @Override
    public AttributeNameDto findById(Serializable id) {
        
        AttributeName name = attributeNameDao.findById(AttributeName.class, id);
        if(name != null){
            AttributeNameDto dto = new AttributeNameDto();
            dto.fromEntity(name);
            
            List<AttributeValue> valueList = name.getValueList();
            
            if(valueList!=null && valueList.size()>0){
                
                List<AttributeValueDto> valueDtoList = new ArrayList<AttributeValueDto>(valueList.size());
                for(AttributeValue value : valueList){
                    AttributeValueDto valueDto = new AttributeValueDto();
                    valueDto.fromEntity(value);
                    valueDtoList.add(valueDto);
                }
                
                dto.setValues(valueDtoList);
            }
            return dto;
        }
        
        return null;
    }

    
    @Override
    public void addAttributeValue(Serializable id, List<String> values) {

        AttributeName name = attributeNameDao.findById(AttributeName.class, id);
        
        if(values!=null && values.size()>0){
            for(int i=0; i<values.size(); i++){
                AttributeValue value = new AttributeValue();
                value.setIndex(i);
                value.setValue(values.get(i));
                value.setName(name);
                attributeValueDao.create(value);
            }
        }
        
    }

    
    @Override
    public void delAttributeValue(List<Serializable> valueIds) {
        
        if(valueIds!=null && valueIds.size()>0){
            for(int i=0; i<valueIds.size(); i++){
                attributeValueDao.deleteById(valueIds.get(i));
            }
        }
        
    }

    
    @Override
    public void editAttributeValue(List<AttributeValueDto> valueDtoList) {
        
        if(valueDtoList!=null && valueDtoList.size()>0){
            
            for(AttributeValueDto valueDto : valueDtoList){
                
                AttributeValue value = attributeValueDao.findById(AttributeValue.class, valueDto.getEntityId());
                if(value != null){
                    valueDto.toEntity(value);
                    attributeValueDao.update(value);
                }
            }
            
        }
        
    }

    
    @Override
    public List<AttributeMapDto> getEntityAttribute(Serializable entityId, EntityType entityType) {

        Constraint constraint = constraintFactory.createConstraint(AttributeMap.class);
        
        constraint.addEqualCondition("entityType", entityType);
        
        constraint.addEqualCondition("entityId", entityId);
        
        constraint.addEqualCondition("status", EntityStatus.NORMAL);
        
        List<AttributeMap> entityList = attributeMapDao.findByConstraint(constraint);
        if(entityList == null || entityList.size()<=0){
            return null;
        }
        
        List<AttributeMapDto> dtoList = new ArrayList<AttributeMapDto>(entityList.size());
        for(AttributeMap entity : entityList){
            AttributeMapDto dto = new AttributeMapDto();
            dto.fromEntity(entity);
            
            dtoList.add(dto);
        }
        
        return dtoList;
    }

}
