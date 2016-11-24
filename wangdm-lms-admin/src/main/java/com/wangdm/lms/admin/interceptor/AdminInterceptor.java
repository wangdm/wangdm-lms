package com.wangdm.lms.admin.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.wangdm.lms.config.dto.ModularConfig;
import com.wangdm.lms.config.service.ImageServerService;
import com.wangdm.lms.config.service.ModularConfigService;
import com.wangdm.user.dto.UserSessionDto;

public class AdminInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private ModularConfigService modularConfigService;
    @Autowired
    private ImageServerService imageServerService;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        UserSessionDto curUser = (UserSessionDto)request.getSession().getAttribute("loginUser");
        if(curUser == null){
            response.sendRedirect(request.getContextPath()+"/login");
            return false;
        }else{
            request.setAttribute("loginUser", curUser);
        }

        return super.preHandle(request, response, handler);
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        
        request.setAttribute("contextPath", request.getContextPath());
        
        ModularConfig modularConfig = modularConfigService.getModularConfig();
        request.setAttribute("modularConfig", modularConfig);
        String imageServerUrl = imageServerService.getImageServerUrl();
        request.setAttribute("imageServerUrl", imageServerUrl);
        
        super.postHandle(request, response, handler, modelAndView);
    }

}
