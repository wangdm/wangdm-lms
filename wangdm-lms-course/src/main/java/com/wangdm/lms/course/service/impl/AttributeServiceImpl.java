package com.wangdm.lms.course.service.impl;

import java.io.Serializable;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangdm.core.dto.Dto;
import com.wangdm.core.query.BaseQuery;
import com.wangdm.lms.course.dto.AttributeDto;
import com.wangdm.lms.course.service.AttributeService;

@Service("attributeServie")
@Transactional
public class AttributeServiceImpl implements AttributeService {

    @Override
    public Serializable create(Dto dto) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public void update(Dto dto) {
        // TODO Auto-generated method stub

    }

    @Override
    public void delete(Serializable id) {
        // TODO Auto-generated method stub

    }

    @Override
    public AttributeDto findById(Serializable id) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<Dto> query(BaseQuery query) {
        // TODO Auto-generated method stub
        return null;
    }

}