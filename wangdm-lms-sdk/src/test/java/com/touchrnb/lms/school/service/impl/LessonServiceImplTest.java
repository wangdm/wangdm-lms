/*package com.touchrnb.lms.school.service.impl;

import static org.junit.Assert.fail;

import java.sql.Timestamp;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.touchrnb.core.dto.Dto;
import com.touchrnb.lms.school.dto.LessonDTO;
import com.touchrnb.lms.school.service.LessonService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:/spring-*.xml")

public class LessonServiceImplTest {

	@Autowired
	LessonService ls;
	@Test
	public void testFindById() {
		System.err.println(ls.findById(1L));
	}

	@Test
	public void testQuery() {
		System.err.println(ls.query(null));
	}

	@Test
	public void testCheckLessonTime() {
		fail("Not yet implemented");
	}

	@Test
	public void testReIndexLesson() {
		ls.reIndexLesson();
	}
	@Test
	public void add() {
		LessonDTO dto=new LessonDTO();
		dto.setName("shuxue");
		dto.setStarttime( Timestamp.valueOf("2016-12-12 12:12:13"));
		dto.setEndtime(Timestamp.valueOf("2016-12-12 12:12:13"));
		ls.create(dto);
	}

}
*/