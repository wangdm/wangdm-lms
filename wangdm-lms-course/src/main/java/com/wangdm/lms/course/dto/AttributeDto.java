package com.wangdm.lms.course.dto;

import java.util.Map;

import com.wangdm.core.dto.BaseDto;
import com.wangdm.core.entity.Entity;
import com.wangdm.lms.course.entity.AttributeName;

public class AttributeDto extends BaseDto {

    private String attriId = "0";
    
    private String attriName;
    
    private Map<String,String> attriValues;

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

    public Map<String,String> getAttriValue() {
        return attriValues;
    }

    public void setAttriValue(Map<String,String> attriValue) {
        this.attriValues = attriValue;
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
