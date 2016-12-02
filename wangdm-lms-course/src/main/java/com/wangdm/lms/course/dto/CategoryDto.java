package com.wangdm.lms.course.dto;

import java.util.List;

import com.wangdm.core.dto.BaseDto;
import com.wangdm.core.dto.annotation.DtoMapper;
import com.wangdm.lms.course.entity.Category;

public class CategoryDto extends BaseDto {
    
    @DtoMapper(entity = Category.class, field = "id")
    private String id;

    @DtoMapper(entity = Category.class, field = "name")
    private String name;

    @DtoMapper(entity = Category.class, field = "index")
    private String idx;
    
    @DtoMapper(entity = Category.class, field = "parent.id")
    private String parentId;
    
    private List<CategoryDto> children;
    
    private List<AttributeNameDto> attributes;

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

    public String getIdx() {
        return idx;
    }

    public void setIdx(String idx) {
        this.idx = idx;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public List<CategoryDto> getChildren() {
        return children;
    }

    public void setChildren(List<CategoryDto> children) {
        this.children = children;
    }

    public void setAttributes(List<AttributeNameDto> attributes) {
        this.attributes = attributes;
    }

    public List<AttributeNameDto> getAttributes() {
        return attributes;
    }

}
