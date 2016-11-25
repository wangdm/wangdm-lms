<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<#include "action-head.jsp">
<title></title>
</head>
<body>

<div class="content-wrapper">
<div class="col-md-4">
    <div class="panel panel-default">
        <div class="panel-heading">
            <span>权限组</span>
        </div>
        <div class="panel-body">
		    <table id="grouptable" class="table table-bordered table-hover">
		        <thead>
		             <tr>
		               <th>权限组</th>
		               <th>修改</th>
		               <th>删除</th>
		             </tr>
		        </thead>
		        <tbody>
		        </tbody>
		    </table>
        </div>
        <div class="panel-footer">
            <span><button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#addPermissionGroupDialog">新增权限组</button></span>
        </div>
    </div>
</div>

<div class="col-md-8">
    <div class="panel panel-default">
        <div class="panel-heading">
            <span>权限</span>
        </div>
        <div class="panel-body">
            <table id="permissiontable" class="table table-bordered table-hover">
                <thead>
                     <tr>
                       <th>权限名</th>
                       <th>权限标识</th>
                       <th>权限组</th>
                       <th>描述</th>
                       <th>修改</th>
                       <th>删除</th>
                     </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
        <div class="panel-footer">
            <span><button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#addPermissionDialog">新增权限</button></span>
        </div>
    </div>
</div>
</div>

