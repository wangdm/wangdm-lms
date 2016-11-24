<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="action-head.jsp"></c:import>
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/plugins/dtree/dtree.css"/>
<script type="text/javascript" src="${contextPath}/assets/plugins/dtree/dtree.js"></script>
<title></title>
</head>
<body>
<div class="lefttree">
    <c:import url="grouptree.jsp"></c:import>
</div>

<div class="rightcontent">
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="operationbar">
                <div class="operationleft col-xs-12 col-md-6">
                    <div class="operation"><a href="#AddUserDialog" data-toggle="modal"><img src="${contextPath}/assets/images/add.png"/><span>&nbsp;添加用户</span></a></div>
                </div>
                <div class="operationright col-xs-12 col-md-6">
                    <div class="operation"><a href="#ImportUserDialog" data-toggle="modal"><img src="${contextPath}/assets/images/excel.png"/><span>&nbsp;导入用户</span></a></div>
                    <div class="operation"><a href="#ExportUserDialog" data-toggle="modal"><img src="${contextPath}/assets/images/excel.png"/><span>&nbsp;导出用户</span></a></div>
                </div>
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="operationbar">
                <div class="col-xs-12 col-md-6" style="max-width:350px">
                    <div class="input-group" id="roleinput">
                      <span class="input-group-addon" id="inputHelpBlock"><strong>角色</strong></span>
                      <input type="text" name="queryRole" class="form-control" placeholder="选择角色" readonly>
                      <span class="input-group-btn">
                        <button class="btn btn-default" type="button" data-toggle="modal" data-target="#QueryRoleDialog"><span class="glyphicon glyphicon-search"></span></button>
                      </span>
                    </div>
                </div>
                <div class="col-xs-12 hidden-md hidden-lg" style="height:10px;">
                </div>
                <div class="col-xs-12 col-md-6" style="max-width:350px">
                    <div class="input-group" id="userinput">
                      <div class="input-group-btn">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">用户名<span class="caret"></span></button>
                        <ul class="dropdown-menu" style="min-width:0px">
                          <li data-query="name" class="hide"><a href="#">用户名</a></li>
                          <li data-query="email"><a href="#">电子邮箱</a></li>
                          <li data-query="phone"><a href="#">电话</a></li>
                        </ul>
                      </div>
                      <input type="text" class="form-control" aria-label="...">
                      <span class="input-group-btn">
                        <button class="btn btn-default" type="button" id="QueryBtn"><span class="glyphicon glyphicon-search"></span></button>
                      </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <table class="table table-bordered table-hover table-striped table-condensed">
        <thead>
             <tr>
               <th>用户名</th>
               <th>姓名</th>
               <th>电子邮箱</th>
               <th>电话</th>
               <th>所属组</th>
               <th>角色</th>
               <th>状态</th>
               <th>操作</th>
             </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    <div id="NoDataWarning" class="alert alert-warning" role="alert" style="padding:5px 15px;text-align:center;display:none">
      <span>未查询到数据</span>
    </div>

    <nav id="content-page">
        <ul class="pagination">
        </ul>
    </nav>
</div>

<!-- 添加用户对话框 -->
<div class="modal fade" id="AddUserDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加用户</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="AddUserForm" name="AddUserForm">
              <div class="form-group">
                <label for="username" class="col-sm-3 control-label">用户名：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="username">
                </div>
              </div>
              <div class="form-group">
                <label for="password" class="col-sm-3 control-label">密码：</label>
                <div class="col-sm-8">
                    <input type="password" class="form-control" name="password">
                </div>
              </div>
              <div class="form-group">
                <label for="_password" class="col-sm-3 control-label">密码确认：</label>
                <div class="col-sm-8">
                    <input type="password" class="form-control" name="_password">
                </div>
              </div>
              <div class="form-group">
                <label for="email" class="col-sm-3 control-label">E-mail：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="email">
                </div>
              </div>
              <div class="form-group">
                <label for="phone" class="col-sm-3 control-label">电话：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="phone">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="AddUserBtn">添加</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 选择角色对话框 -->
<div class="modal fade" id="EditUserRoleDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">指定角色</h4>
      </div>
      <div class="modal-body">
	      <form class="form-horizontal" role="form" name="roleform">
            <c:if test="${not empty roleList}">
            <c:forEach var="role" items="${roleList}" varStatus="status">
		      <div class="form-group">
			      <div class="col-sm-offset-2 col-sm-10">
			      <label><input type="checkbox" name="role" data-id="${role.id}" />${role.title}</label>
			      </div>
		      </div>
            </c:forEach>
            </c:if>
	      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="EditUserRoleBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 移动分组对话框 -->
