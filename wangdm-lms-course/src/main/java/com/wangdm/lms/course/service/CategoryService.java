package com.wangdm.lms.course.service;

import java.io.Serializable;
import java.util.List;

import com.wangdm.core.service.Service;
import com.wangdm.lms.course.dto.AttributeNameDto;
import com.wangdm.lms.course.dto.CategoryDto;

public interface CategoryService extends Service{
	
	public List<CategoryDto> getChildren(Serializable id);
    
    public List<CategoryDto> getAncestors(Serializable id);
	
	public List<AttributeNameDto> getCategorySelfAttribute(Serializable id);
    
    public List<AttributeNameDto> getCategoryAllAttribute(Serializable id);
	
	public CategoryDto getCategoryTree(Serializable id);
	
	public CategoryDto getCategoryTreeWithAttribute(Serializable id);

}
