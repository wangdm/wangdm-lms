package com.wangdm.lms.course.service.impl;

import java.io.Serializable;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangdm.core.dto.Dto;
import com.wangdm.core.query.Query;
import com.wangdm.core.query.QueryResult;
import com.wangdm.core.service.BaseService;
import com.wangdm.lms.course.dto.CategoryDto;
import com.wangdm.lms.course.entity.Course;
import com.wangdm.lms.course.service.CourseService;

@Service("courseService")
@Transactional
public class CourseServiceImpl extends BaseService<Course> implements CourseService {

    @Override
    public Serializable create(Dto dto) {
        return null;
    }

    @Override
    public void update(Dto dto) {

    }

    @Override
    public void delete(Serializable id) {

    }

    @Override
    public CategoryDto findById(Serializable id) {
        return null;
    }

    @Override
    public QueryResult query(Query query) {
        return null;
    }

}
