package com.wangdm.lms.admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wangdm.core.dto.Dto;
import com.wangdm.core.query.Query;
import com.wangdm.lms.admin.utils.PageUtil;
import com.wangdm.lms.course.dto.LiveDto;
import com.wangdm.lms.course.query.LiveQuery;
import com.wangdm.lms.course.service.CategoryService;
import com.wangdm.lms.course.service.CourseService;
import com.wangdm.lms.course.service.LiveService;
import com.wangdm.ui.dto.MenuShowDto;
import com.wangdm.ui.service.BlogRollService;
import com.wangdm.ui.service.MenuService;
import com.wangdm.user.dto.UserAccountDto;
import com.wangdm.user.dto.UserSessionDto;
import com.wangdm.user.service.UserService;

@Controller
public class AdminController {
    
    private static Logger log = LoggerFactory.getLogger(AdminController.class);
    String sdkPath="wangdm-lms-sdk/v1";
    @Autowired
    MenuService menuService;
	
	@Autowired
	CourseService courseService;
    
	@Autowired
	UserService userService;
	
	@Autowired
	BlogRollService blogRollService;
    
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	LiveService  liveService;
	
    @RequestMapping(value="/")
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response){
        
        ModelAndView mv = null;
        
        UserSessionDto curUser = (UserSessionDto)request.getSession().getAttribute("loginUser");
        if(curUser==null){
            mv = new ModelAndView("login");
            log.debug("no user login, go to login");
        }else{
            mv = new ModelAndView("index");
            log.debug("the current user is "+curUser.getUsername());
        }
        
        List<MenuShowDto> menulist = menuService.showAdminMainMenu();
        mv.addObject("menulist", menulist);
        
        mv.addObject("loginUser", curUser);
        
        return mv;
    }
    
    @RequestMapping(value="login",method=RequestMethod.GET)
    public String login(HttpServletRequest request){

//        UserSessionDto curUser = (UserSessionDto)request.getSession().getAttribute("loginUser");
//        if(curUser != null){
//            return "redirect:/"; 
//        }
        if(SecurityUtils.getSubject().isAuthenticated()){

            return "redirect:/";
        }
        
        request.setAttribute("contextPath", request.getContextPath());
        return "login";
    }
	
	/////////////////////////////////////////////////////////////////////////////////////
    //// 首页
    /////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value="/index", method=RequestMethod.GET)
    private ModelAndView listGroup(){

        ModelAndView mv = new ModelAndView("action-index");
        
        return mv;
    }
	
	/////////////////////////////////////////////////////////////////////////////////////
    //// 网站设置
    /////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value="/systeminfo")
	public ModelAndView systeminfo(HttpServletRequest request)
	{
        ModelAndView model = new ModelAndView("action-systeminfo");
		return model;
	}
	
	@RequestMapping(value="/listnavigation")
	public ModelAndView listNavigation(HttpServletRequest request)
	{
        ModelAndView model = new ModelAndView("action-listnavigation");
        
		return model;
	}
    
    @RequestMapping(value="/listblogroll")
    public ModelAndView listBlogroll(HttpServletRequest request)
    {
        ModelAndView model = new ModelAndView("action-listblogroll");
        
        return model;
    }
    
    @RequestMapping(value="/listhotspot")
    public ModelAndView listHotspot(HttpServletRequest request)
    {
        ModelAndView model = new ModelAndView("action-listhotspot");

        return model;
    }
	
	/////////////////////////////////////////////////////////////////////////////////////
    //// 课程管理
    /////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value="/listcategory")
	public ModelAndView listCourseCategory(HttpServletRequest request)
	{
        ModelAndView model = new ModelAndView("action-listcategory");
        model.addObject("contextPath", request.getContextPath());
        model.addObject("sdkPath", sdkPath);
		return model;
	}
    
    @RequestMapping(value="/listcourse")
	public ModelAndView listCourse(HttpServletRequest request)
	{
        ModelAndView model = new ModelAndView("action-listcourse");
        
		return model;
	}
    
    @RequestMapping(value="/listvideo")
	public ModelAndView listVideo(HttpServletRequest request)
	{
        ModelAndView model = new ModelAndView("action-listvideo");
        
		return model;
	}
    
    
    /**
     * @desc   进入直播列表页面
     * @author songjia
     * @createtime 2016-10-31 15:20
     * @param request
     * @param liveQuery
     * @return
     */
    @RequestMapping(value="/listlive")
	public ModelAndView listLive(HttpServletRequest request,LiveQuery liveQuery)
	{
        ModelAndView model = new ModelAndView("action-listlive");
        model.addObject("contextPath", request.getContextPath());
        model.addObject("sdkPath","/wangdm-lms-sdk");
        //CategoryQuery queryCategory=new CategoryQuery();
        //queryCategory.setParentId(Long.valueOf(1));
        //List<Dto> listCatogoryDto=categoryService.query(queryCategory);
        liveQuery.setCurrentPage(1);
        liveQuery.setPageSize(8);
        Query query=liveQuery;
        List<Dto> listDto=liveService.query(query);
        List<Dto> lives=new ArrayList<Dto>(listDto.size());
        for(Dto dto:listDto){
            UserAccountDto  userDto=(UserAccountDto)userService.findById(((LiveDto)dto).getUserId());
            LiveDto liveDto=(LiveDto)dto;
            liveDto.setUserName(userDto.getUsername());
            lives.add(liveDto);
        }
        model.addObject("liveList",  lives);
        int totalPage=liveQuery.getTotalPage();
        model.addObject("pagelist",PageUtil.getPagation(totalPage,liveQuery.getCurrentPage()));
        //model.addObject("categoryList", listCatogoryDto);
		return model;
	}
    
	/////////////////////////////////////////////////////////////////////////////////////
    //// 学科课本管理
    /////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value="/listpublisher")
	public ModelAndView listPublisher(HttpServletRequest request)
	{
        ModelAndView model = new ModelAndView("action-listpublisher");
        model.addObject("contextPath", request.getContextPath());
		return model;
	}
    
    @RequestMapping(value="/listsubject")
	public ModelAndView listSuject(HttpServletRequest request)
	{
        ModelAndView model = new ModelAndView("action-listsubject");
        model.addObject("contextPath", request.getContextPath());
		return model;
	}
    
    @RequestMapping(value="/listgrade")
	public ModelAndView listGrade(HttpServletRequest request)
	{
        ModelAndView model = new ModelAndView("action-listgrade");
        model.addObject("contextPath", request.getContextPath());
		return model;
	}
    
    @RequestMapping(value="/listtextbook")
	public ModelAndView listTextbook(HttpServletRequest request)
	{
        ModelAndView model = new ModelAndView("action-listtextbook");
        model.addObject("contextPath", request.getContextPath());
		return model;
	}
    
	/////////////////////////////////////////////////////////////////////////////////////
    //// 课表管理
    /////////////////////////////////////////////////////////////////////////////////////
    
    @RequestMapping(value="/listlesson")
	public ModelAndView listLesson(HttpServletRequest request)
	{
        ModelAndView model = new ModelAndView("action-listlesson");
		return model;
	}
    
    @RequestMapping(value="/queryteacherschedule")
	public ModelAndView queryTeacherSchedule(HttpServletRequest request)
	{
        ModelAndView model = new ModelAndView("action-queryteacherschedule");
		return model;
	}
    
    @RequestMapping(value="/querygroupschedule")
	public ModelAndView queryGroupSchedule(HttpServletRequest request)
	{
        ModelAndView model = new ModelAndView("action-querygroupschedule");
		return model;
	}
    
    @RequestMapping(value="/queryclassschedule")
	public ModelAndView queryClassSchedule(HttpServletRequest request)
	{
        ModelAndView model = new ModelAndView("action-queryclassschedule");
		return model;
	}
    
	/////////////////////////////////////////////////////////////////////////////////////
    //// 设备管理
    /////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value="/listclassroom")
	public ModelAndView listClassroom(HttpServletRequest request)
	{
        ModelAndView model = new ModelAndView("action-listclassroom");
        model.addObject("contextPath", request.getContextPath());
		return model;
	}
    
    @RequestMapping(value="/listrbdevice")
	public ModelAndView listRBDevice(HttpServletRequest request)
	{
        ModelAndView model = new ModelAndView("action-listrbdevice");
        model.addObject("contextPath", request.getContextPath());
		return model;
	}
    
	/////////////////////////////////////////////////////////////////////////////////////
    //// 流媒体设置
    /////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping(value="/mediaserver")
	public ModelAndView mediaserver(HttpServletRequest request)
	{
        ModelAndView model = new ModelAndView("action-mediaserver");
        model.addObject("contextPath", request.getContextPath());
		return model;
	}
    
    @RequestMapping(value="/mediaplayer")
	public ModelAndView mediaplayer(HttpServletRequest request)
	{
        ModelAndView model = new ModelAndView("action-mediaplayer");
        model.addObject("contextPath", request.getContextPath());
		return model;
	}
    
}
