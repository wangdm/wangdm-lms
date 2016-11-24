package com.wangdm.lms.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/error")
public class ErrorController {
    
    @RequestMapping(value="/exception")
    public ModelAndView exception(){
        ModelAndView mv = new ModelAndView("/error/exception");
        mv.addObject("hello", "Hello World");
        return mv;
    }
    
    
    @RequestMapping(value="/404")
    public ModelAndView error404(){
        ModelAndView mv = new ModelAndView("/error/404");
        mv.addObject("hello", "Hello World");
        return mv;
    }
    
    
    @RequestMapping(value="/403")
    public ModelAndView error403(){
        ModelAndView mv = new ModelAndView("/error/403");
        mv.addObject("hello", "Hello World");
        return mv;
    }

}
