package com.wangdm.lms.sdk.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangdm.lms.config.dto.SystemInfo;
import com.wangdm.lms.config.service.SystemInfoService;

@Controller
@RequestMapping(value="/v1", produces="application/json; charset=UTF-8")
public class SystemInfoRestController {
	
	@Autowired
	SystemInfoService systemInfoService;
	
	@RequestMapping(value="/systeminfo",method=RequestMethod.GET)
	@ResponseBody
	public SystemInfo getServer(HttpServletRequest request){
		SystemInfo system = systemInfoService.getSystemInfo();
		return system;
	}
	
	@RequestMapping(value="/systeminfo",method=RequestMethod.POST)
	@ResponseBody
	public String saveServer(@RequestBody SystemInfo system){
		
		if(system!=null){
			systemInfoService.saveSystemInfo(system);
		}
		return "{\"result\":\"success\"}";
	}
}