package com.wangdm.lms.sdk.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangdm.core.constant.EntityStatus;
import com.wangdm.core.dto.StatusDto;
import com.wangdm.core.query.QueryResult;
import com.wangdm.user.dto.CertificationDto;
import com.wangdm.user.dto.GroupDto;
import com.wangdm.user.dto.RoleDto;
import com.wangdm.user.dto.UserAccountDto;
import com.wangdm.user.dto.UserPasswordDto;
import com.wangdm.user.dto.UserProfileDto;
import com.wangdm.user.dto.UserRegisterDto;
import com.wangdm.user.query.UserQuery;
import com.wangdm.user.service.UserService;

@Controller
@RequestMapping(value="/v1", produces="application/json; charset=UTF-8")
public class UserRestController extends BaseRestController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/users",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> getAllUser( HttpServletRequest request){
		int pageNum = 1;
		int pageCount = 10;
		String strParam;
		UserQuery query = new UserQuery();
		
 		strParam = request.getParameter("page");
		if (StringUtils.isNotBlank(strParam)) {
			pageNum = Integer.parseInt(strParam);
			query.setPage(pageNum);
		}
		
		strParam = request.getParameter("count");
		if (StringUtils.isNotBlank(strParam)) {
			pageCount = Integer.parseInt(strParam);
	        query.setSize(pageCount);
		}
        
        strParam = request.getParameter("name");
        if (StringUtils.isNotBlank(strParam)) {
            query.setName(strParam);
        }
        
        strParam = request.getParameter("email");
        if (StringUtils.isNotBlank(strParam)) {
            query.setEmail(strParam);
        }
        
        strParam = request.getParameter("phone");
        if (StringUtils.isNotBlank(strParam)) {
            query.setPhone(strParam);
        }
        
        strParam = request.getParameter("gid");
        if (StringUtils.isNotBlank(strParam)) {
            Long groupId = Long.parseLong(strParam);
            query.setGroup(groupId);
        }
        
        strParam = request.getParameter("status");
        if (StringUtils.isNotBlank(strParam)) {
            EntityStatus status = EntityStatus.valueOf(strParam);
            query.setStatus(status);
        }
		
        QueryResult result = userService.query(query);
		Map<String,Object> map=new HashMap<String, Object>();
        map.put("data", result.getDtoList());
        map.put("totalCount", result.getAmount());
        map.put("totalPage", result.getTotalPage());
        map.put("currentPage", result.getCurrentPage());
        map.put("currentCount", result.getCurrentSize());
        map.put("pageSize", result.getPageSize());
		
		return map;
	}
	
	@RequestMapping(value="/users",method=RequestMethod.POST)
	@ResponseBody
	public StatusDto addUser(@RequestBody UserRegisterDto user, HttpServletResponse response) throws IOException{
		if(user==null){
			response.sendError(401);
    		return new StatusDto(401, "failed", "");
		}
		
		String pwd = user.getPassword();
		if(pwd==null || !pwd.equals(user.get_password())){
            response.sendError(401);
            return new StatusDto(401, "failed", "the conform password does't match.");
		}
		
		System.out.println("add user "+user.getUsername());
		user.setPassword(DigestUtils.md5Hex(pwd));
		userService.create(user);
		
		return new StatusDto(200, "success", "");
	}
	
	@RequestMapping(value="/users/{id}",method=RequestMethod.GET)
	@ResponseBody
	public UserAccountDto getUser(@PathVariable("id") Long id, HttpServletResponse response) throws IOException{
		
		if(id==null || id.intValue()<0){
			response.sendError(401);
    		return null;
		}

		UserAccountDto user = (UserAccountDto) userService.findById(id);
		
		return user;
	}
	
	@RequestMapping(value="/users/account/{id}",method=RequestMethod.PUT)
	@ResponseBody
	public StatusDto updateUserAccount(@RequestBody UserAccountDto user, HttpServletResponse response) throws IOException{
		
		if(user==null || Long.valueOf(user.getId())<0){
			response.sendError(401);
    		return new StatusDto(401, "failed", "");
		}
		
		userService.update(user);
		
		return new StatusDto(200, "success", "");
	}	
    
    @RequestMapping(value="/users/password/{id}",method=RequestMethod.PUT)
    @ResponseBody
    public StatusDto updateUserPassword(@RequestBody UserPasswordDto dto, HttpServletRequest request,HttpServletResponse response) throws IOException{
        
        if(dto==null || Long.valueOf(dto.getId())<0){
            response.sendError(401);
            return new StatusDto(401, "failed", "");
        }
        
        String pwd = dto.getNewPassword();
        if(pwd==null || "".equals(pwd)){
            response.sendError(401);
            return new StatusDto(401, "failed", "");
        }
        
        if(!pwd.equals(dto.getRePassword())){
            response.sendError(401);
            return new StatusDto(401, "failed", "");
        }
        
        dto.setOldPassword(DigestUtils.md5Hex(dto.getOldPassword()));
        dto.setNewPassword(DigestUtils.md5Hex(dto.getNewPassword()));
        
        UserAccountDto user = (UserAccountDto)userService.findById(dto.getEntityId());
        
        if(!user.getPassword().equals(dto.getOldPassword())){
            response.sendError(401);
            return new StatusDto(401, "failed", "");
        }
        
        userService.update(dto);
        
        return new StatusDto(200, "success", "");
    }
	
	@RequestMapping(value="/users/profile/{id}",method=RequestMethod.PUT)
	@ResponseBody
	public StatusDto updateUserProfile(@RequestBody UserProfileDto dto, HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		if(dto==null || Long.valueOf(dto.getId())<0){
			response.sendError(401);
    		return new StatusDto(401, "failed", "");
		}
		
		userService.update(dto);
		
		return new StatusDto(200, "success", "");
	}
    
    @RequestMapping(value="/users/certification/{id}",method=RequestMethod.PUT)
    @ResponseBody
    public StatusDto updateUserCertification(@RequestBody CertificationDto dto, HttpServletRequest request,HttpServletResponse response) throws IOException{
        
        if(dto==null || Long.valueOf(dto.getId())<0){
            response.sendError(401);
            return new StatusDto(401, "failed", "");
        }
        
        userService.update(dto);
        
        return new StatusDto(200, "success", "");
    }
	
	@RequestMapping(value="/users/{id}",method=RequestMethod.DELETE)
	@ResponseBody
	public StatusDto delete(@PathVariable("id") Long id, HttpServletResponse response) throws IOException{
		
		if(id==null || id.intValue()<0){
			response.sendError(401);
			return null;
		}

		userService.delete(id);

		return new StatusDto(200, "success", "");
	}
    
    @RequestMapping(value="/users/{id}/erase",method=RequestMethod.DELETE)
    @ResponseBody
    public StatusDto erase(@PathVariable("id") Long id, HttpServletResponse response) throws IOException{
        
        if(id==null || id.intValue()<0){
            response.sendError(401);
            return null;
        }

        userService.erase(id);

        return new StatusDto(200, "success", "");
    }
    
    @RequestMapping(value="/users/{id}/restore",method=RequestMethod.PUT)
    @ResponseBody
    public StatusDto restore(@PathVariable("id") Long id, HttpServletResponse response) throws IOException{
        
        if(id==null || id.intValue()<0){
            response.sendError(401);
            return null;
        }

        userService.restore(id);

        return new StatusDto(200, "success", "");
    }
    
    @RequestMapping(value="/users/{id}/verify",method=RequestMethod.PUT)
    @ResponseBody
    public StatusDto verify(@PathVariable("id") Long id, HttpServletResponse response) throws IOException{
        
        if(id==null || id.intValue()<0){
            response.sendError(401);
            return null;
        }

        userService.verify(id);

        return new StatusDto(200, "success", "");
    }
    
    @RequestMapping(value="/users/{id}/forbidden",method=RequestMethod.PUT)
    @ResponseBody
    public StatusDto forbidden(@PathVariable("id") Long id, HttpServletResponse response) throws IOException{
        
        if(id==null || id.intValue()<0){
            response.sendError(401);
            return null;
        }

        userService.forbidden(id);

        return new StatusDto(200, "success", "");
    }
    
    @RequestMapping(value="/users/{id}/roles",method=RequestMethod.GET)
    @ResponseBody
    public List<RoleDto> getRole(@PathVariable("id") Long id, HttpServletResponse response) throws IOException{
        
        if(id==null || id.intValue()<0){
            response.sendError(401);
            return null;
        }

        List<RoleDto> roleList = userService.listRole(id);

        return roleList;
    }
    
    @RequestMapping(value="/users/{id}/roles",method=RequestMethod.PUT)
    @ResponseBody
    public StatusDto SetRole(@PathVariable("id") Long id, @RequestBody List<RoleDto> newRoleList, HttpServletResponse response) throws IOException{
        
        if(id==null || id.intValue()<0){
            response.sendError(401);
            return null;
        }

        List<RoleDto> roleList = userService.listRole(id);
        if(roleList==null || roleList.size()<=0){
            
            for(int i=0; i<newRoleList.size(); i++){
                RoleDto newRole = newRoleList.get(i);
                userService.assignRole(id, newRole.getEntityId());
            }
            
        }else{
        
            for(int i=0; i<newRoleList.size(); i++){
                boolean find = false;
                RoleDto newRole = newRoleList.get(i);
                for(int j=0; j<roleList.size(); j++){
                    RoleDto role = roleList.get(j);
                    if(role.getId().equals(newRole.getId())){
                        find = true;
                        break;
                    }
                }
                if(!find){
                    userService.assignRole(id, newRole.getEntityId());
                }
            }
            
            for(int i=0; i<roleList.size(); i++){
                boolean find = false;
                RoleDto role = roleList.get(i);
                for(int j=0; j<newRoleList.size(); j++){
                    RoleDto newRole = newRoleList.get(j);
                    if(role.getId().equals(newRole.getId())){
                        find = true;
                        break;
                    }
                }
                if(!find){
                    userService.removeRole(id, role.getEntityId());
                }
            }
        }

        return new StatusDto(200, "success", "");
    }
    
    @RequestMapping(value="/users/{id}/group",method=RequestMethod.PUT)
    @ResponseBody
    public StatusDto group(@PathVariable("id") Long id, @RequestBody GroupDto groupDto, HttpServletResponse response) throws IOException{
        
        if(id==null || id.intValue()<0){
            response.sendError(401);
            return null;
        }

        userService.moveGroup(id, groupDto.getEntityId());

        return new StatusDto(200, "success", "");
    }
	
}
