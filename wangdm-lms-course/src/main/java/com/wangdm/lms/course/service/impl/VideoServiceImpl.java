package com.wangdm.lms.course.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangdm.core.service.BaseService;
import com.wangdm.lms.course.entity.Video;
import com.wangdm.lms.course.service.VideoService;

@Service("videoService")
@Transactional
public class VideoServiceImpl extends BaseService<Video> implements VideoService {

}
