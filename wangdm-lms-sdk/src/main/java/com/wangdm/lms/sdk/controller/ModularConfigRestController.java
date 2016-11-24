package com.wangdm.lms.sdk.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangdm.lms.config.dto.ModularConfig;
import com.wangdm.lms.config.service.ModularConfigService;

@Controller
@RequestMapping(value="/v1", produces="application/json; charset=UTF-8")
public class ModularConfigRestController {
	
	@Autowired
	ModularConfigService modularConfigService;
	
	@RequestMapping(value="/modularconfig",method=RequestMethod.GET)
	@ResponseBody
	public ModularConfig getServer(HttpServletRequest request){
	    ModularConfig config = modularConfigService.getModularConfig();
		return config;
	}
	
	@RequestMapping(value="/modularconfig",method=RequestMethod.POST)
	@ResponseBody
	public String saveServer(@RequestBody ModularConfig config){
		
		if(config!=null){
		    modularConfigService.saveModularConfig(config);
		}
		return "{\"result\":\"success\"}";
	}
}