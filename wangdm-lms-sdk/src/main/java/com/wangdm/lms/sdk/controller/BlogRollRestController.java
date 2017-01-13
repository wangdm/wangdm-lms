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
import com.wangdm.core.query.QueryResult;
import com.wangdm.ui.dto.BlogRollDto;
import com.wangdm.ui.query.BlogRollQuery;
import com.wangdm.ui.service.BlogRollService;

@Controller
@RequestMapping(value="/v1", produces="application/json; charset=UTF-8")
public class BlogRollRestController extends BaseRestController {
	
	@Autowired
	BlogRollService blogrollService;
	
	@RequestMapping(value="/blogrolls",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> getAll(HttpServletRequest request){
		int pageNum = 0;
		int pageCount = 10;
		String strParam;
		
		BlogRollQuery query = new BlogRollQuery();
		
		strParam = request.getParameter("page");
		if(strParam!=null && !strParam.equals("")){
			pageNum = Integer.parseInt(strParam);
		}
		query.setPage(pageNum);
		
		strParam = request.getParameter("count");
		if(strParam!=null && !strParam.equals("")){
			pageCount = Integer.parseInt(strParam);
		}
		query.setSize(pageCount);
		
		QueryResult result = blogrollService.query(query);
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("data", result.getDtoList());
		map.put("totalCount", result.getAmount());
		map.put("totalPage", result.getTotalPage());
		map.put("currentPage", result.getCurrentPage());
		
		return map;
	}
	
	@RequestMapping(value="/blogrolls",method=RequestMethod.POST)
	@ResponseBody
	public StatusDto add(@RequestBody BlogRollDto blogroll, HttpServletResponse response) throws IOException{
		if(blogroll==null){
			response.sendError(401);
			return null;
		}
		blogroll.setStatus("NORMAL");
		blogrollService.create(blogroll);
		return new StatusDto(200, "success", "");
	}
	
	@RequestMapping(value="/blogrolls/{id}",method=RequestMethod.GET)
	@ResponseBody
	public BlogRollDto get(@PathVariable("id") Integer id, HttpServletResponse response) throws IOException{
		int blogrollId = 0;
		if(id==null || id.intValue()<0){
			response.sendError(401);
			return null;
		}else{
			blogrollId = id.intValue();
		}
		BlogRollDto blogroll = (BlogRollDto) blogrollService.findById(blogrollId);

		return blogroll;
	}
	
	@RequestMapping(value="/blogrolls/{id}",method=RequestMethod.PUT)
	@ResponseBody
	public StatusDto update(@RequestBody BlogRollDto blogroll, HttpServletResponse response) throws IOException{
		if(blogroll==null || Long.valueOf(blogroll.getId())<=0){
			response.sendError(401);
			return null;
		}
		BlogRollDto _blogroll = (BlogRollDto) blogrollService.findById(Long.valueOf(blogroll.getId()));
		if(_blogroll!=null){
			blogrollService.update(blogroll);
			return new StatusDto(200, "success", "");
		}else{
			response.sendError(404);
			return new StatusDto(404, "failed", "");
		}
	}
	
	@RequestMapping(value="/blogrolls/{id}",method=RequestMethod.DELETE)
	@ResponseBody
	public StatusDto delete(@PathVariable("id") Integer id, HttpServletResponse response) throws IOException{
		int blogrollId = 0;
		if(id==null || id.intValue()<0){
			response.sendError(401);
			return null;
		}else{
			blogrollId = id.intValue();
		}
		blogrollService.erase(blogrollId);
		return new StatusDto(200, "success", "");
	}
}
