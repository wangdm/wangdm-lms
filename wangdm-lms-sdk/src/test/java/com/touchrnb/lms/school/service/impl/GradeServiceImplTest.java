/*package com.touchrnb.lms.school.service.impl;


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.touchrnb.core.dto.Dto;
import com.touchrnb.lms.school.service.GradeService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:/spring-*.xml")

public class GradeServiceImplTest {

	@Autowired
	@Qualifier(value="gradeService")
	GradeService gradeService;

	@Test
	public void test2() {
		
		List<Dto> dtoList = gradeService.query(null);
		for(Dto dto:dtoList){
			System.out.println(dto.toString());;
		}
	}

	
	
}
*/