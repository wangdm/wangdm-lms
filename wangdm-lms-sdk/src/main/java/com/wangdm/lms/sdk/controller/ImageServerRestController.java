package com.wangdm.lms.sdk.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangdm.lms.config.dto.ImageServer;
import com.wangdm.lms.config.service.ImageServerService;

@Controller
@RequestMapping(value="/v1", produces="application/json; charset=UTF-8")
public class ImageServerRestController {
	
	@Autowired
	ImageServerService imageServerService;
	
	@RequestMapping(value="/imageserver",method=RequestMethod.GET)
	@ResponseBody
	public ImageServer getServer(HttpServletRequest request){
		ImageServer config = imageServerService.getImageServer();
		return config;
	}
	
	@RequestMapping(value="/imageserver",method=RequestMethod.POST)
	@ResponseBody
	public String saveServer(@RequestBody ImageServer config){
		
		if(config!=null){
		    imageServerService.saveImageServer(config);
		}
		return "{\"result\":\"success\"}";
	}
}