<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="action-head.jsp"></c:import>
<title></title>
</head>
<body>

<div class="content-wrapper">
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="operationbar">
                <div class="operation"><a href="#addGradeDialog" data-toggle="modal"><img src="${contextPath}/assets/images/add.png"/><span>&nbsp;添加年级</span></a></div>
                <div class="operation"><a href="#delGradeDialog" data-toggle="modal"><img src="${contextPath}/assets/images/delete.png"/><span>&nbsp;删除所选年级</span></a></div>
            </div>
        </div>
    </div>
    <table class="table table-bordered table-hover">
        <thead>
             <tr>
               <th><input type="checkbox" name="subject"></th>
               <th>年级</th>
               <th>重命名</th>
               <th>删除</th>
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
<div class="modal fade" id="addGradeDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加年级</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="addGradeForm" name="addGradeForm">
              <div class="form-group">
                <label for="gradeName" class="col-sm-3 control-label">年级：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="gradeName">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="addGradeBtn">添加</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 重命名角色名对话框 -->
<div class="modal fade" id="editGradeDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">重命名</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="editGradeForm" name="editGradeForm">
              <div class="form-group">
                <label for="gradeName" class="col-sm-3 control-label">新年级名：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="gradeName">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="editGradeBtn">重命名</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 删除角色对话框 -->
<div class="modal fade" id="delGradeDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">删除年级</h4>
      </div>
      <div class="modal-body">
        <span>确认删除年级</span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="delGradeBtn">删除</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
var gradeList = new Array();
var curPage = 0;
$(function(){
    getAllGrade(0);
    $('#editGradeDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        $(this).find("[name='gradeName']").val(gradeList[index].name);
        $(this).find('#editGradeBtn').data("id",gradeList[index].id);
    });
    
    $('#delGradeDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        if(index!=null){
            $(this).find('.modal-body').text("是否删除年级  \""+gradeList[index].name+"\"?");
            $(this).find('#delGradeBtn').data("id",gradeList[index].id);
            $('#delGradeBtn').prop("disabled",false);
        }else{
            if($("table input[type='checkbox']:checked").size()>0){
                $(this).find('.modal-body').text("是否删除所选年级 ?");
                $(this).find('#delGradeBtn').data("id",-1);
                $('#delGradeBtn').prop("disabled",false);
            }else{
                $(this).find('.modal-body').text("没有年级被选中");
                $('#delGradeBtn').prop("disabled",true);
            }
        }
    });
    
    $("#addGradeBtn").on("click",function(){
        gradeName = $("#addGradeForm").find("[name='gradeName']").val();
        subjectSn = $("#addGradeForm").find("[name='subjectSN']").val();
        addGrade(gradeName);
    });
    
    $("#editGradeBtn").on("click",function(){
        gradeName = $("#editGradeForm").find("[name='gradeName']").val();
        gradeId = $(this).data("id");
        editGrade(gradeName,gradeId);
    });
    
    $("thead input[name='subject']").on("click",function(){
        if($(this).is(':checked')){
            $("tbody input[type='checkbox']").prop("checked",true);
        }else{
            $("tbody input[type='checkbox']").prop("checked",false);
        }
    });
    
    $("#delGradeBtn").on("click",function(){
        gradeId = $(this).data("id");
        if(gradeId>0){
            delGrade(gradeId);
        }else{
            $("tbody input[type='checkbox']:checked").each(function(){
                var tr = $(this).parentsUntil("tbody").filter("tr");
                var index = $(tr).data('index');
                delGrade(gradeList[index].id);
            });
        }
    });
    
    $("#content-page .pagination").on("click","li",function(){
        var page = $(this).data("page");
        if(page!=undefined)
        	getAllGrade(page);
    });
});
</script>
</body>
</html>