<div class="modal fade" id="EditUserGroupDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">移动分组</h4>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="EditUserGroupBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 删除用户对话框 -->
<div class="modal fade" id="DelUserDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">删除用户</h4>
      </div>
      <div class="modal-body">
        <span>确认删除用户</span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="DelUserBtn">删除</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 永久删除用户对话框 -->
<div class="modal fade" id="EraseUserDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">永久删除用户</h4>
      </div>
      <div class="modal-body">
        <span>确认永久删除用户</span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="EraseUserBtn">删除</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 禁用用户对话框 -->
<div class="modal fade" id="ForbiddenUserDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">禁用用户</h4>
      </div>
      <div class="modal-body">
        <span>确认禁用用户</span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="ForbiddenUserBtn">禁用</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 审核用户对话框 -->
<div class="modal fade" id="VerifyUserDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">审核用户</h4>
      </div>
      <div class="modal-body">
        <span>确认授权用户</span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="VerifyUserBtn">审核</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 恢复用户对话框 -->
<div class="modal fade" id="RestoreUserDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">恢复用户</h4>
      </div>
      <div class="modal-body">
        <span>确认恢复用户</span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="RestoreUserBtn">恢复</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 修改用户账户信息对话框 -->
<div class="modal fade" id="EditUserAccountDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">修改用户账户信息</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="EditUserAccountForm" name="EditUserAccountForm">
              <div class="form-group">
                <label for="username" class="col-sm-3 control-label">用户名：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="username" readonly>
                </div>
              </div>
              <div class="form-group">
                <label for="email" class="col-sm-3 control-label">E-mail：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="email">
                </div>
              </div>
              <div class="form-group">
                <label for="phone" class="col-sm-3 control-label">电话：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="phone">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="EditUserAccountBtn">修改</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 修改用户密码对话框 -->
<div class="modal fade" id="EditUserPasswordDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">修改用户账户信息</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="EditUserPasswordForm" name="EditUserPasswordForm">
              <div class="form-group">
                <label for="oldpassword" class="col-sm-3 control-label">旧密码：</label>
                <div class="col-sm-8">
                    <input type="password" class="form-control" name="oldpassword">
                </div>
              </div>
              <div class="form-group">
                <label for="password" class="col-sm-3 control-label">密码：</label>
                <div class="col-sm-8">
                    <input type="password" class="form-control" name="password">
                </div>
              </div>
              <div class="form-group">
                <label for="_password" class="col-sm-3 control-label">密码确认：</label>
                <div class="col-sm-8">
                    <input type="password" class="form-control" name="_password">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="EditUserPasswordBtn">修改密码</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 修改用户资料对话框 -->
<div class="modal fade" id="EditUserProfileDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">修改用户资料信息</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="EditUserProfileForm" name="EditUserProfileForm">
              <div class="form-group">
                <label for="nickname" class="col-sm-3 control-label">昵称：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="nickname">
                </div>
              </div>
              <div class="form-group">
                <label for="realname" class="col-sm-3 control-label">姓名：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="realname">
                </div>
              </div>
              <div class="form-group">
                <label for="gender" class="col-sm-3 control-label">性别：</label>
                <div class="col-sm-8">
                    <select class="form-control" name="gender">
                        <option value="SECRET">保密</option>
                        <option value="MALE">MALE</option>
                        <option value="FEMALE">FEMALE</option>
                    </select>
                </div>
              </div>
              <div class="form-group">
                <label for="age" class="col-sm-3 control-label">年龄：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="age">
                </div>
              </div>
              <div class="form-group">
                <label for="motto" class="col-sm-3 control-label">座右铭：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="motto">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="EditUserProfileBtn">保存</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 修改实名认证对话框 -->
<div class="modal fade" id="EditUserCreditDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">修改实名认证</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="EditUserCreditForm" name="EditUserCreditForm">
              <div class="form-group">
                <label for="type" class="col-sm-3 control-label">类型：</label>
                <div class="col-sm-8">
                    <select class="form-control" name="type">
                        <option value="">身份证</option>
                    </select>
                </div>
              </div>
              <div class="form-group">
                <label for="number" class="col-sm-3 control-label">ID：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="number" readonly>
                </div>
              </div>
              <div class="form-group">
                <label for="realname" class="col-sm-3 control-label">姓名：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="realname" readonly>
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">关闭</button>
        <!--<button type="button" class="btn btn-sm btn-primary" id="EditUserCreditBtn">保存</button>-->
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 导入用户对话框 -->
<div class="modal fade" id="ImportUserDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">导入用户</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal">
              <div class="form-group">
                <label for="exampleInputFile" class="col-sm-3 control-label">选择用户文件：</label>
                <div class="col-sm-8">
                    <input type="file" class="form-control" id="exampleInputFile" name = "exampleInputFile">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="ImportUserBtn">导入</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 导出用户对话框 -->
