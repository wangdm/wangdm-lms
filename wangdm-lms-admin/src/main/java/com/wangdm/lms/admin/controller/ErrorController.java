package com.wangdm.lms.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ErrorController {
    
    @RequestMapping(value="/404")
    public ModelAndView error404(){
        ModelAndView mv = new ModelAndView("/error/404");
        mv.addObject("hello", "Hello Wddorld");
        return mv;
    }

}
