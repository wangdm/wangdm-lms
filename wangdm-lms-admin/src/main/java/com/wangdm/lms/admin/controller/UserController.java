package com.wangdm.lms.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wangdm.core.dto.Dto;
import com.wangdm.core.query.BaseQuery;
import com.wangdm.user.service.RoleService;

@Controller
@RequestMapping(value="")
public class UserController {
    
    //private static Logger log = LoggerFactory.getLogger(UserController.class);
    @Autowired
    RoleService roleService;
	
	@RequestMapping(value="/listuser", method=RequestMethod.GET)
	public ModelAndView listuser(){
		
		ModelAndView mv = new ModelAndView("action-listuser");
		
        BaseQuery query = new BaseQuery();
        List<Dto> roleList = roleService.query(query);
        mv.addObject("roleList", roleList);
		
		return mv;
	}
}
