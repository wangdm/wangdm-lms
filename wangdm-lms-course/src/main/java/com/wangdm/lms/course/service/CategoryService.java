package com.wangdm.lms.course.service;

import java.io.Serializable;
import java.util.List;

import com.wangdm.core.dto.Dto;
import com.wangdm.core.service.Service;

public interface CategoryService extends Service{
	
	public List<Dto> getChildren(Serializable id);
	
	public List<Dto> getCategoryAttribute(Serializable id);
	
	public List<Dto> getCategoryTree(Serializable id);
	
	public List<Dto> getCategoryTreeWithAttribute(Serializable id);

}