<div class="modal fade" id="ExportUserDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">导出用户</h4>
      </div>
      <div class="modal-body">
			<h5>选择导出项 (默认全选)</h5>
			<input type="checkbox" value="1" name = "age" checked="checked">年龄
			<input type="checkbox" value="2" name = "description" checked="checked">简介
			<input type="checkbox" value="3" name = "nickname" checked="checked">昵称
			<input type="checkbox" value="4" name = "realname" checked="checked">真实姓名
			<input type="checkbox" value="5" name = "register_time" checked="checked">注册日期
			<input type="checkbox" value="6" name = "sex" checked="checked">性别
			<input type="checkbox" value="7" name = "sign" checked="checked">签名
			<input type="checkbox" value="8" name = "address" checked="checked">地址
      </div>
      
      <div class="modal-footer">
        <form action="" method="post" style="width: 100%">
        	<input class="btn btn-sm btn-primary" type="submit" name = "" value="导出" onclick="exportUserExcelUp()">
        </form>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 查询选择角色对话框 -->
<div class="modal fade" id="QueryRoleDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">选择角色</h4>
      </div>
      <div class="modal-body">
          <form class="form-horizontal" role="form" name="roleform">
            <c:if test="${not empty roleList}">
            <c:forEach var="role" items="${roleList}" varStatus="status">
              <div class="form-group">
                  <div class="col-sm-offset-2 col-sm-10">
                  <label><input type="checkbox" name="role" data-id="${role.id}" />${role.title}</label>
                  </div>
              </div>
            </c:forEach>
            </c:if>
          </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="QueryRoleBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
