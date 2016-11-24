package com.wangdm.lms.course.query;

import java.util.List;

import com.wangdm.core.query.BaseQuery;
import com.wangdm.lms.course.constant.CourseStatus;

public class CourseQuery  extends BaseQuery{
    private String title;
    private String userId;
    private String categoryId;
    private List<CourseStatus> courseStatus;
    private int[] queryArray;
    
    public int[] getQueryArray() {
        return queryArray;
    }

    public void setQueryArray(int[] queryArray) {
        this.queryArray = queryArray;
    }

    public List<CourseStatus> getCourseStatus() {
		return courseStatus;
	}

	public void setCourseStatus(List<CourseStatus> courseStatus) {
		this.courseStatus = courseStatus;
	}

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
    
    
}
