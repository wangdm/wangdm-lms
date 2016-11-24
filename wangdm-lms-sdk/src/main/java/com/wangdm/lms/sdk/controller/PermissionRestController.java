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
import com.wangdm.user.dto.PermissionDto;
import com.wangdm.user.query.PermissionQuery;
import com.wangdm.user.service.PermissionService;

@Controller
@RequestMapping(value="/v1", produces="application/json; charset=UTF-8")
public class PermissionRestController extends BaseRestController {
	
	@Autowired
	PermissionService permissionService;
	
	@RequestMapping(value="/permissions",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> getAll(HttpServletRequest request){
		
		String strParam;
		
		PermissionQuery query = new PermissionQuery();
		
		strParam = request.getParameter("groupId");
		if(strParam!=null && !strParam.equals("")){
			query.setGroupId(Long.parseLong(strParam));
		}
		
		strParam = request.getParameter("count");
		if(strParam!=null && !strParam.equals("")){
			query.setPageSize(Integer.parseInt(strParam));
		}
		
		List<Dto> data = permissionService.query(query);
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("data", data);
		map.put("totalCount", query.getTotalCount());
		map.put("totalPage", query.getTotalPage());
		map.put("currentPage", query.getCurrentPage());
		if(data!=null){
			map.put("currentCount", data.size());
		}else{
			map.put("currentCount", 0);
		}
		map.put("pageSize", query.getPageSize());
		
		return map;
	}
	
	@RequestMapping(value="/permissions",method=RequestMethod.POST)
	@ResponseBody
	public StatusDto add(@RequestBody PermissionDto permission, HttpServletResponse response) throws IOException{
		if(permission==null){
			response.sendError(401);
			return null;
		}
		System.out.println("add permission "+permission.getName());
		permissionService.create(permission);
		return new StatusDto(200, "success", "");
	}
	
	@RequestMapping(value="/permissions/{id}",method=RequestMethod.GET)
	@ResponseBody
	public PermissionDto get(@PathVariable("id") Long id, HttpServletResponse response) throws IOException{
		
		if(id==null || id.intValue()<0){
			response.sendError(401);
			return null;
		}
		
		PermissionDto permission = (PermissionDto) permissionService.findById(id);

		return permission;
	}
	
	@RequestMapping(value="/permissions/{id}",method=RequestMethod.PUT)
	@ResponseBody
	public StatusDto update(@RequestBody PermissionDto permission, HttpServletResponse response) throws IOException{
		
		if(permission==null || Long.valueOf(permission.getId())<=0){
			response.sendError(401);
			return new StatusDto(404, "failed", "");
		}
		
		PermissionDto _permission = (PermissionDto) permissionService.findById(Long.valueOf(permission.getId()));
		if(_permission!=null){
			_permission.setTitle(permission.getTitle());
			_permission.setDesc(permission.getDesc());
			permissionService.update(_permission);
			return new StatusDto(200, "success", "");
		}else{
			response.sendError(404);
			return new StatusDto(404, "failed", "");
		}
	}
	
	@RequestMapping(value="/permissions/{id}",method=RequestMethod.DELETE)
	@ResponseBody
	public StatusDto delete(@PathVariable("id") Long id, HttpServletResponse response) throws IOException{
		
		if(id==null || id.intValue()<0){
			response.sendError(401);
			return null;
		}
		permissionService.delete(id);

		return new StatusDto(200, "success", "");
	}
}
