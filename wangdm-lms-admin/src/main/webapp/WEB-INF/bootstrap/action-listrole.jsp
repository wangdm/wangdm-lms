<!DOCTYPE html>
<html class="iframe-html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<#include "action-head.jsp">
<title></title>
</head>
<body>
<div class="content-wrapper">
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="operationbar">
                <div class="operation"><a href="#addRoleDialog" data-toggle="modal"><img src="${contextPath}/assets/images/add.png"/><span>&nbsp;添加用户角色</span></a></div>
            </div>
        </div>
    </div>
    <table class="table table-bordered table-hover">
        <thead>
             <tr>
               <th>角色名</th>
               <th>角色标识</th>
               <th>角色描述</th>
               <th>状态</th>
               <th>用户数</th>
               <th>权限1</th>
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

<!-- 添加角色对话框 -->
<div class="modal fade" id="addRoleDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加角色</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="addRoleForm" name="addRoleForm">
              <div class="form-group">
                <label for="roletitle" class="col-sm-3 control-label">角色名：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="roletitle">
                </div>
              </div>
              <div class="form-group">
                <label for="rolename" class="col-sm-3 control-label">角色标识：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="rolename">
                </div>
              </div>
              <div class="form-group">
                <label for="roledesc" class="col-sm-3 control-label">角色描述：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="roledesc">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="addRoleBtn">添加</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 重命名角色名对话框 -->
<div class="modal fade" id="editRoleDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">重命名角色</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="editRoleForm" name="editRoleForm">
              <div class="form-group">
                <label for="roletitle" class="col-sm-3 control-label">新角色名：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="roletitle">
                </div>
              </div>
              <div class="form-group">
                <label for="roledesc" class="col-sm-3 control-label">角色描述：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="roledesc">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="editRoleBtn">重命名</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 删除角色对话框 -->
<div class="modal fade" id="delRoleDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">删除角色</h4>
      </div>
      <div class="modal-body">
        <span>确认删除角色</span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="delRoleBtn">删除</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 角色权限编辑对话框 -->
<div class="modal fade" id="editRoleAuthorityDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">权限修改</h4>
      </div>
      <div class="modal-body">
        <div class="panel-group" role="tablist">
            <c:if test="${not empty permissionGroupList}">
            <c:forEach var="permissionGroup" items="${permissionGroupList}" varStatus="status">
            <div class="panel panel-default">
                <div class="panel-heading" role="tab">
                    <h4 class="panel-title"><a href="#PermissionGroup${permissionGroup.id}" class="collapsed" role="button" data-toggle="collapse" aria-expanded="false" aria-controls="PermissionGroup${permissionGroup.id}">${permissionGroup.name}</a></h4>
                </div>
                <div class="panel-collpase collapse" role="tabpanel" id="PermissionGroup${permissionGroup.id}" aria-expanded="false">
                    <ul class="list-group" style="margin-bottom:-1px;">
                        <c:if test="${not empty permissionGroup.permList}">
                        <c:forEach var="perm" items="${permissionGroup.permList}">
                        <li class="list-group-item" style="padding: 4px 20px;">
                            <label style="margin-bottom: 0px;">
                                <input data-id="${perm.id}" type="checkbox" style="margin:0px;vertical-align:middle;"/> ${perm.title}
                            </label>
                        </li>
                        </c:forEach>
                        </c:if>
                    </ul>
                </div>
            </div>
            </c:forEach>
            </c:if>
        </div>  
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="editRoleAuthorityBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>

var rolelist = new Array();
var permlist = new Array();
var curRole;
var curPage = 0;
$(function(){
	getAllRole(0);
    
    /////////////////////////////////////////////////////////
    
    $('#editRoleDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curRole = rolelist[index];
        $(this).find("[name='roletitle']").val(curRole.title);
        $(this).find("[name='roledesc']").val(curRole.desc);
        $(this).find('#editRoleBtn').attr("data-id",curRole.id);
    });
    
    $('#delRoleDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curRole = rolelist[index];
        $(this).find('.modal-body').text("是否删除角色  \""+curRole.title+"\"?");
        $(this).find('#delRoleBtn').attr("data-id",curRole.id);
    });
    
    $('#editRoleAuthorityDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curRole = rolelist[index];
        permlist = [];
        $("#editRoleAuthorityDialog input:checkbox:checked").attr("checked", false).prop("checked",false);
        getRolePermission(curRole.id);
        $(this).find('#editRoleAuthorityBtn').attr("data-id",curRole.id);
    });
    
    /////////////////////////////////////////////////////////
    
    $("#addRoleBtn").on("click",function(){
        var role = new Object();
        role.name = $("#addRoleForm").find("[name='rolename']").val();
        role.title = $("#addRoleForm").find("[name='roletitle']").val();
        role.desc = $("#addRoleForm").find("[name='roledesc']").val();
        addRole(role);
    });
    
    $("#editRoleBtn").on("click",function(){
        curRole.title = $("#editRoleForm").find("[name='roletitle']").val();
        curRole.desc = $("#editRoleForm").find("[name='roledesc']").val();
        editRole(curRole);
    });
    
    $("#delRoleBtn").on("click",function(){
        roleId = $(this).attr("data-id");
        delRole(roleId);
    });
    
    $("#editRoleAuthorityBtn").on("click",function(){
        setRolePermission(curRole.id, permlist);
    });
    
    $("#editRoleAuthorityDialog input:checkbox").on("change",function(){
        var checked = $(this).prop("checked");
        var permId = $(this).data("id");
        if(checked==true){
            var perm = {"id":permId};
            permlist.push(perm);
        }else{
            for(var i=0; i<permlist.length; i++){
                var perm = permlist[i];
                if(perm.id==permId){
                    permlist.splice(i,1);
                }
            }
        }
    });
    
    /////////////////////////////////////////////////////////
    
    $("#content-page .pagination").on("click","li",function(){
        var page = $(this).data("page");
        if(page!=undefined)
            getAllRole(page);
    });
});
</script>
</body>
</html>