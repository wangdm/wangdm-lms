package com.wangdm.lms.course.query;

import com.wangdm.core.query.BaseQuery;

public class VideoQuery extends BaseQuery {
  
    private String title;
    private String userId;
    private String categoryId;
    private int[] queryArray;
    public int[] getQueryArray() {
		return queryArray;
	}

	public void setQueryArray(int[] queryArray) {
		this.queryArray = queryArray;
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
