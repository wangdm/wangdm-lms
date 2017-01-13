package com.wangdm.lms.course.query;

import java.util.ArrayList;
import java.util.List;

import com.wangdm.core.query.PageQuery;
import com.wangdm.lms.course.constant.LiveStatus;

public class LiveQuery extends PageQuery {
	
	private String userId = "";
	
	private String categoryId = "";
  
    private String title;

    List<LiveStatus> liveStatus = new ArrayList<LiveStatus>();
   
    private String gradeId;
    
    private String subjectId;
    
    private  int currentPage;
    
    private int[] queryArray;
    
	public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public String getGradeId() {
        return gradeId;
    }

    public void setGradeId(String gradeId) {
        this.gradeId = gradeId;
    }

    public String getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(String subjectId) {
        this.subjectId = subjectId;
    }

    public List<LiveStatus> getLiveStatus() {
		return liveStatus;
	}

	public void setLiveStatus(List<LiveStatus> liveStatus) {
		this.liveStatus = liveStatus;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int[] getQueryArray() {
        return queryArray;
    }

    public void setQueryArray(int[] queryArray) {
        this.queryArray = queryArray;
    }
}
