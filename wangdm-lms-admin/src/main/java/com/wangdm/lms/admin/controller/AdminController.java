package com.wangdm.lms.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wangdm.ui.dto.MenuShowDto;
import com.wangdm.ui.service.MenuService;

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
}
