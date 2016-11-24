package com.wangdm.lms.admin.shiro;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.wangdm.user.dto.PermissionDto;
import com.wangdm.user.dto.RoleDto;
import com.wangdm.user.dto.UserLoginDto;
import com.wangdm.user.dto.UserSessionDto;
import com.wangdm.user.service.UserService;

public class MyShiroRealm extends AuthorizingRealm {
    
    private static final Logger logger = LoggerFactory.getLogger(MyShiroRealm.class);

    @Autowired
    UserService userService;
    
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principal) {
        
        SimpleAuthorizationInfo authorizationInfo  = new SimpleAuthorizationInfo();
        
        Subject subject = SecurityUtils.getSubject();
        
        UserSessionDto user = (UserSessionDto) subject.getSession().getAttribute("loginUser");
        if(user==null){
            return authorizationInfo;
        }
        
        List<RoleDto> roleList = userService.listRole(user.getEntityId());
        if(roleList!=null && roleList.size()>0){
            
            Set<String> roles = new HashSet<String>(roleList.size());
            for(int i=0; i<roleList.size(); i++){
                RoleDto dto = roleList.get(i);
                roles.add(dto.getName());
            }
            
            authorizationInfo.addRoles(roles);
        }
        
        List<PermissionDto> permList = userService.listPermission(user.getEntityId());
        if(permList!=null && permList.size()>0){
            
            Set<String> perms = new HashSet<String>(permList.size());
            for(int i=0; i<permList.size(); i++){
                PermissionDto dto = permList.get(i);
                perms.add(dto.getName());
            }
            
            authorizationInfo.addStringPermissions(perms);
        }
        
        return authorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        
        UsernamePasswordToken token = (UsernamePasswordToken)authenticationToken;
        UserLoginDto login = new UserLoginDto();
        
        login.setLoginname(token.getUsername());
        login.setLoginpwd(String.valueOf(token.getPassword()));
        UserSessionDto user = userService.login(login);
        if(user==null){
            logger.warn("Username:["+login.getLoginname()+"], Password:["+login.getLoginpwd()+"]");
            return null;
        }
        logger.debug("Username:["+login.getLoginname()+"], Password:["+login.getLoginpwd()+"]");
        
        Subject subject = SecurityUtils.getSubject();
        subject.getSession().setAttribute("loginUser", user);
        return new SimpleAuthenticationInfo(login.getLoginname(),login.getLoginpwd(),this.getName());
    }

}
