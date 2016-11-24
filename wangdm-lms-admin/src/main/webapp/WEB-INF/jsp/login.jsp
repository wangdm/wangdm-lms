<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>拓奇资源平台--后台登录</title>
<c:import url="head.jsp"></c:import>
</head>
<body>
    <div class="container login">
        <h3 class="text-center">拓奇资源平台-后台登陆</h3>
	    <form class="form-horizontal" method="post" name="user" action="login" style="margin-top:30px">
	      <div class="form-group">
	        <label for="loginname" class="col-sm-2 control-label">用户名 :</label>
	        <div class="col-sm-10">
	          <input type="text" class="form-control" id="username" name="username" placeholder="用户名">
	        </div>
	      </div>
	      <div class="form-group">
	        <label for="loginpwd" class="col-sm-2 control-label">密 &nbsp;&nbsp;码 :</label>
	        <div class="col-sm-10">
	          <input type="password" class="form-control" id="password" name="password" placeholder="密码">
	        </div>
	      </div>
          <div class="form-group">
            <label for="captcha" class="col-sm-2 control-label">验证码 :</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="captcha" name="captcha" placeholder="请输入正确的验证码">
            </div>
          </div>
	      <div class="form-group">
	        <div class="col-sm-offset-2 col-sm-10">
	          <div class="checkbox">
	            <label>
	              <input type="checkbox">记住密码
	            </label>
	          </div>
	        </div>
	      </div>
	      <div class="form-group">
	        <div class="col-sm-offset-2 col-sm-10 text-right">
	          <button type="submit" class="btn btn-info" style="padding:5px 30px">登 录</button>
	        </div>
	      </div>
	    </form>
    
    </div>
</body>
</html>