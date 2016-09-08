package com.wangdm.lms.course.dto;

import java.util.List;

import com.wangdm.core.dto.BaseDto;
import com.wangdm.core.entity.Entity;
import com.wangdm.lms.course.entity.Category;

public class CategoryDto extends BaseDto {
    
    private String catId = "0";
    
    private String catName;
    
    private String catIdx = "1";
    
    private List<AttributeDto> attributrs;

    @Override
    public Long getEntityId() {
        return Long.valueOf(catId);
    }

    public String getCatId() {
        return catId;
    }

    public void setCatId(String catId) {
        this.catId = catId;
    }

    public String getCatName() {
        return catName;
    }

    public void setCatName(String catNane) {
        this.catName = catNane;
    }

    public String getCatIdx() {
        return catIdx;
    }

    public void setCatIdx(String catIdx) {
        this.catIdx = catIdx;
    }

    public List<AttributeDto> getAttributrs() {
        return attributrs;
    }

    public void setAttributrs(List<AttributeDto> attributrs) {
        this.attributrs = attributrs;
    }

    @Override
    public Entity toEntity(Class<?> clazz) {
        Category category = new Category();
        category.setName(this.getCatName());
        category.setIndex(Integer.valueOf(this.getCatIdx()));
        return category;
    }

    @Override
    public void fromEntity(Entity entity) {
        Category category = (Category)entity;
        this.catId = category.getId().toString();
        this.catName = category.getName();
        this.catIdx = category.getIndex().toString();
        super.fromEntity(entity);
    }

}
