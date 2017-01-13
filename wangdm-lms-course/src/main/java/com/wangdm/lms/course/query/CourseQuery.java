package com.wangdm.lms.course.query;

import java.util.List;
import java.util.Map;

import com.wangdm.core.query.PageQuery;
import com.wangdm.lms.course.constant.CourseStatus;

public class CourseQuery extends PageQuery{
    
    private String title;
    
    private String userId;
    
    private String categoryId;
    
    private List<CourseStatus> courseStatus;
    
    private Map<String, String> attributes;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public List<CourseStatus> getCourseStatus() {
        return courseStatus;
    }

    public void setCourseStatus(List<CourseStatus> courseStatus) {
        this.courseStatus = courseStatus;
    }

    public Map<String, String> getAttributes() {
        return attributes;
    }

    public void setAttributes(Map<String, String> attributes) {
        this.attributes = attributes;
    }
    
}
