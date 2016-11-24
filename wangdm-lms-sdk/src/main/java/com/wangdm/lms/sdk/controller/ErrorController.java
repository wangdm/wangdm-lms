package com.wangdm.lms.sdk.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ErrorController {
    
    @RequestMapping(value="/404")
    public String error404(){
        return "{message:error}";
    }

}
