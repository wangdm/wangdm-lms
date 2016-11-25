<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<#include "action-head.jsp">
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/plugins/dtree//dtree.css"/>
<script type="text/javascript" src="${contextPath}/assets/plugins/dtree//dtree.js"></script>
<title></title>
</head>
<body>

<div class="lefttree">
    <#include "grouptree.jsp">
</div>

<div class="rightcontent">
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="operationbar">
                <div class="operation"><a href="#addGroupDialog" data-toggle="modal"><img src="${contextPath}/assets/images/add.png"/><span>&nbsp;添加分组</span></a></div>
            </div>
        </div>
    </div>
        <table class="table table-bordered table-hover table-striped table-condensed">
        <thead>
             <tr>
               <th>用户组名</th>
               <th>所属组</th>
               <th>用户数</th>
               <th>编辑</th>
               <th>删除</th>
             </tr>
        </thead>
        <tbody>
        </tbody>
        </table>
    <div id="NoDataWarning" class="alert alert-warning" role="alert" style="padding:5px 15px;text-align:center;display:none">
      <span>未查询到数据</span>
    </div>
</div>

<!-- 添加用户组对话框 -->
<div class="modal fade" id="addGroupDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加分组</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="addGroupForm" name="addGroupForm">
              <div class="form-group">
                <label for="parentname" class="col-sm-3 control-label">父用户组：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="parentname" readonly>
                </div>
              </div>
              <div class="form-group">
                <label for="groupname" class="col-sm-3 control-label">用户组名：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="groupname">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary btn-sm" id="addGroupBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 添加用户组对话框 -->
<div class="modal fade" id="editGroupDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">重命名分组</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="editGroupForm" name="editGroupForm">
              <div class="form-group">
                <label for="groupname" class="col-sm-3 control-label">用户组名：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="groupname">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary btn-sm" id="editGroupBtn">重命名</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 添加用户组对话框 -->
<div class="modal fade" id="delGroupDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">删除分组</h4>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary btn-sm" id="delGroupBtn">删除</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
$(function(){
    
    getDirectChildrenGroup(1);
    
    $(".lefttree").on("click",".node",function(){
        var groupId = $(this).attr("data-id");
        getDirectChildrenGroup(groupId);
        var input = $('#addGroupDialog').find("[name='parentname']");
        input.val($(this).text());
        $(input).attr("data-parentId", groupId);
    });
    
    $('#editGroupDialog').on('show.bs.modal', function (event) {
          var button = $(event.relatedTarget)
          var tr = $(button).parentsUntil("tbody").filter("tr");
          var id = tr.data('id');
          var name = $(tr).children("td:first").text();
          $(this).find("[name='groupname']").val(name);
          $(this).find('#editGroupBtn').attr("data-id",id);
    })
    
    $('#delGroupDialog').on('show.bs.modal', function (event) {
          var button = $(event.relatedTarget)
          var tr = $(button).parentsUntil("tbody").filter("tr");
          var id = tr.data('id');
          var name = $(tr).children("td:first").text();
          $(this).find('.modal-body').text("是否删除  \""+name+"\" 分组?");
          $(this).find('#delGroupBtn').attr("data-id",id);
    })
        
    $("#addGroupBtn").on("click",function(){
        name = $("#addGroupForm").find("[name='groupname']").val();
        parentId = $("#addGroupForm").find("[name='parentname']").attr("data-parentid");
        addGroup(name,parentId);
    });
    
    $("#editGroupBtn").on("click",function(){
        name = $("#editGroupForm").find("[name='groupname']").val();
        groupId = $(this).attr("data-id");
        editGroup(name,groupId)
    });
    
    $("#delGroupBtn").on("click",function(){
    	groupId = $(this).attr("data-id");
    	delGroup(groupId);
    });
});
</script>
</body>
</html>