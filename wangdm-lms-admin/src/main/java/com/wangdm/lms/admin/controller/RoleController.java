package com.wangdm.lms.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wangdm.core.dto.Dto;
import com.wangdm.core.query.PageQuery;
import com.wangdm.user.dto.PermissionGroupDto;
import com.wangdm.user.query.PermissionQuery;
import com.wangdm.user.service.PermissionGroupService;
import com.wangdm.user.service.PermissionService;

@Controller
@RequestMapping(value="")
public class RoleController {
    
    //private static Logger log = LoggerFactory.getLogger(RoleController.class);
    
	@Autowired
	PermissionGroupService permissionGroupService;
	
	@Autowired
	PermissionService permissionService;
	
    @RequestMapping(value="/listrole", method=RequestMethod.GET)
	private ModelAndView listRole(){

		ModelAndView mv = new ModelAndView("action-listrole");

		PermissionQuery query = new PermissionQuery();
		
		List<Dto> permissionGroupList = permissionGroupService.query(new PageQuery()).getDtoList();
		for(int i=0; i<permissionGroupList.size(); i++ ){
			PermissionGroupDto groupDto = (PermissionGroupDto)permissionGroupList.get(i);
			query.setGroup(Long.parseLong(groupDto.getId()));
			groupDto.setPermList(permissionService.query(query).getDtoList());
			
		}
        mv.addObject("permissionGroupList", permissionGroupList);
        
		return mv;
	}
}
