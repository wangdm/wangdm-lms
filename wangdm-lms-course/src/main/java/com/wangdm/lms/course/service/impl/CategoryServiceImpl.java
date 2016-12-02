package com.wangdm.lms.course.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangdm.core.constant.EntityStatus;
import com.wangdm.core.constraint.Constraint;
import com.wangdm.core.constraint.ConstraintFactory;
import com.wangdm.core.constraint.Order.OrderType;
import com.wangdm.core.dao.Dao;
import com.wangdm.core.service.BaseService;
import com.wangdm.lms.course.dto.AttributeNameDto;
import com.wangdm.lms.course.dto.AttributeValueDto;
import com.wangdm.lms.course.dto.CategoryDto;
import com.wangdm.lms.course.entity.AttributeName;
import com.wangdm.lms.course.entity.AttributeValue;
import com.wangdm.lms.course.entity.Category;
import com.wangdm.lms.course.service.AttributeService;
import com.wangdm.lms.course.service.CategoryService;

@Service("categoryServie")
@Transactional
public class CategoryServiceImpl extends BaseService<Category> implements CategoryService {
    
    @Autowired
    Dao<Category> categoryDao;
    
    @Autowired
    Dao<AttributeName> attributeNameDao;
    
    @Autowired
    AttributeService attributeServie;
    
    @Autowired
    private ConstraintFactory constraintFactory;

    @Override
    public void delete(Serializable id) {
        categoryDao.deleteById(Category.class, id);

    }

    
	@Override
	public List<CategoryDto> getChildren(Serializable id) {

        Constraint constraint = constraintFactory.createConstraint(Category.class);
        
        constraint.addEqualCondition("parent.id", id);
        
        constraint.addEqualCondition("status", EntityStatus.NORMAL);
        
        constraint.addOrder("index", OrderType.ASC);
        
        List<Category> entityList = categoryDao.findByConstraint(constraint);
        if(entityList == null || entityList.size()<=0){
            return null;
        }
        
        List<CategoryDto> dtoList = new ArrayList<CategoryDto>(entityList.size());
        for(Category entity : entityList){
            CategoryDto dto = new CategoryDto();
            dto.fromEntity(entity);
            dtoList.add(dto);
        }
        
        return dtoList;
	}
    
	
    public List<CategoryDto> getAncestors(Serializable id){

        Category leaf = categoryDao.findById(id);
        if(leaf==null){
            return null;
        }
        
        List<Category> entityList = new ArrayList<Category>(5);
        
        recurseAncestors(entityList, leaf.getParent().getId());
        
        entityList.add(leaf);

        List<CategoryDto> dtoList = new ArrayList<CategoryDto>(entityList.size());
        for(Category entity : entityList){
            
            CategoryDto dto = new CategoryDto();
            dto.fromEntity(entity);
            
            dtoList.add(dto);
        }
        
        return dtoList;
    }

    
	@Override
	public List<AttributeNameDto> getCategorySelfAttribute(Serializable id) {

        Constraint constraint = constraintFactory.createConstraint(AttributeName.class);
        
        constraint.addEqualCondition("category.id", id);
        
        constraint.addEqualCondition("status", EntityStatus.NORMAL);
        
        constraint.addOrder("index", OrderType.ASC);
        
        List<AttributeName> nameList = attributeNameDao.findByConstraint(constraint);
        if(nameList == null || nameList.size()<=0){
            return null;
        }
        
        List<AttributeNameDto> dtoList = new ArrayList<AttributeNameDto>(nameList.size());
        for(AttributeName nameEntity : nameList){
            AttributeNameDto nameDto = new AttributeNameDto();
            nameDto.fromEntity(nameEntity);

            List<AttributeValue> valueList = nameEntity.getValueList();
            if(valueList!=null && valueList.size()>0){
                List<AttributeValueDto> valueDtoList = new ArrayList<AttributeValueDto>(valueList.size());
                for(AttributeValue valueEntity : valueList){
                    AttributeValueDto valueDto = new AttributeValueDto();
                    valueDto.fromEntity(valueEntity);
                    valueDtoList.add(valueDto);
                }
                nameDto.setValues(valueDtoList);
            }else{
                nameDto.setValues(attributeServie.getAttributeValue(nameEntity.getId()));
            }
            
            dtoList.add(nameDto);
        }
        
        return dtoList;
	}

	
    @Override
    public List<AttributeNameDto> getCategoryAllAttribute(Serializable id) {

        Category leaf = categoryDao.findById(id);
        if(leaf==null){
            return null;
        }
        
        List<Category> entityList = new ArrayList<Category>(5);
        
        recurseAncestors(entityList, leaf.getParent().getId());
        
        entityList.add(leaf);

        List<AttributeNameDto> dtoList = new ArrayList<AttributeNameDto>(entityList.size()*4);
        for(Category entity : entityList){
            
            dtoList.addAll(this.getCategorySelfAttribute(entity.getId()));
        }
        
        return dtoList;
    }

    
	@Override
	public CategoryDto getCategoryTree(Serializable id) {

	    Category root = categoryDao.findById(Category.class, id);
	    if(root==null){
	        return null;
	    }
	    
	    CategoryDto rootDto = new CategoryDto();
	    rootDto.fromEntity(root);
	    
	    recurseChildren(rootDto, false);
	    
		return rootDto;
	}

	
	@Override
	public CategoryDto getCategoryTreeWithAttribute(Serializable id) {

        Category root = categoryDao.findById(id);
        if(root==null){
            return null;
        }
        
        CategoryDto rootDto = new CategoryDto();
        rootDto.fromEntity(root);
        
        recurseChildren(rootDto, true);
        
        return rootDto;
	}
	
	
	private void recurseChildren(CategoryDto parentDto, boolean getAttr){
	    
	    List<CategoryDto> childrenDtoList = this.getChildren(parentDto.getEntityId());
	    if(childrenDtoList==null || childrenDtoList.size()<=0){
	        return;
	    }
	    
	    for(CategoryDto dto : childrenDtoList){
	        recurseChildren(dto, getAttr);
	        
	        if(getAttr){
	            dto.setAttributes(this.getCategorySelfAttribute(dto.getEntityId()));
	        }
	    }
	    
	    parentDto.setChildren(childrenDtoList);
	}
    
    
    private void recurseAncestors(List<Category> entityList, Serializable id){

        Category leaf = categoryDao.findById(id);
        if(leaf==null){
            return;
        }
        
        recurseAncestors(entityList, leaf.getParent().getId());
        
        entityList.add(leaf);
    }

}
