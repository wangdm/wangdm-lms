package com.wangdm.lms.course.dto;

import com.wangdm.core.dto.BaseDto;

public class CourseAttributeDto extends BaseDto {
    
    private String id;
    
    private String attriName;
    
    private String attriValue;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAttriName() {
        return attriName;
    }

    public void setAttriName(String attriName) {
        this.attriName = attriName;
    }

    public String getAttriValue() {
        return attriValue;
    }

    public void setAttriValue(String attriValue) {
        this.attriValue = attriValue;
    }

}
