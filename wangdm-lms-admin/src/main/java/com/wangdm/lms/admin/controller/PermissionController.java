package com.wangdm.lms.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wangdm.lms.admin.dto.StatusDto;
import com.wangdm.user.dto.PermissionDto;

@Controller
@RequestMapping(value="")
public class PermissionController {
    
    private static Logger log = LoggerFactory.getLogger(PermissionController.class);
	
    @RequestMapping(value="/listpermission", method=RequestMethod.GET)
	private ModelAndView listRole(){

		ModelAndView mv = new ModelAndView("action-listpermission");
		
		return mv;
	}
	
    @RequestMapping(value="/permissions", method=RequestMethod.POST)
	private StatusDto addRole(PermissionDto permissionDto){
		
		log.debug("Add permission"+permissionDto.toString());
		
		StatusDto status = new StatusDto();
		
		return status;
	}
	
    @RequestMapping(value="/permissions", method=RequestMethod.PUT)
	private StatusDto editRole(PermissionDto permissionDto){
		
		log.debug("Edit permission"+permissionDto.toString());
		
		StatusDto status = new StatusDto();
		
		return status;
	}
	
    @RequestMapping(value="/permissions/{id}", method=RequestMethod.GET)
	private PermissionDto getRole(@PathVariable("id") Integer id){
		
		log.debug("Get permission "+id);
		
		PermissionDto permissionDto = new PermissionDto();
		
		return permissionDto;
	}
	
    @RequestMapping(value="/permissions/{id}", method=RequestMethod.DELETE)
	private StatusDto delRole(@PathVariable("id") Integer id){
		
		log.debug("Delete permission "+id);
		
		StatusDto status = new StatusDto();
		
		return status;
	}

}
