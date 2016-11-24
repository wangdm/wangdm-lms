package com.wangdm.lms.course.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangdm.core.service.BaseService;
import com.wangdm.lms.course.entity.Live;
import com.wangdm.lms.course.service.LiveService;

@Service("liveService")
@Transactional
public class LiveServiceImpl extends BaseService<Live> implements LiveService {

}
