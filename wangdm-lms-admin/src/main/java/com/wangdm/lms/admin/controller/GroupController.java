package com.wangdm.lms.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wangdm.lms.admin.dto.StatusDto;
import com.wangdm.user.dto.GroupDto;

@Controller
@RequestMapping(value="")
public class GroupController {
    
    private static Logger log = LoggerFactory.getLogger(GroupController.class);
	
    @RequestMapping(value="/listgroup", method=RequestMethod.GET)
	private ModelAndView listGroup(){

		ModelAndView mv = new ModelAndView("action-listgroup");
		
		String[] columns = {"#","用户组","角色","操作"};
		mv.addObject("columns", columns);
		
		return mv;
	}
	
    @RequestMapping(value="/groups", method=RequestMethod.POST)
	private StatusDto addGroup(GroupDto groupDto){
		
		log.debug("Add group"+groupDto.toString());
		
		StatusDto status = new StatusDto();
		
		return status;
	}
	
    @RequestMapping(value="/groups", method=RequestMethod.PUT)
	private StatusDto editGroup(GroupDto groupDto){
		
		log.debug("Edit group"+groupDto.toString());
		
		StatusDto status = new StatusDto();
		
		return status;
	}
	
    @RequestMapping(value="/groups/{id}", method=RequestMethod.GET)
	private GroupDto getGroup(@PathVariable("id") Integer id){
		
		log.debug("Get group "+id);
		
		GroupDto groupDto = new GroupDto();
		
		return groupDto;
	}
	
    @RequestMapping(value="/groups/{id}", method=RequestMethod.DELETE)
	private StatusDto delGroup(@PathVariable("id") Integer id){
		
		log.debug("Delete group "+id);
		
		StatusDto status = new StatusDto();
		
		return status;
	}

}
