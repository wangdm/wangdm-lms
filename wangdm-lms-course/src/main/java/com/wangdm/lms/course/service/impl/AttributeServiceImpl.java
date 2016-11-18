package com.wangdm.lms.course.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangdm.core.dao.Dao;
import com.wangdm.core.dto.Dto;
import com.wangdm.core.query.Query;
import com.wangdm.core.service.BaseService;
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
        }
        
        return null;
    }

    @Override
    public List<Dto> query(Query query) {
        // TODO Auto-generated method stub
        return null;
    }

}
