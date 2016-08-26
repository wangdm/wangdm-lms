package com.wangdm.lms.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ExceptionController {
    
    @RequestMapping(value="/exception")
    public ModelAndView error404(){
        ModelAndView mv = new ModelAndView("/error/exception");
        mv.addObject("hello", "Hello World");
        return mv;
    }
}
