package com.wangdm.lms.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wangdm.lms.admin.dto.StatusDto;
import com.wangdm.user.dto.CertificationDto;
import com.wangdm.user.dto.UserAccountDto;
import com.wangdm.user.dto.UserProfileDto;

@Controller
@RequestMapping(value="")
public class UserController {
    
    private static Logger log = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping(value="/listuser", method=RequestMethod.GET)
	public ModelAndView listuser(){
		
		ModelAndView mv = new ModelAndView("action-listuser");
		
		return mv;
	}
	
	@RequestMapping(value="/user/accounts", method=RequestMethod.POST)
	public StatusDto addUserAccount(UserAccountDto accountDto){
		
		log.debug("Add user account"+accountDto.toString());
		
		StatusDto status = new StatusDto();
		
		return status;
	}
	
	@RequestMapping(value="/user/accounts/{id}", method=RequestMethod.DELETE)
	public StatusDto delUserAccount(@PathVariable("id") Integer id){
		
		log.debug("Delete user "+id.toString());
		
		StatusDto status = new StatusDto();
		
		return status;
	}
	
	@RequestMapping(value="/user/accounts/{id}", method=RequestMethod.GET)
	public UserAccountDto getUserAccount(@PathVariable("id") Integer id){
		
		UserAccountDto accountDto = new UserAccountDto();
		
		return accountDto;
	}
	
	@RequestMapping(value="/user/accounts/{id}", method=RequestMethod.PUT)
	public StatusDto editUserAccount(UserAccountDto accountDto){
		
		log.debug("Edit user account "+accountDto.toString());
		
		StatusDto status = new StatusDto();
		
		return status;
	}
	
	@RequestMapping(value="/user/profiles/{id}", method=RequestMethod.PUT)
	public StatusDto editUserProfile(UserProfileDto profileDto){
		
		log.debug("Edit user profile "+profileDto.toString());
		
		StatusDto status = new StatusDto();
		
		return status;
	}
	
	@RequestMapping(value="/user/profiles/{id}", method=RequestMethod.GET)
	public UserProfileDto getUserProfile(@PathVariable("id") Integer id){
		
		UserProfileDto profileDto = new UserProfileDto();
		
		return profileDto;
	}
	
	@RequestMapping(value="/user/certification/{id}", method=RequestMethod.POST)
	public StatusDto addCertification(CertificationDto certificationDto){
		
		log.debug("Add user certification "+certificationDto.toString());
		
		StatusDto status = new StatusDto();
		
		return status;
	}
	
	@RequestMapping(value="/user/certification/{id}", method=RequestMethod.PUT)
	public StatusDto editCertification(CertificationDto certificationDto){
		
		log.debug("Edit user certification "+certificationDto.toString());
		
		StatusDto status = new StatusDto();
		
		return status;
	}
	
	@RequestMapping(value="/user/certification/{id}", method=RequestMethod.GET)
	public CertificationDto getCertification(@PathVariable("id") Integer id){
		
		CertificationDto certificationDto = new CertificationDto();
		
		return certificationDto;
	}

}
