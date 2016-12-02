package com.wangdm.lms.course.dto;

import java.util.List;

import com.wangdm.core.dto.BaseDto;
import com.wangdm.core.dto.annotation.DtoMapper;
import com.wangdm.lms.course.entity.AttributeName;

public class AttributeNameDto extends BaseDto {

    @DtoMapper(entity = AttributeName.class, field = "id")
    private String id;

    @DtoMapper(entity = AttributeName.class, field = "name")
    private String name;

    @DtoMapper(entity = AttributeName.class, field = "index")
    private String index;

    @DtoMapper(entity = AttributeName.class, field = "category.id")
    private String categoryId;
    
    private List<AttributeValueDto> values;

    @Override
    public Long getEntityId() {
        return Long.valueOf(id);
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIndex() {
        return index;
    }

    public void setIndex(String index) {
        this.index = index;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public List<AttributeValueDto> getValues() {
        return values;
    }

    public void setValues(List<AttributeValueDto> values) {
        this.values = values;
    }
    
}
