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
import com.wangdm.core.dto.Dto;
import com.wangdm.core.service.BaseService;
import com.wangdm.lms.course.dto.AttributeNameDto;
import com.wangdm.lms.course.dto.CategoryDto;
import com.wangdm.lms.course.entity.AttributeName;
import com.wangdm.lms.course.entity.AttributeValue;
import com.wangdm.lms.course.entity.Category;
import com.wangdm.lms.course.service.CategoryService;

@Service("categoryServie")
@Transactional
public class CategoryServiceImpl extends BaseService<Category> implements CategoryService {
    
    @Autowired
    Dao<Category> categoryDao;
    
    @Autowired
    Dao<AttributeName> attributeNameDao;
    
    @Autowired
    Dao<AttributeValue> attributeValueDao;
    
    @Autowired
    private ConstraintFactory constraintFactory;

    @Override
    public void delete(Serializable id) {
        categoryDao.deleteById(Category.class, id);

    }

	@Override
	public List<Dto> getChildren(Serializable id) {

        Constraint constraint = constraintFactory.createConstraint(Category.class);
        
        constraint.addEqualCondition("parent.id", id);
        
        constraint.addEqualCondition("status", EntityStatus.NORMAL);
        
        constraint.addOrder("index", OrderType.ASC);
        
        List<Category> entityList = categoryDao.findByConstraint(constraint);
        if(entityList == null || entityList.size()<=0){
            return null;
        }
        
        List<Dto> dtoList = new ArrayList<Dto>(entityList.size());
        for(Category entity : entityList){
            Dto dto = new CategoryDto();
            dto.fromEntity(entity);
            dtoList.add(dto);
        }
        
        return dtoList;
	}

	@Override
	public List<Dto> getCategoryAttribute(Serializable id) {

        Constraint constraint = constraintFactory.createConstraint(AttributeName.class);
        
        constraint.addEqualCondition("category.id", id);
        
        constraint.addEqualCondition("status", EntityStatus.NORMAL);
        
        constraint.addOrder("index", OrderType.ASC);
        
        List<AttributeName> entityList = attributeNameDao.findByConstraint(constraint);
        if(entityList == null || entityList.size()<=0){
            return null;
        }
        
        List<Dto> dtoList = new ArrayList<Dto>(entityList.size());
        for(AttributeName entity : entityList){
            Dto dto = new AttributeNameDto();
            dto.fromEntity(entity);
            dtoList.add(dto);
        }
        
        return dtoList;
	}

	@Override
	public List<Dto> getCategoryTree(Serializable id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Dto> getCategoryTreeWithAttribute(Serializable id) {
		// TODO Auto-generated method stub
		return null;
	}

}
