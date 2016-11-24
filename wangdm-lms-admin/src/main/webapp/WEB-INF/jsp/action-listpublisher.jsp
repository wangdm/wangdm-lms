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
                <div class="operation"><a href="#addPublisherDialog" data-toggle="modal"><img src="${contextPath}/assets/images/add.png"/><span>&nbsp;添加出版社</span></a></div>
                <div class="operation"><a href="#delPublisherDialog" data-toggle="modal"><img src="${contextPath}/assets/images/delete.png"/><span>&nbsp;删除所选出版社</span></a></div>
            </div>
        </div>
    </div>
    <table class="table table-bordered table-hover">
        <thead>
             <tr>
               <th><input type="checkbox" name="publisher"></th>
               <th>编号</th>
               <th>出版社</th>
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

<!-- 添加出版社对话框 -->
<div class="modal fade" id="addPublisherDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加出版社</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="addPublisherForm" name="addPublisherForm">
              <div class="form-group">
                <label for="publisherSN" class="col-sm-3 control-label">编号：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="publisherSN">
                </div>
              </div>
              <div class="form-group">
                <label for="publisherName" class="col-sm-3 control-label">出版社：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="publisherName">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="addPublisherBtn">添加</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 重命名角色名对话框 -->
<div class="modal fade" id="editPublisherDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">修改</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="editPublisherForm" name="editPublisherForm">
              <div class="form-group">
                <label for="publisherSN" class="col-sm-3 control-label">编号：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="publisherSN">
                </div>
              </div>
              <div class="form-group">
                <label for="publisherName" class="col-sm-3 control-label">新出版社名：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="publisherName">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="editPublisherBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 删除角色对话框 -->
<div class="modal fade" id="delPublisherDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">删除出版社</h4>
      </div>
      <div class="modal-body">
        <span>确认删除出版社</span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="delPublisherBtn">删除</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
var publisherList = new Array();
var curPublisher;
var curPage = 0;
$(function(){
    getAllPublisher(0);
    $('#editPublisherDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curPublisher = publisherList[index];
        $(this).find("[name='publisherName']").val(publisherList[index].name);
        $(this).find("[name='publisherSN']").val(publisherList[index].sn);
        $(this).find('#editPublisherBtn').data("id",publisherList[index].id);
    });
    
    $('#delPublisherDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        if(index!=null){
            $(this).find('.modal-body').text("是否删除出版社  \""+publisherList[index].name+"\"?");
            $(this).find('#delPublisherBtn').data("id",publisherList[index].id);
            $('#delPublisherBtn').prop("disabled",false);
        }else{
            if($("table input[type='checkbox']:checked").size()>0){
                $(this).find('.modal-body').text("是否删除所选出版社 ?");
                $(this).find('#delPublisherBtn').data("id",-1);
                $('#delPublisherBtn').prop("disabled",false);
            }else{
                $(this).find('.modal-body').text("没有出版社被选中");
                $('#delPublisherBtn').prop("disabled",true);
            }
        }
    });
    
    $("#addPublisherBtn").on("click",function(){
        publisherName = $("#addPublisherForm").find("[name='publisherName']").val();
        publisherSn = $("#addPublisherForm").find("[name='publisherSN']").val();
        addPublisher(publisherName,publisherSn);
    });
    
    $("#editPublisherBtn").on("click",function(){
    	curPublisher.name = $("#editPublisherForm").find("[name='publisherName']").val();
        curPublisher.sn = $("#editPublisherForm").find("[name='publisherSN']").val();
        editPublisher(curPublisher);
        console.log(JSON.stringify(curPublisher));
    });
    
    $("thead input[name='publisher']").on("click",function(){
        if($(this).is(':checked')){
            $("tbody input[type='checkbox']").prop("checked",true);
        }else{
            $("tbody input[type='checkbox']").prop("checked",false);
        }
    });
    
    $("#delPublisherBtn").on("click",function(){
        publisherId = $(this).data("id");
        if(publisherId>0){
            delPublisher(publisherId);
        }else{
            $("tbody input[type='checkbox']:checked").each(function(){
                var tr = $(this).parentsUntil("tbody").filter("tr");
                var index = $(tr).data('index');
                delPublisher(publisherList[index].id);
            });
        }
    });
    
    $("#content-page .pagination").on("click","li",function(){
        var page = $(this).data("page");
        if(page!=undefined)
        	getAllPublisher(page);
    });
});
</script>
</body>
</html>