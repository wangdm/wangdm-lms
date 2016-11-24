package com.wangdm.lms.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="")
public class PermissionController {
    
    //private static Logger log = LoggerFactory.getLogger(PermissionController.class);
	
    @RequestMapping(value="/listpermission", method=RequestMethod.GET)
	private ModelAndView listRole(){

		ModelAndView mv = new ModelAndView("action-listpermission");
		
		return mv;
	}
}
