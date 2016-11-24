package com.wangdm.lms.sdk.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ExceptionController {
    
    @RequestMapping(value="/exception")
    public String exception(){
        return "{message:exception}";
    }
}