var userlist = new Array();
var curGroup = {"id":-1, "name":"在线学习平台"};
var curRole = {"id":-1, "name":""};
var curUser;
var curPage = 0;
var queryRole = new Array();
var queryType = "name";
var queryValue = "";
$(function(){

    getAllUser(curGroup.id,queryRole,queryType,queryValue,curPage);
    $(".lefttree").on("click",".node",function(){
    	curGroup.id = $(this).attr("data-id");
        getAllUser(curGroup.id,queryRole,queryType,queryValue,curPage);
    });
    
    /////////////////////////////////////////////////////////
    
    //对话框初始化
    $('#EditUserAccountDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curUser = userlist[index];
        $(this).find('#EditUserAccountBtn').data("id",curUser.id);
        $(this).find("[name='username']").val(curUser.username);
        $(this).find("[name='email']").val(curUser.email);
        $(this).find("[name='phone']").val(curUser.phone);
    });
    
    $('#EditUserPasswordDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curUser = userlist[index];
        $(this).find('#EditUserPasswordBtn').data("id",curUser.id);
    });
    
    $('#EditUserProfileDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curUser = userlist[index];
        $(this).find('#EditUserProfileBtn').data("id",curUser.id);
        
        $(this).find("[name='nickname']").val(curUser.nickname);
        $(this).find("[name='realname']").val(curUser.realname);
        $(this).find("[name='gender']").val(curUser.gender);
        $(this).find("[name='age']").val(curUser.age);
        $(this).find("[name='motto']").val(curUser.motto);
    });
    
    $('#EditUserCreditDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curUser = userlist[index];
        $(this).find('#EditUserCreditBtn').data("id",curUser.id);
    });
    
    $('#EditUserRoleDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curUser = userlist[index];
        $(this).find('#EditUserRoleBtn').data("id",curUser.id);
        $("#EditUserRoleDialog input:checkbox").attr("checked", false).prop("checked",false);
        getUserRoles(curUser.id);
    });
    
    $('#EditUserGroupDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curUser = userlist[index];
        $(this).find('#EditUserGroupBtn').data("id",curUser.id);
    });
    
    $('#DelUserDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curUser = userlist[index];
        $(this).find('#DelUserBtn').data("id",curUser.id);
        $(this).find('.modal-body').text("是否删除用户  \""+curUser.username+"\"?");
    });
    
    $('#EraseUserDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curUser = userlist[index];
        $(this).find('#EraseUserBtn').data("id",curUser.id);
        $(this).find('.modal-body').text("是否永久删除用户  \""+curUser.username+"\"?");
    });
    
    $('#ForbiddenUserDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curUser = userlist[index];
        $(this).find('#ForbiddenUserBtn').data("id",curUser.id);
        $(this).find('.modal-body').text("是否禁用用户  \""+curUser.username+"\"?");
    });
    
    $('#VerifyUserDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curUser = userlist[index];
        $(this).find('#VerifyUserBtn').data("id",curUser.id);
        $(this).find('.modal-body').text("是否审核用户  \""+curUser.username+"\"?");
    });
    
    $('#RestoreUserDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curUser = userlist[index];
        $(this).find('#RestoreUserBtn').data("id",curUser.id);
        $(this).find('.modal-body').text("是否恢复用户  \""+curUser.username+"\"?");
    });
    
    /////////////////////////////////////////////////////////
    
    //对话框确定按钮点击事件
    $("#AddUserBtn").on("click",function(){
    	var user = new Object();
    	user.username = $("#AddUserForm").find("[name='username']").val();
    	user.password = $("#AddUserForm").find("[name='password']").val();
        user._password = $("#AddUserForm").find("[name='_password']").val();
    	user.email = $("#AddUserForm").find("[name='email']").val();
    	user.phone = $("#AddUserForm").find("[name='phone']").val();
    	user.gid = curGroup.id;
        addUser(user);
    });
    
    $("#EditUserRoleBtn").on("click",function(){
        $("#EditUserRoleDialog").modal("hide");
        var roles = [];
    	$("#EditUserRoleDialog input[name='role']:checked").each(function(){
    	    var role = {};
    	    role.id = $(this).data("id");
    	    roles.push(role);
    	});
        setUserRoles(curUser.id, roles);
    });
    
    $("#EditUserGroupBtn").on("click",function(){
    });
    
    $("#EditUserAccountBtn").on("click",function(){
        var account = new Object();
        account.id = curUser.id;
        account.username = $("#EditUserAccountForm").find("[name='username']").val();
        account.email = $("#EditUserAccountForm").find("[name='email']").val();
        account.phone = $("#EditUserAccountForm").find("[name='phone']").val();
        editUserAccount(account);
    });
    
    $("#EditUserPasswordBtn").on("click",function(){
    	var password = new Object();
    	password.id = curUser.id;
    	password.oldPassword = $("#EditUserPasswordForm").find("[name='oldpassword']").val();
    	password.newPassword = $("#EditUserPasswordForm").find("[name='password']").val();
    	password.rePassword = $("#EditUserPasswordForm").find("[name='_password']").val();
    	editUserPassword(password);
    });
    
    $("#EditUserProfileBtn").on("click",function(){
        var profile = new Object();
        profile.id = curUser.id;
        profile.nickname = $("#EditUserProfileForm").find("[name='nickname']").val();
        profile.realname = $("#EditUserProfileForm").find("[name='realname']").val();
        profile.gender = $("#EditUserProfileForm").find("[name='gender']").val();
        profile.age = $("#EditUserProfileForm").find("[name='age']").val();
        profile.motto = $("#EditUserProfileForm").find("[name='motto']").val();
        editUserProfile(profile);
    });
    
    $("#EditUserCreditBtn").on("click",function(){
        var credit = new Object();
        credit.id = curUser.id;
        credit.realname = $("#EditUserCreditForm").find("[name='realname']").val();
        credit.number = $("#EditUserCreditForm").find("[name='number']").val();
        editUserCredit(credit);
    });
    
    $("#DelUserBtn").on("click",function(){
        id = $(this).data("id");
        delUser(id);
    });
    
    $("#EraseUserBtn").on("click",function(){
        id = $(this).data("id");
        eraseUser(id);
    });
    
    $("#RestoreUserBtn").on("click",function(){
        id = $(this).data("id");
        restoreUser(id);
    });
    
    $("#VerifyUserBtn").on("click",function(){
        id = $(this).data("id");
        verifyUser(id);
    });
    
    $("#ForbiddenUserBtn").on("click",function(){
        id = $(this).data("id");
        forbiddenUser(id);
    });
    
    /////////////////////////////////////////////////////////
    
    //用户查询相关操作
    $("#QueryRoleBtn").on("click",function(){
    	var str = "";
    	queryRole = [];
        $("#QueryRoleDialog").modal("hide");
        $("#QueryRoleDialog").find("input[type='checkbox']:checked").each(function(){
        	var tmpRole = {"id":$(this).data("id"),"name":$(this).parent().text()};
        	queryRole.push(tmpRole.id);
        	str += tmpRole.name+",";
        });
        $("input[name='queryRole']").val(str);
        getAllUser(curGroup.id,queryRole,queryType,queryValue,0);
    });
    
    $("#userinput ul.dropdown-menu > li").on("click", function(){
        $("#userinput ul.dropdown-menu > li.hide").removeClass("hide");
        $(this).addClass("hide");
        $("#userinput ul.dropdown-menu").prev().html($(this).text()+"<span class=\"caret\"></span>");
        queryType = $(this).data("query");
    });
    
    $("#QueryBtn").on("click",function(){
        queryValue = $("#userinput input").val();
        getAllUser(curGroup.id,queryRole,queryType,queryValue,curPage);
    });
    
    $("#content-page .pagination").on("click","li",function(){
        var page = $(this).data("page");
        if(page!=undefined)
            curPage = page;
            getAllUser(curGroup.id,queryRole,queryType,queryValue,curPage);
    });
    
});

</script>
</body>
</html>