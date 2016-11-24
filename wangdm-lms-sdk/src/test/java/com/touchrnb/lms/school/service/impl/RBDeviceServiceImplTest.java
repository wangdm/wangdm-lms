/*package com.touchrnb.lms.school.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.touchrnb.core.dto.Dto;
import com.touchrnb.lms.school.dto.RBDeviceDTO;
import com.touchrnb.lms.school.entity.Room;
import com.touchrnb.lms.school.query.RBDeviceQuery;
import com.touchrnb.lms.school.service.RBDeviceService;
import com.touchrnb.lms.school.service.RoomService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:/spring-*.xml")

public class RBDeviceServiceImplTest {

	@Autowired
	RBDeviceService rbds;

	@Autowired
	RoomService roomService;
	@Test
	public void add() {
		for (int i = 0; i < 20; i++) {

			RBDeviceDTO dto = new RBDeviceDTO();
			dto.setName("播放器--" + i);
			dto.setSn("bfq--" + i);
			rbds.create(dto);
		}
	}

	//分页及模糊查询
	@Test
	public void query() {

		RBDeviceQuery query = new RBDeviceQuery();

		query.setCurrentPage(0);
		query.setPageSize(6);
		query.setTotalCount(rbds.query(null).size());
		Map<String, String> like = new HashMap<>();
		like.put("name", "播放器--1");
		query.setLike(like);
		System.err.println(rbds.query(query));
	}
	//分页及模糊查询
	@Test
	public void queryall() {
	
		System.err.println(rbds.query(null));
	}
	//findByColumn
	@Test
	public void findByColumn() {
		Dto room=roomService.findById("2");
		
		System.err.println(rbds.findRBDevice((Room)room.toEntity(Room.class)));
	}

}
*/