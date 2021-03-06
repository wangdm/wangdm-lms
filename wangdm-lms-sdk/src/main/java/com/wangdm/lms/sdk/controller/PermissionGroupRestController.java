package com.wangdm.lms.sdk.controller;

import java.io.IOException;
import java.util.HashMap;
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

import com.wangdm.core.dto.StatusDto;
import com.wangdm.core.query.PageQuery;
import com.wangdm.core.query.QueryResult;
import com.wangdm.user.dto.PermissionGroupDto;
import com.wangdm.user.service.PermissionGroupService;

@Controller
@RequestMapping(value="/v1", produces="application/json; charset=UTF-8")
public class PermissionGroupRestController extends BaseRestController {
	
	@Autowired
	PermissionGroupService permissionGroupService;
	
	@RequestMapping(value="/permissiongroups",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> getAll(HttpServletRequest request){
		
		String strParam;
		
		PageQuery query = new PageQuery();
		
		strParam = request.getParameter("page");
		if(strParam!=null && !strParam.equals("")){
			query.setPage(Integer.parseInt(strParam));
		}
		
		strParam = request.getParameter("count");
		if(strParam!=null && !strParam.equals("")){
			query.setSize(Integer.parseInt(strParam));
		}
		
		QueryResult result = permissionGroupService.query(query);
		Map<String,Object> map=new HashMap<String, Object>();
        map.put("data", result.getDtoList());
        map.put("totalCount", result.getAmount());
        map.put("totalPage", result.getTotalPage());
        map.put("currentPage", result.getCurrentPage());
        map.put("currentCount", result.getCurrentSize());
		map.put("pageSize", result.getPageSize());
		
		return map;
	}
	
	@RequestMapping(value="/permissiongroups",method=RequestMethod.POST)
	@ResponseBody
	public StatusDto add(@RequestBody PermissionGroupDto permissionGroup, HttpServletResponse response) throws IOException{
		if(permissionGroup==null){
			response.sendError(401);
			return null;
		}
		System.out.println("add permissionGroup "+permissionGroup.getName());
		permissionGroupService.create(permissionGroup);
		return new StatusDto(200, "success", "");
	}
	
	@RequestMapping(value="/permissiongroups/{id}",method=RequestMethod.GET)
	@ResponseBody
	public PermissionGroupDto get(@PathVariable("id") Long id, HttpServletResponse response) throws IOException{
		
		if(id==null || id.intValue()<0){
			response.sendError(401);
			return null;
		}
		
		PermissionGroupDto permissionGroup = (PermissionGroupDto) permissionGroupService.findById(id);

		return permissionGroup;
	}
	
	@RequestMapping(value="/permissiongroups/{id}",method=RequestMethod.PUT)
	@ResponseBody
	public StatusDto update(@RequestBody PermissionGroupDto permissionGroup, HttpServletResponse response) throws IOException{
		
		if(permissionGroup==null || Long.valueOf(permissionGroup.getId())<=0){
			response.sendError(401);
			return new StatusDto(404, "failed", "");
		}
		
		PermissionGroupDto _permissionGroup = (PermissionGroupDto) permissionGroupService.findById(Long.valueOf(permissionGroup.getId()));
		if(_permissionGroup!=null){
			_permissionGroup.setName(permissionGroup.getName());
			_permissionGroup.setDesc(permissionGroup.getDesc());
			permissionGroupService.update(_permissionGroup);
			return new StatusDto(200, "success", "");
		}else{
			response.sendError(404);
			return new StatusDto(404, "failed", "");
		}
	}
	
	@RequestMapping(value="/permissiongroups/{id}",method=RequestMethod.DELETE)
	@ResponseBody
	public StatusDto delete(@PathVariable("id") Long id, HttpServletResponse response) throws IOException{
		
		if(id==null || id.intValue()<0){
			response.sendError(401);
			return null;
		}
		permissionGroupService.delete(id);

		return new StatusDto(200, "success", "");
	}
}
