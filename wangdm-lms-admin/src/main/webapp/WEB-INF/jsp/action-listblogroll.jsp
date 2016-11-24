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
                <div class="operation"><a href="#addBlogRollDialog" data-toggle="modal"><img src="${contextPath}/assets/images/add.png"/><span>&nbsp;添加友情链接</span></a></div>
                <div class="operation"><a href="#delBlogRollDialog" data-toggle="modal"><img src="${contextPath}/assets/images/delete.png"/><span>&nbsp;删除所选友情链接</span></a></div>
            </div>
        </div>
    </div>
    <table class="table table-bordered table-hover">
        <thead>
             <tr>
               <th><input type="checkbox" name="selectAll"></th>
               <th>标题</th>
               <th>显示循序</th>
               <th>图片</th>
               <th>连接</th>
               <th>显示</th>
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

<!-- 添加友情链接对话框 -->
<div class="modal fade" id="addBlogRollDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加友情链接</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="addBlogRollForm" name="addBlogRollForm">
              <div class="form-group">
                <label for="blogrolltitle" class="col-sm-3 control-label">标题：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="blogrolltitle">
                </div>
              </div>
              <div class="form-group">
                <label for="blogrollindex" class="col-sm-3 control-label">显示循序：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="blogrollindex">
                </div>
              </div>
              <div class="form-group">
                <label for="blogrollurl" class="col-sm-3 control-label">连接：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="blogrollurl">
                </div>
              </div>
              <div class="form-group">
                <label for="blogrollimage" class="col-sm-3 control-label">图片：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="blogrollimage">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="addBlogRollBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 修改友情链接对话框 -->
<div class="modal fade" id="editBlogRollDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">编辑友情链接</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="editBlogRollForm" name="editBlogRollForm">
              <div class="form-group">
                <label for="blogrolltitle" class="col-sm-3 control-label">标题：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="blogrolltitle">
                </div>
              </div>
              <div class="form-group">
                <label for="blogrollindex" class="col-sm-3 control-label">显示循序：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="blogrollindex">
                </div>
              </div>
              <div class="form-group">
                <label for="blogrollurl" class="col-sm-3 control-label">连接：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="blogrollurl">
                </div>
              </div>
              <div class="form-group">
                <label for="blogrollimage" class="col-sm-3 control-label">图片：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="blogrollimage">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="editBlogRollBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 删除友情链接对话框 -->
<div class="modal fade" id="delBlogRollDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">删除友情链接</h4>
      </div>
      <div class="modal-body">
        <span>确认删除友情链接</span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="delBlogRollBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
var blogrollList = new Array();
var curBlogRoll;
var curPage = 0;
$(function(){
    getAllBlogRoll(0);
    
    /////////////////////////////////////////////////////////
    
    $('#addBlogRollDialog').on('show.bs.modal', function (event) {
        var date = new Date();
        date.setTime(date.getTime()+10*24*60*60*1000);
        var datestr = date.getFullYear()+"-";
        if(date.getMonth()<9)
            datestr += "0"+(date.getMonth()+1)+"-";
        else{
            datestr += (date.getMonth()+1)+"-";
        }
        if(date.getDate()<10)
            datestr += "0"+date.getDate()+" 23:59:59";
        else{
            datestr += date.getDate()+" 23:59:59";
        }
        $(this).find("[name='blogrolldeadtime']").val(datestr);
        $(this).find("[name='blogrollindex']").val(0);
    });
    
    $('#editBlogRollDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curBlogRoll = blogrollList[index];
        $(this).find("[name='blogrolltitle']").val(curBlogRoll.title);
        $(this).find("[name='blogrollindex']").val(curBlogRoll.idx);
        $(this).find("[name='blogrollurl']").val(curBlogRoll.url);
        $(this).find("[name='blogrollimage']").val(curBlogRoll.image);
        $(this).find('#editBlogRollBtn').data("id",curBlogRoll.id);
    });
    
    $('#delBlogRollDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        if(index!=null){
            $(this).find('.modal-body').text("是否删除友情链接  \""+blogrollList[index].title+"\"?");
            $(this).find('#delBlogRollBtn').data("id",blogrollList[index].id);
            $('#delBlogRollBtn').prop("disabled",false);
        }else{
            if($("table input[type='checkbox']:checked").size()>0){
                $(this).find('.modal-body').text("是否删除所选友情链接 ?");
                $(this).find('#delBlogRollBtn').data("id",-1);
                $('#delBlogRollBtn').prop("disabled",false);
            }else{
                $(this).find('.modal-body').text("没有友情链接被选中");
                $('#delBlogRollBtn').prop("disabled",true);
            }
        }
    });
    
    /////////////////////////////////////////////////////////
    
    $("#addBlogRollBtn").on("click",function(){
        var blogroll = {};
        blogroll.title      = $("#addBlogRollForm").find("[name='blogrolltitle']").val();
        blogroll.idx        = $("#addBlogRollForm").find("[name='blogrollindex']").val();
        blogroll.url        = $("#addBlogRollForm").find("[name='blogrollurl']").val();
        blogroll.image      = $("#addBlogRollForm").find("[name='blogrollimage']").val();
        addBlogRoll(blogroll);
    });
    
    $("#editBlogRollBtn").on("click",function(){
        var blogroll = {};
        blogroll.id         = $(this).data("id");
        blogroll.title      = $("#editBlogRollForm").find("[name='blogrolltitle']").val();
        blogroll.idx        = $("#editBlogRollForm").find("[name='blogrollindex']").val();
        blogroll.url        = $("#editBlogRollForm").find("[name='blogrollurl']").val();
        blogroll.image      = $("#editBlogRollForm").find("[name='blogrollimage']").val();
        editBlogRoll(blogroll);
    });
    
    /////////////////////////////////////////////////////////
    
    $("thead input[name='selectAll']").on("click",function(){
        if($(this).is(':checked')){
            $("tbody input[name='blogroll']").prop("checked",true);
        }else{
            $("tbody input[name='blogroll']").prop("checked",false);
        }
    });
    
    $("tbody").on("click","input[name='show']",function(){
        var index = $(this).data('index');
        var blogroll = {};
        blogroll.id = blogrollList[index].id;
        if($(this).is(':checked')){
            blogroll.display = true;
        }else{
            blogroll.display = false;
        }
        editBlogRoll(blogroll);
    });
    
    $("#delBlogRollBtn").on("click",function(){
        blogrollId = $(this).data("id");
        if(blogrollId>0){
            delBlogRoll(blogrollId);
            $("tbody tr[data-id='"+blogrollId+"']").remove();
        }else{
            $("tbody input[name='blogroll']:checked").each(function(){
                var tr = $(this).parentsUntil("tbody").filter("tr");
                var index = $(tr).data('index');
                delBlogRoll(blogrollList[index].id);
                $(tr).remove();
            });
        }
    });
    
    $("#content-page .pagination").on("click","li",function(){
        var page = $(this).data("page");
        if(page!=undefined)
            getAllBlogRoll(page);
    });
});
</script>
</body>
</html>