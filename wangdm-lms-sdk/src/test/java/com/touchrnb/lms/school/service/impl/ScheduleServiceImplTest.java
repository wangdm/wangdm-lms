/*package com.touchrnb.lms.school.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.touchrnb.lms.school.dto.ScheduleDTO;
import com.touchrnb.lms.school.entity.Teacher;
import com.touchrnb.lms.school.query.ScheduleQuery;
import com.touchrnb.lms.school.service.ScheduleService;
import com.touchrnb.lms.school.service.TeacherService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:/spring-*.xml")
public class ScheduleServiceImplTest {

	@Autowired
	ScheduleService ss;
	@Autowired
	TeacherService teacherService;

	// @Test
	public void add() {

		for (int i = 0; i < 7; i++) {
			ScheduleDTO dto = new ScheduleDTO();
			dto.setWeekCode(i + "");
			dto.setLessonId("1");// yuwen
			dto.setGroupId("2");// 222
			dto.setRoomId("3");// 教室2
			dto.setSubjectId("2");// www
			dto.setTeacherId("2");// lisi
			ss.create(dto);
		}
	}

	@Test
	public void testFindById() {
		System.err.println(ss.findById("32"));
		;
	}

	@Test
	public void testQuery() {
		System.err.println(ss.query(null));
		;
	}

	@Test
	public void testGetScheduleByTeacher() {
		ScheduleQuery scheduleQuery = new ScheduleQuery();
		Map<String, Object> equalProperty = new HashMap<String, Object>();
		equalProperty.put("teacher", teacherService.findById(2L).toEntity(Teacher.class));
		scheduleQuery.setEqualProperty(equalProperty);
		System.err.println(ss.query(scheduleQuery));
	}

	@Test
	public void testGetScheduleByGroup() {
		// System.err.println(ss.getScheduleByGroup(2L));
	}

	@Test
	public void testGetScheduleByRoom() {
		// System.err.println(ss.getScheduleByRoom(3L));
	}

}
*/