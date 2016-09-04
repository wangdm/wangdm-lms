package com.wangdm.lms.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wangdm.lms.admin.dto.StatusDto;
import com.wangdm.user.dto.RoleDto;

@Controller
@RequestMapping(value="")
public class RoleController {
    
    private static Logger log = LoggerFactory.getLogger(RoleController.class);
	
    @RequestMapping(value="/listrole", method=RequestMethod.GET)
	private ModelAndView listRole(){

		ModelAndView mv = new ModelAndView("action-listrole");
		
		return mv;
	}
	
    @RequestMapping(value="/roles", method=RequestMethod.POST)
	private StatusDto addRole(RoleDto roleDto){
		
		log.debug("Add role"+roleDto.toString());
		
		StatusDto status = new StatusDto();
		
		return status;
	}
	
    @RequestMapping(value="/roles", method=RequestMethod.PUT)
	private StatusDto editRole(RoleDto roleDto){
		
		log.debug("Edit role"+roleDto.toString());
		
		StatusDto status = new StatusDto();
		
		return status;
	}
	
    @RequestMapping(value="/roles/{id}", method=RequestMethod.GET)
	private RoleDto getRole(@PathVariable("id") Integer id){
		
		log.debug("Get role "+id);
		
		RoleDto roleDto = new RoleDto();
		
		return roleDto;
	}
	
    @RequestMapping(value="/roles/{id}", method=RequestMethod.DELETE)
	private StatusDto delRole(@PathVariable("id") Integer id){
		
		log.debug("Delete role "+id);
		
		StatusDto status = new StatusDto();
		
		return status;
	}

}
