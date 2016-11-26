package com.wangdm.lms.sdk.controller;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangdm.core.dto.StatusDto;
import com.wangdm.lms.course.dto.AttributeNameDto;
import com.wangdm.lms.course.dto.AttributeValueDto;
import com.wangdm.lms.course.dto.CategoryDto;
import com.wangdm.lms.course.service.AttributeService;
import com.wangdm.lms.course.service.CategoryService;

@Controller
@RequestMapping(value="/v1", produces="application/json; charset=UTF-8")
public class CategoryRestController extends BaseRestController {

    @Autowired
    CategoryService categoryService;
    
    @Autowired
    AttributeService attributeService;
    
    @RequestMapping(value="/category/{id}/tree",method=RequestMethod.GET)
    @ResponseBody
    public CategoryDto getTree(@PathVariable("id") Long id){
        
        if(id==null || id <=0){
            return null;
        }
        
        CategoryDto dto = categoryService.getCategoryTree(id);
        return dto;
    }    
    
    @RequestMapping(value="/category/{id}/children",method=RequestMethod.GET)
    @ResponseBody
    public List<CategoryDto> getChildren(@PathVariable("id") Long id){
        
        if(id==null || id <=0){
            return null;
        }
        
        List<CategoryDto> dtoList = categoryService.getChildren(id);
        return dtoList;
    }      
    
    @RequestMapping(value="/category/{id}/ancestors",method=RequestMethod.GET)
    @ResponseBody
    public List<CategoryDto> getAncestors(@PathVariable("id") Long id){
        
        if(id==null || id <=0){
            return null;
        }
        
        List<CategoryDto> dtoList = categoryService.getAncestors(id);
        return dtoList;
    }       
    
    @RequestMapping(value="/category/{id}/attributes",method=RequestMethod.GET)
    @ResponseBody
    public List<AttributeNameDto> getAttributes(@PathVariable("id") Long id){
        
        if(id==null || id <=0){
            return null;
        }
        
        List<AttributeNameDto> dtoList = categoryService.getCategorySelfAttribute(id);
        return dtoList;
    }        
    
    @RequestMapping(value="/category",method=RequestMethod.POST)
    @ResponseBody
    public StatusDto createCategory(@RequestBody CategoryDto dto){
        
        categoryService.create(dto);

        return new StatusDto(200, "success", "");
    }    
    
    @RequestMapping(value="/category/{id}",method=RequestMethod.PUT)
    @ResponseBody
    public StatusDto editCategory(@RequestBody CategoryDto dto){
        
        categoryService.update(dto);

        return new StatusDto(200, "success", "");
    }    
    
    @RequestMapping(value="/category/{id}",method=RequestMethod.DELETE)
    @ResponseBody
    public StatusDto deleteCategory(@PathVariable("id") Long id){
        
        categoryService.delete(id);

        return new StatusDto(200, "success", "");
    }        
    
    @RequestMapping(value="/attribute",method=RequestMethod.POST)
    @ResponseBody
    public StatusDto createAttribute(@RequestBody AttributeNameDto dto){
        
        attributeService.create(dto);

        return new StatusDto(200, "success", "");
    }    
    
    @RequestMapping(value="/attribute/{id}",method=RequestMethod.PUT)
    @ResponseBody
    public StatusDto editAttribute(@RequestBody AttributeNameDto dto){
        
        attributeService.update(dto);

        return new StatusDto(200, "success", "");
    }    
    
    @RequestMapping(value="/attribute/{id}",method=RequestMethod.DELETE)
    @ResponseBody
    public StatusDto deleteAttribute(@PathVariable("id") Long id){
        
        attributeService.delete(id);

        return new StatusDto(200, "success", "");
    }         
    
    @RequestMapping(value="/attribute/{id}/value",method=RequestMethod.POST)
    @ResponseBody
    public StatusDto createAttributeValue(@PathVariable("id") Long id, @RequestBody List<String> strList){
        
        attributeService.addAttributeValue(id, strList);;

        return new StatusDto(200, "success", "");
    }    
    
    @RequestMapping(value="/attribute/{id}/value",method=RequestMethod.PUT)
    @ResponseBody
    public StatusDto editAttributeValue(@PathVariable("id") Long id, @RequestBody List<AttributeValueDto> dtoList){
        
        attributeService.editAttributeValue(dtoList);

        return new StatusDto(200, "success", "");
    }    
    
    @RequestMapping(value="/attribute/{id}/value",method=RequestMethod.DELETE)
    @ResponseBody
    public StatusDto deleteAttributeValue(@PathVariable("id") Long id, @PathVariable("id") List<Serializable> idList){
        
        attributeService.delAttributeValue(idList);

        return new StatusDto(200, "success", "");
    }  
}
