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
                <div class="operation"><a href="#addSubjectDialog" data-toggle="modal"><img src="${contextPath}/assets/images/add.png"/><span>&nbsp;添加学科</span></a></div>
                <div class="operation"><a href="#delSubjectDialog" data-toggle="modal"><img src="${contextPath}/assets/images/delete.png"/><span>&nbsp;删除所选学科</span></a></div>
            </div>
        </div>
    </div>
    <table class="table table-bordered table-hover">
        <thead>
             <tr>
               <th><input type="checkbox" name="subject"></th>
               <th>编号</th>
               <th>学科</th>
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

    <nav id="content-page">
        <ul class="pagination">
        </ul>
    </nav>
</div>

<!-- 添加学科对话框 -->
<div class="modal fade" id="addSubjectDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加学科</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="addSubjectForm" name="addSubjectForm">
              <div class="form-group">
                <label for="subjectSN" class="col-sm-3 control-label">编号：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="subjectSN">
                </div>
              </div>
              <div class="form-group">
                <label for="subjectName" class="col-sm-3 control-label">学科：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="subjectName">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="addSubjectBtn">添加</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 编辑学科对话框 -->
<div class="modal fade" id="editSubjectDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">修改</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="editSubjectForm" name="editSubjectForm">
              <div class="form-group">
                <label for="subjectSN" class="col-sm-3 control-label">编号：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="subjectSN">
                </div>
              </div>
              <div class="form-group">
                <label for="subjectName" class="col-sm-3 control-label">学科：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="subjectName">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="editSubjectBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 删除角色对话框 -->
<div class="modal fade" id="delSubjectDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">删除学科</h4>
      </div>
      <div class="modal-body">
        <span>确认删除学科</span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="delSubjectBtn">删除</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
var subjectList = new Array();
var curSubject;
var curPage = 0;
$(function(){
    getAllSubject(0);
    $('#editSubjectDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curSubject = subjectList[index];
        $(this).find("[name='subjectSN']").val(subjectList[index].sn);
        $(this).find("[name='subjectName']").val(subjectList[index].name);
        $(this).find('#editSubjectBtn').data("id",subjectList[index].id);
    });
    
    $('#delSubjectDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        if(index!=null){
	        $(this).find('.modal-body').text("是否删除学科  \""+subjectList[index].name+"\"?");
	        $(this).find('#delSubjectBtn').data("id",subjectList[index].id);
            $('#delSubjectBtn').prop("disabled",false);
        }else{
        	if($("table input[type='checkbox']:checked").size()>0){
	            $(this).find('.modal-body').text("是否删除所选学科 ?");
	            $(this).find('#delSubjectBtn').data("id",-1);
                $('#delSubjectBtn').prop("disabled",false);
        	}else{
                $(this).find('.modal-body').text("没有学科被选中");
        		$('#delSubjectBtn').prop("disabled",true);
        	}
        }
    });
    
    $("#addSubjectBtn").on("click",function(){
    	subjectName = $("#addSubjectForm").find("[name='subjectName']").val();
    	subjectSn = $("#addSubjectForm").find("[name='subjectSN']").val();
        addSubject(subjectName,subjectSn);
    });
    
    $("#editSubjectBtn").on("click",function(){
        curSubject.sn = $("#editSubjectForm").find("[name='subjectSN']").val();
    	curSubject.name = $("#editSubjectForm").find("[name='subjectName']").val();
        editSubject(curSubject);
    });
    
    $("thead input[name='subject']").on("click",function(){
    	if($(this).is(':checked')){
    		$("tbody input[type='checkbox']").prop("checked",true);
    	}else{
            $("tbody input[type='checkbox']").prop("checked",false);
    	}
    });
    
    $("#delSubjectBtn").on("click",function(){
    	subjectId = $(this).data("id");
    	if(subjectId>0){
    	    delSubject(subjectId);
    	}else{
    		$("tbody input[type='checkbox']:checked").each(function(){
    	        var tr = $(this).parentsUntil("tbody").filter("tr");
    	        var index = $(tr).data('index');
    	        delSubject(subjectList[index].id);
    		});
    	}
    });
    
    $("#content-page .pagination").on("click","li",function(){
        var page = $(this).data("page");
        if(page!=undefined)
        	getAllSubject(page);
    });
});
</script>
</body>
</html>