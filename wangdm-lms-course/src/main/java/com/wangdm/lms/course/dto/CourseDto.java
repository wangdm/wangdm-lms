package com.wangdm.lms.course.dto;

import java.util.List;

import com.wangdm.core.dto.BaseDto;

public class CourseDto extends BaseDto {

    private String courseId;
    
    private String coursTitle;
    
    private String status;
    
    private String statusDesc;
    
    private String categoryId;
    
    private String categoryName;
    
    private List<AttributeMapDto> attributes;

    @Override
    public Long getEntityId() {
        return Long.valueOf(courseId);
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getCoursTitle() {
        return coursTitle;
    }

    public void setCoursTitle(String coursTitle) {
        this.coursTitle = coursTitle;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStatusDesc() {
        return statusDesc;
    }

    public void setStatusDesc(String statusDesc) {
        this.statusDesc = statusDesc;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public List<AttributeMapDto> getAttributes() {
        return attributes;
    }

    public void setAttributes(List<AttributeMapDto> attributes) {
        this.attributes = attributes;
    }
    
}
