package com.wangdm.lms.sdk.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangdm.lms.config.dto.SystemSetting;
import com.wangdm.lms.config.service.SystemSettingService;

@Controller
@RequestMapping(value="/v1", produces="application/json; charset=UTF-8")
public class SystemSettingRestController {
	
	@Autowired
	SystemSettingService systemSettingService;
	
	@RequestMapping(value="/systemsetting",method=RequestMethod.GET)
	@ResponseBody
	public SystemSetting getSystemSetting(HttpServletRequest request){
	    SystemSetting setting = systemSettingService.getSystemSetting();
		return setting;
	}
	
	@RequestMapping(value="/systemsetting",method=RequestMethod.POST)
	@ResponseBody
	public String saveSystemSetting(@RequestBody SystemSetting setting){
		
		if(setting!=null){
		    systemSettingService.saveSystemSetting(setting);
		}
		return "{\"result\":\"success\"}";
	}
}