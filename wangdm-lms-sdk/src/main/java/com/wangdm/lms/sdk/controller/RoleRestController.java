package com.wangdm.lms.sdk.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangdm.core.dto.Dto;
import com.wangdm.core.dto.StatusDto;
import com.wangdm.core.query.BaseQuery;
import com.wangdm.user.dto.PermissionDto;
import com.wangdm.user.dto.RoleDto;
import com.wangdm.user.service.RoleService;

@Controller
@RequestMapping(value="/v1", produces="application/json; charset=UTF-8")
public class RoleRestController extends BaseRestController {
	
	@Autowired
	RoleService roleService;
	
	@RequestMapping(value="/roles",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> getAll(HttpServletRequest request){
		
		String strParam;
		
		BaseQuery query = new BaseQuery();
		
		strParam = request.getParameter("page");
		if(strParam!=null && !strParam.equals("")){
			query.setCurrentPage(Integer.parseInt(strParam));
		}
		
		strParam = request.getParameter("count");
		if(strParam!=null && !strParam.equals("")){
			query.setPageSize(Integer.parseInt(strParam));
		}
		
		List<Dto> data = roleService.query(query);
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("data", data);
		map.put("totalCount", query.getTotalCount());
		map.put("totalPage", query.getTotalPage());
		map.put("currentPage", query.getCurrentPage());
		map.put("currentCount", data.size());
		map.put("pageSize", query.getPageSize());
		
		return map;
	}
	
	@RequestMapping(value="/roles",method=RequestMethod.POST)
	@ResponseBody
	public StatusDto add(@RequestBody RoleDto role, HttpServletResponse response) throws IOException{
		if(role==null){
			response.sendError(401);
			return null;
		}
		System.out.println("add role "+role.getName());
		roleService.create(role);
		return new StatusDto(200, "success", "");
	}
	
	@RequestMapping(value="/roles/{id}",method=RequestMethod.GET)
	@ResponseBody
	public RoleDto get(@PathVariable("id") Long id, HttpServletResponse response) throws IOException{
		
		if(id==null || id.intValue()<0){
			response.sendError(401);
			return null;
		}
		
		RoleDto role = (RoleDto) roleService.findById(id);

		return role;
	}
	
	@RequestMapping(value="/roles/{id}",method=RequestMethod.PUT)
	@ResponseBody
	public StatusDto update(@RequestBody RoleDto role, HttpServletResponse response) throws IOException{
		
		if(role==null || Long.valueOf(role.getId())<=0){
			response.sendError(401);
			return new StatusDto(404, "failed", "");
		}
		
		RoleDto _role = (RoleDto) roleService.findById(Long.valueOf(role.getId()));
		if(_role!=null){
			_role.setTitle(role.getTitle());
			_role.setDesc(role.getDesc());
			roleService.update(_role);
			return new StatusDto(200, "success", "");
		}else{
			response.sendError(404);
			return new StatusDto(404, "failed", "");
		}
	}
	
	@RequestMapping(value="/roles/{id}",method=RequestMethod.DELETE)
	@ResponseBody
	public StatusDto delete(@PathVariable("id") Long id, HttpServletResponse response) throws IOException{
		
		if(id==null || id.intValue()<0){
			response.sendError(401);
			return null;
		}
		roleService.delete(id);

		return new StatusDto(200, "success", "");
	}
	
	@RequestMapping(value="/roles/{id}/permissions",method=RequestMethod.GET)
	@ResponseBody
	public List<PermissionDto> getPermission(@PathVariable("id") Long id, HttpServletResponse response) throws IOException{
		
		if(id==null || id.intValue()<0){
			response.sendError(401);
			return null;
		}

		return roleService.getPermission(id);
	}
	
	@RequestMapping(value="/roles/{id}/permissions",method=RequestMethod.PUT)
	@ResponseBody
	public StatusDto setPermission(@PathVariable("id") Long id, @RequestBody List<PermissionDto> permList, HttpServletResponse response) throws IOException{
		
		if(id==null || id.intValue()<0){
			response.sendError(401);
			return null;
		}
		
		roleService.setPermission(id, permList);

		return new StatusDto(200, "success", "");
	}
}
