package com.wangdm.lms.course.dto;

import com.wangdm.core.dto.BaseDto;
import com.wangdm.core.dto.annotation.DtoMapper;
import com.wangdm.lms.course.entity.AttributeValue;

public class AttributeValueDto extends BaseDto {

    @DtoMapper(entity = AttributeValue.class, field = "id")
    private String id;

    @DtoMapper(entity = AttributeValue.class, field = "value")
    private String value;

    @DtoMapper(entity = AttributeValue.class, field = "index")
    private String index;

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

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getIndex() {
        return index;
    }

    public void setIndex(String index) {
        this.index = index;
    }
    
}
