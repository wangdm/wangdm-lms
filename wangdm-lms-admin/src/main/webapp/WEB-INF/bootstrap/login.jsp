<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<#include "head.jsp">
<title>Login</title>
</head>
<body>
    <div class="container">
    
	    <form class="form-horizontal" method="post" name="user">
	      <div class="form-group">
	        <label for="loginname" class="col-sm-2 control-label">Email</label>
	        <div class="col-sm-10">
	          <input type="text" class="form-control" id="username" name="username" placeholder="Email">
	        </div>
	      </div>
	      <div class="form-group">
	        <label for="loginpwd" class="col-sm-2 control-label">Password</label>
	        <div class="col-sm-10">
	          <input type="password" class="form-control" id="password" name="password" placeholder="Password">
	        </div>
	      </div>
          <div class="form-group">
            <label for="captcha" class="col-sm-2 control-label">Captcha</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="captcha" name="captcha">
            </div>
          </div>
	      <div class="form-group">
	        <div class="col-sm-offset-2 col-sm-10">
	          <div class="checkbox">
	            <label>
	              <input type="checkbox"> Remember me
	            </label>
	          </div>
	        </div>
	      </div>
	      <div class="form-group">
	        <div class="col-sm-offset-2 col-sm-10">
	          <button type="submit" class="btn btn-default">Sign in</button>
	        </div>
	      </div>
	    </form>
    
    </div>
</body>
</html>