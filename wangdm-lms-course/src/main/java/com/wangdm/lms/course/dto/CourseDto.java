package com.wangdm.lms.course.dto;

import java.util.List;

import com.wangdm.core.dto.BaseDto;

public class CourseDto extends BaseDto {

    private String courseId;
    
    private String coursTitle;
    
    private String status;
    
    private String categoryId;
    
    private String categoryName;
    
    private List<CourseAttributeDto> attributes;

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

    public List<CourseAttributeDto> getAttributes() {
        return attributes;
    }

    public void setAttributes(List<CourseAttributeDto> attributes) {
        this.attributes = attributes;
    }
    
}
