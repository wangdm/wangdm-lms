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

import com.wangdm.core.dto.StatusDto;
import com.wangdm.core.query.QueryResult;
import com.wangdm.user.dto.GroupDto;
import com.wangdm.user.dto.GroupTreeDto;
import com.wangdm.user.query.GroupQuery;
import com.wangdm.user.service.GroupService;

@Controller
@RequestMapping(value="/v1", produces="application/json; charset=UTF-8")
public class GroupRestController extends BaseRestController {
	
	@Autowired
	GroupService groupService;
	
	@RequestMapping(value="/groups",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> getAll(HttpServletRequest request){

		String strParam;
		
		GroupQuery query = new GroupQuery();
		
		strParam = request.getParameter("parentId");
		if(strParam!=null && !strParam.equals("")){
			query.setParent(Long.parseLong(strParam));
		}
		
		strParam = request.getParameter("page");
		if(strParam!=null && !strParam.equals("")){
			query.setPage(Integer.parseInt(strParam));
		}
		
		strParam = request.getParameter("count");
		if(strParam!=null && !strParam.equals("")){
			query.setPage(Integer.parseInt(strParam));
		}
		
		QueryResult result = groupService.query(query);
		Map<String,Object> map=new HashMap<String, Object>();
        map.put("data", result.getDtoList());
        map.put("totalCount", result.getAmount());
        map.put("totalPage", result.getTotalPage());
        map.put("currentPage", result.getCurrentPage());
		
		return map;
	}
	
	@RequestMapping(value="/groups",method=RequestMethod.POST)
	@ResponseBody
	public StatusDto add(@RequestBody GroupDto group, HttpServletResponse response) throws IOException{
		if(group==null){
			return new StatusDto(401, "failed", "");
		}
		if(group.getParentId()!=null && Long.valueOf(group.getParentId())<=0)
		{
			return new StatusDto(401, "failed", "");
		}
		System.out.println("add category "+group.getName());
		groupService.create(group);
		return new StatusDto(200, "success", "");
	}
	
	@RequestMapping(value="/groups/{id}",method=RequestMethod.GET)
	@ResponseBody
	public GroupDto get(@PathVariable("id") Long id, HttpServletResponse response) throws IOException{
		
		if(id==null || id.intValue()<0){
			response.sendError(401);
			return null;
		}

		GroupDto group = (GroupDto) groupService.findById(id);

		return group;

	}
	
	@RequestMapping(value="/groups/{id}",method=RequestMethod.PUT)
	@ResponseBody
	public StatusDto update(@RequestBody GroupDto group, HttpServletResponse response) throws IOException{
		
		if(group==null || Long.valueOf(group.getId())<=0){
			response.sendError(401);
			return null;
		}
		
		GroupDto _group = (GroupDto) groupService.findById(Long.valueOf(group.getId()));
		if(_group!=null){
			_group.setName(group.getName());
			groupService.update(_group);
			return new StatusDto(200, "success", "");
		}else{
			response.sendError(404);
			return new StatusDto(404, "failed", "");
		}
	}
	
	@RequestMapping(value="/groups/{id}",method=RequestMethod.DELETE)
	@ResponseBody
	public StatusDto delete(@PathVariable("id") Long id, HttpServletResponse response) throws IOException{
		
		if(id==null || id.intValue()<0){
			response.sendError(401);
			return null;
		}

		groupService.delete(id);

		return new StatusDto(200, "success", "");
	}
	
    @RequestMapping(value="/allchildrengroups/{id}", method=RequestMethod.GET)
	@ResponseBody
	private GroupTreeDto getAllChildrenGroups(@PathVariable("id") Long id){
		
    	GroupTreeDto dto = groupService.getGroupTree(id);
    	
		return dto;
	}
	
    @RequestMapping(value="/directchildrengroups/{id}", method=RequestMethod.GET)
	@ResponseBody
	private List<GroupDto> getDirectChildrenGroups(@PathVariable("id") Long id){
    	
		return groupService.getChildrenGroup(id);
	}
	
}
