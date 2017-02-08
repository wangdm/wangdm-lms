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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangdm.core.dto.StatusDto;
import com.wangdm.core.query.QueryResult;
import com.wangdm.lms.course.dto.CourseDto;
import com.wangdm.lms.course.query.CourseQuery;
import com.wangdm.lms.course.service.CourseService;

@Controller
@RequestMapping(value = "/v1", produces = "application/json; charset=UTF-8")
public class CourseRestController extends BaseRestController {

    @Autowired
    CourseService courseService;
    
    @RequestMapping(value="/courses",method=RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> getAll(@RequestParam("query") String querystr, HttpServletRequest request){
        
        CourseQuery query = new CourseQuery();
        QueryResult result = courseService.query(query);
        Map<String,Object> map=new HashMap<String, Object>();
        if(result!=null){
            map.put("data", result.getDtoList());
            map.put("totalCount", result.getAmount());
            map.put("totalPage", result.getTotalPage());
            map.put("currentPage", result.getCurrentPage());
        }
        
        return map;
    }
    
    @RequestMapping(value="/courses",method=RequestMethod.POST)
    @ResponseBody
    public StatusDto add(@RequestBody CourseDto course, HttpServletResponse response) throws IOException{
        if(course==null){
            response.sendError(401);
            return null;
        }
        course.setStatus("NORMAL");
        courseService.create(course);
        return new StatusDto(200, "success", "");
    }
    
    @RequestMapping(value="/courses/{id}",method=RequestMethod.GET)
    @ResponseBody
    public CourseDto get(@PathVariable("id") Integer id, HttpServletResponse response) throws IOException{
        int courseId = 0;
        if(id==null || id.intValue()<0){
            response.sendError(401);
            return null;
        }else{
            courseId = id.intValue();
        }
        CourseDto course = (CourseDto) courseService.findById(courseId);

        return course;
    }
    
    @RequestMapping(value="/courses/{id}",method=RequestMethod.PUT)
    @ResponseBody
    public StatusDto update(@RequestBody CourseDto course, HttpServletResponse response) throws IOException{
        if(course==null || course.getEntityId()<=0){
            response.sendError(401);
            return null;
        }
        CourseDto _course = (CourseDto) courseService.findById(course.getEntityId());
        if(_course!=null){
            courseService.update(course);
            return new StatusDto(200, "success", "");
        }else{
            response.sendError(404);
            return new StatusDto(404, "failed", "");
        }
    }
    
    @RequestMapping(value="/courses/{id}",method=RequestMethod.DELETE)
    @ResponseBody
    public StatusDto delete(@PathVariable("id") Integer id, HttpServletResponse response) throws IOException{
        int courseId = 0;
        if(id==null || id.intValue()<0){
            response.sendError(401);
            return null;
        }else{
            courseId = id.intValue();
        }
        courseService.erase(courseId);
        return new StatusDto(200, "success", "");
    }
    
}
