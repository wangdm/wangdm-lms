package com.wangdm.lms.course.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangdm.core.dao.BaseDao;
import com.wangdm.core.dto.Dto;
import com.wangdm.core.query.Query;
import com.wangdm.core.service.BaseService;
import com.wangdm.lms.course.dto.AttributeDto;
import com.wangdm.lms.course.dto.CategoryDto;
import com.wangdm.lms.course.entity.AttributeName;
import com.wangdm.lms.course.entity.AttributeValue;
import com.wangdm.lms.course.entity.Category;
import com.wangdm.lms.course.service.CategoryService;

@Service("categoryServie")
@Transactional
public class CategoryServiceImpl extends BaseService<Category> implements CategoryService {
    
    @Autowired
    BaseDao<Category> categoryDao;
    
    @Autowired
    BaseDao<AttributeName> attributeNameDao;
    
    @Autowired
    BaseDao<AttributeValue> attributeValueDao;

    @Override
    public Serializable create(Dto dto) {
        CategoryDto categoryDto = (CategoryDto)dto;
        Category category = (Category)dto.toEntity(Category.class);
        categoryDao.create(category);
        List<AttributeDto> attriDtoList = categoryDto.getAttributrs();
        for(AttributeDto attributeDto : attriDtoList){
            AttributeName attriName = (AttributeName)attributeDto.toEntity(AttributeName.class);
            attriName.setCategory(category);
            attributeNameDao.create(attriName);
            Set<String> valueList = attributeDto.getAttriValue();
            for(String value : valueList){
                AttributeValue attriValue = new AttributeValue();
                attriValue.setName(attriName);
                attriValue.setValue(value);
                attributeValueDao.create(attriValue);
            }
        }
        return null;
    }

    @Override
    public void update(Dto dto) {
        // TODO Auto-generated method stub

    }

    @Override
    public void delete(Serializable id) {
        categoryDao.delete(Category.class, id);

    }

    @Override
    public CategoryDto findById(Serializable id) {
        CategoryDto catDto = new CategoryDto();
        Category category = categoryDao.findById(Category.class, id);
        if(category!=null)
        {
            catDto.fromEntity(category);
            return catDto;
        }
        return null;
    }

    @Override
    public List<Dto> query(Query query) {
        // TODO Auto-generated method stub
        return null;
    }

}