<!-- 添加权限组对话框 -->
<div class="modal fade" id="addPermissionGroupDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加权限组</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="addPermissionGroupForm" name="addPermissionGroupForm">
              <div class="form-group">
                <label for="groupname" class="col-sm-3 control-label">权限组：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="groupname">
                </div>
              </div>
              <div class="form-group">
                <label for="groupdesc" class="col-sm-3 control-label">描述：</label>
                <div class="col-sm-8">
                    <textarea class="form-control" name="groupdesc"></textarea>
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="addPermissionGroupBtn">添加</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 修改权限组对话框 -->
<div class="modal fade" id="editPermissionGroupDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">修改权限组</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="editPermissionGroupForm" name="editPermissionGroupForm">
              <div class="form-group">
                <label for="groupname" class="col-sm-3 control-label">权限组：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="groupname">
                </div>
              </div>
              <div class="form-group">
                <label for="groupdesc" class="col-sm-3 control-label">描述：</label>
                <div class="col-sm-8">
                    <textarea class="form-control" name="groupdesc"></textarea>
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="editPermissionGroupBtn">保存</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 删除权限组对话框 -->
<div class="modal fade" id="delPermissionGroupDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">删除权限组</h4>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="delPermissionGroupBtn">删除</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- ################################################################# -->
<!-- 添加权限对话框 -->
<div class="modal fade" id="addPermissionDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加权限</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="addPermissionForm" name="addPermissionForm">
              <div class="form-group">
                <label for="groupname" class="col-sm-3 control-label">权限组：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="groupname" readonly>
                </div>
              </div>
              <div class="form-group">
                <label for="permissiontitle" class="col-sm-3 control-label">权限名：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="permissiontitle">
                </div>
              </div>
              <div class="form-group">
                <label for="permissionname" class="col-sm-3 control-label">权限标识：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="permissionname">
                </div>
              </div>
              <div class="form-group">
                <label for="permissiondesc" class="col-sm-3 control-label">描述：</label>
                <div class="col-sm-8">
                    <textarea class="form-control" name="permissiondesc"></textarea>
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="addPermissionBtn">添加</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 修改权限对话框 -->
<div class="modal fade" id="editPermissionDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">修改权限</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="editPermissionForm" name="editPermissionForm">
              <div class="form-group">
                <label for="groupname" class="col-sm-3 control-label">权限组：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="groupname" readonly>
                </div>
              </div>
              <div class="form-group">
                <label for="permissiontitle" class="col-sm-3 control-label">权限名：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="permissiontitle">
                </div>
              </div>
              <div class="form-group">
                <label for="permissiondesc" class="col-sm-3 control-label">描述：</label>
                <div class="col-sm-8">
                    <textarea class="form-control" name="permissiondesc"></textarea>
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="editPermissionBtn">保存</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 删除权限对话框 -->
<div class="modal fade" id="delPermissionDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">删除权限</h4>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="delPermissionBtn">删除</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script type="text/javascript">
var permissiongrouplist = new Array();
var permissionlist = new Array();
var curPermissionGroup;
var curPermission;
$(function(){
    getAllPermissionGroup(0);
    
    $("#grouptable tbody").on("click", "tr", function(){
        var index = $(this).data("index");
        curPermissionGroup = permissiongrouplist[index];
        getAllPermission(curPermissionGroup.id);
    });
    
    /////////////////////////////////////////////////////////
    
    $('#editPermissionGroupDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curPermissionGroup = permissiongrouplist[index];
        $(this).find("[name='groupname']").val(curPermissionGroup.name);
        $(this).find("[name='groupdesc']").val(curPermissionGroup.desc);
        $(this).find('#editPermissionGroupBtn').attr("data-id",curPermissionGroup.id);
    });
    
    $('#delPermissionGroupDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curPermissionGroup = permissiongrouplist[index];
        $(this).find('.modal-body').text("是否删除权限组  \""+curPermissionGroup.name+"\"?");
        $(this).find('#delPermissionGroupBtn').attr("data-id",curPermissionGroup.id);
    });

    /////////////////////////////////////////////////////////
    
    $('#addPermissionDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        $(this).find("[name='groupname']").val(curPermissionGroup.name);
    });

    $('#editPermissionDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curPermission = permissionlist[index];
        $(this).find("[name='groupname']").val(curPermission.groupName);
        $(this).find("[name='permissiontitle']").val(curPermission.title);
        $(this).find("[name='permissiondesc']").val(curPermission.desc);
        $(this).find('#editPermissionBtn').attr("data-id",curPermission.id);
    });
    
    $('#delPermissionDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curPermission = permissionlist[index];
        $(this).find('.modal-body').text("是否删除权限  \""+curPermission.title+"\"?");
        $(this).find('#delPermissionBtn').attr("data-id",curPermission.id);
    });
    
    /////////////////////////////////////////////////////////
    
    $("#addPermissionGroupBtn").on("click",function(){
        var permissiongroup = new Object();
        permissiongroup.name = $("#addPermissionGroupForm").find("[name='groupname']").val();
        permissiongroup.desc = $("#addPermissionGroupForm").find("[name='groupdesc']").val();
        addPermissionGroup(permissiongroup);
    });
    
    $("#editPermissionGroupBtn").on("click",function(){
        curPermissionGroup.name = $("#editPermissionGroupForm").find("[name='groupname']").val();
        curPermissionGroup.desc = $("#editPermissionGroupForm").find("[name='groupdesc']").val();
        editPermissionGroup(curPermissionGroup);
    });
    
    $("#delPermissionGroupBtn").on("click",function(){
        var id = $(this).attr("data-id");
        delPermissionGroup(id);
    });
    
    /////////////////////////////////////////////////////////
    
    $("#addPermissionBtn").on("click",function(){
        var permission = new Object();
        permission.name = $("#addPermissionForm").find("[name='permissionname']").val();
        permission.title = $("#addPermissionForm").find("[name='permissiontitle']").val();
        permission.desc = $("#addPermissionForm").find("[name='permissiondesc']").val();
        permission.groupId = curPermissionGroup.id;
        addPermission(permission);
    });
    
    $("#editPermissionBtn").on("click",function(){
        curPermission.title = $("#editPermissionForm").find("[name='permissiontitle']").val();
        curPermission.desc = $("#editPermissionForm").find("[name='permissiondesc']").val();
        editPermission(curPermission);
    });
    
    $("#delPermissionBtn").on("click",function(){
        var id = $(this).attr("data-id");
        delPermission(id);
    });
    
});
</script>

</body>
</html>