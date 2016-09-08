package com.wangdm.lms.course.dto;

import java.util.Set;

import com.wangdm.core.dto.BaseDto;
import com.wangdm.core.entity.Entity;
import com.wangdm.lms.course.entity.AttributeName;

public class AttributeDto extends BaseDto {

    private String attriId = "0";
    
    private String attriName;
    
    private Set<String> attriValue;

    @Override
    public Long getEntityId() {
        return Long.valueOf(attriId);
    }

    public String getAttriId() {
        return attriId;
    }

    public void setAttriId(String attriId) {
        this.attriId = attriId;
    }

    public String getAttriName() {
        return attriName;
    }

    public void setAttriName(String attriName) {
        this.attriName = attriName;
    }

    public Set<String> getAttriValue() {
        return attriValue;
    }

    public void setAttriValue(Set<String> attriValue) {
        this.attriValue = attriValue;
    }

    @Override
    public Entity toEntity(Class<?> clazz) {
        AttributeName attriName = new AttributeName();
        attriName.setName(this.getAttriName());
        return attriName;
    }

    @Override
    public void fromEntity(Entity entity) {
        // TODO Auto-generated method stub
        super.fromEntity(entity);
    }
}
