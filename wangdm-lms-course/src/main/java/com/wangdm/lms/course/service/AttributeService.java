package com.wangdm.lms.course.service;

import java.io.Serializable;
import java.util.List;

import com.wangdm.core.constant.EntityType;
import com.wangdm.core.service.Service;
import com.wangdm.lms.course.dto.AttributeMapDto;
import com.wangdm.lms.course.dto.AttributeValueDto;

public interface AttributeService extends Service {
    
    public void addAttributeValue(Serializable id, List<String> values);
    
    public void delAttributeValue(List<Serializable> valueIds);
    
    public void editAttributeValue(List<AttributeValueDto> valueDtoList);
    
    public List<AttributeMapDto> getEntityAttribute(Serializable entityId, EntityType entityType);

}
