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
import com.wangdm.ui.dto.HotspotDto;
import com.wangdm.ui.query.HotspotQuery;
import com.wangdm.ui.service.HotspotService;

@Controller
@RequestMapping(value="/v1", produces="application/json; charset=UTF-8")
public class HotspotRestController extends BaseRestController {
	
	@Autowired
	HotspotService hotspotService;
	
	@RequestMapping(value="/hotspots",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> getAll(HttpServletRequest request){
		int pageNum = 0;
		int pageCount = 10;
		String strParam;
		
		HotspotQuery query = new HotspotQuery();
		
		strParam = request.getParameter("page");
		if(strParam!=null && !strParam.equals("")){
			pageNum = Integer.parseInt(strParam);
		}
		query.setCurrentPage(pageNum);
		
		strParam = request.getParameter("count");
		if(strParam!=null && !strParam.equals("")){
			pageCount = Integer.parseInt(strParam);
		}
		query.setPageSize(pageCount);
		
		List<Dto> data = hotspotService.query(query);
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("data", data);
		map.put("totalCount", query.getTotalPage());
		map.put("totalPage", query.getTotalPage());
		map.put("currentPage", query.getCurrentPage());
		
		return map;
	}
	
	@RequestMapping(value="/hotspots",method=RequestMethod.POST)
	@ResponseBody
	public StatusDto add(@RequestBody HotspotDto hotspot, HttpServletResponse response) throws IOException{
		if(hotspot==null){
			response.sendError(401);
			return null;
		}
		hotspot.setStatus("NORMAL");
		hotspotService.create(hotspot);
		return new StatusDto(200, "success", "");
	}
	
	@RequestMapping(value="/hotspots/{id}",method=RequestMethod.GET)
	@ResponseBody
	public HotspotDto get(@PathVariable("id") Integer id, HttpServletResponse response) throws IOException{
		int hotspotId = 0;
		if(id==null || id.intValue()<0){
			response.sendError(401);
			return null;
		}else{
			hotspotId = id.intValue();
		}
		HotspotDto hotspot = (HotspotDto) hotspotService.findById(hotspotId);

		return hotspot;
	}
	
	@RequestMapping(value="/hotspots/{id}",method=RequestMethod.PUT)
	@ResponseBody
	public StatusDto update(@RequestBody HotspotDto hotspot, HttpServletResponse response) throws IOException{
		if(hotspot==null || Long.valueOf(hotspot.getId())<=0){
			response.sendError(401);
			return null;
		}
		HotspotDto _hotspot = (HotspotDto) hotspotService.findById(Long.valueOf(hotspot.getId()));
		if(_hotspot!=null){
			_hotspot.setTitle(hotspot.getTitle());
			_hotspot.setIdx(hotspot.getIdx());
			_hotspot.setUrl(hotspot.getUrl());
			_hotspot.setImage(hotspot.getImage());
			_hotspot.setExpireTime(hotspot.getExpireTime());
			_hotspot.setDisplay(hotspot.getDisplay());
			hotspotService.update(hotspot);
			return new StatusDto(200, "success", "");
		}else{
			response.sendError(404);
			return new StatusDto(404, "failed", "");
		}
	}
	
	@RequestMapping(value="/hotspots/{id}",method=RequestMethod.DELETE)
	@ResponseBody
	public StatusDto delete(@PathVariable("id") Integer id, HttpServletResponse response) throws IOException{
		int hotspotId = 0;
		if(id==null || id.intValue()<0){
			response.sendError(401);
			return null;
		}else{
			hotspotId = id.intValue();
		}
		hotspotService.erase(hotspotId);
		return new StatusDto(200, "success", "");
	}
}
