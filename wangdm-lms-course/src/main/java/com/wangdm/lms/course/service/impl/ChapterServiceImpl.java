package com.wangdm.lms.course.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangdm.core.service.BaseService;
import com.wangdm.lms.course.entity.Chapter;
import com.wangdm.lms.course.service.ChapterService;

@Service("chapterService")
@Transactional
public class ChapterServiceImpl extends BaseService<Chapter> implements ChapterService {


}
