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
import com.wangdm.ui.dto.MenuDto;
import com.wangdm.ui.query.MenuQuery;
import com.wangdm.ui.service.MenuService;

@Controller
@RequestMapping(value="/v1", produces="application/json; charset=UTF-8")
public class MenuRestController extends BaseRestController {
	
	@Autowired
	MenuService menuService;
	
	@RequestMapping(value="/menus",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> getAll(HttpServletRequest request){
		int pageNum = 0;
		int pageCount = 10;
		String strParam;
		
		MenuQuery query = new MenuQuery();
		
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
		
		QueryResult result = menuService.query(query);
		Map<String,Object> map=new HashMap<String, Object>();
        if(result!=null){
            map.put("data", result.getDtoList());
            map.put("totalCount", result.getAmount());
            map.put("totalPage", result.getTotalPage());
            map.put("currentPage", result.getCurrentPage());
        }
		
		return map;
	}
	
	@RequestMapping(value="/menus",method=RequestMethod.POST)
	@ResponseBody
	public StatusDto add(@RequestBody MenuDto menu, HttpServletResponse response) throws IOException{
		if(menu==null){
			response.sendError(401);
			return null;
		}
        menu.setType("NAVIGATION");
		menuService.create(menu);
		return new StatusDto(200, "success", "");
	}
	
	@RequestMapping(value="/menus/{id}",method=RequestMethod.GET)
	@ResponseBody
	public MenuDto get(@PathVariable("id") Integer id, HttpServletResponse response) throws IOException{
		int menuId = 0;
		if(id==null || id.intValue()<0){
			response.sendError(401);
			return null;
		}else{
			menuId = id.intValue();
		}
		MenuDto menu = (MenuDto) menuService.findById(menuId);

		return menu;
	}
	
	@RequestMapping(value="/menus/{id}",method=RequestMethod.PUT)
	@ResponseBody
	public StatusDto update(@RequestBody MenuDto menu, HttpServletResponse response) throws IOException{
		if(menu==null || Long.valueOf(menu.getId())<=0){
			response.sendError(401);
			return null;
		}
		MenuDto _menu = (MenuDto) menuService.findById(Long.valueOf(menu.getId()));
		if(_menu!=null){
			menuService.update(menu);
			return new StatusDto(200, "success", "");
		}else{
			response.sendError(404);
			return new StatusDto(404, "failed", "");
		}
	}
	
	@RequestMapping(value="/menus/{id}",method=RequestMethod.DELETE)
	@ResponseBody
	public StatusDto delete(@PathVariable("id") Integer id, HttpServletResponse response) throws IOException{
		int menuId = 0;
		if(id==null || id.intValue()<0){
			response.sendError(401);
			return null;
		}else{
			menuId = id.intValue();
		}
		menuService.delete(menuId);
		return new StatusDto(200, "success", "");
	}
}
