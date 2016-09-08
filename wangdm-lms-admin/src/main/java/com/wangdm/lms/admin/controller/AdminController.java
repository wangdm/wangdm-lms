package com.wangdm.lms.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wangdm.ui.dto.MenuShowDto;
import com.wangdm.ui.service.MenuService;
import com.wangdm.user.dto.UserLoginDto;

@Controller
public class AdminController {
    
    private static Logger log = LoggerFactory.getLogger(AdminController.class);
    
    @Autowired
    MenuService menuService;
    
    @RequestMapping(value="/")
    public ModelAndView index(){
        log.debug("AdminController index");
        ModelAndView mv = new ModelAndView("index");
        
        List<MenuShowDto> memuList = menuService.showAdminMainMenu();
        mv.addObject("memulist", memuList);
        
        return mv;
    }
    
    @RequestMapping(value="/index", method=RequestMethod.GET)
    private ModelAndView listGroup(){

        ModelAndView mv = new ModelAndView("action-index");
        
        return mv;
    }
    
    @RequestMapping(value="login",method=RequestMethod.GET)
    public ModelAndView login(){
        ModelAndView mv = new ModelAndView("login");
        return mv;
    }
    
    @RequestMapping(value="login",method=RequestMethod.POST)
    public ModelAndView login(UserLoginDto loginuser){
        ModelAndView mv = new ModelAndView("login");
        log.debug(loginuser.toString());
        return mv;
    }
    
    @RequestMapping(value="/setting")
    public ModelAndView setting(){
        log.debug("AdminController index");
        ModelAndView mv = new ModelAndView("action-setting");
        return mv;
    }
}
