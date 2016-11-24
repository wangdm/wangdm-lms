package com.wangdm.lms.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="")
public class GroupController {
    
    //private static Logger log = LoggerFactory.getLogger(GroupController.class);
	
    @RequestMapping(value="/listgroup", method=RequestMethod.GET)
	private ModelAndView listGroup(){

		ModelAndView mv = new ModelAndView("action-listgroup");
		
		String[] columns = {"#","用户组","角色","操作"};
		mv.addObject("columns", columns);
		
		return mv;
	}
}
