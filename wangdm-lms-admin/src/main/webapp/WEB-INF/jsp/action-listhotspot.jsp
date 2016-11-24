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
                <div class="operation"><a href="#addHotspotDialog" data-toggle="modal"><img src="${contextPath}/assets/images/add.png"/><span>&nbsp;添加热点</span></a></div>
                <div class="operation"><a href="#delHotspotDialog" data-toggle="modal"><img src="${contextPath}/assets/images/delete.png"/><span>&nbsp;删除所选热点</span></a></div>
            </div>
        </div>
    </div>
    <table class="table table-bordered table-hover">
        <thead>
             <tr>
               <th><input type="checkbox" name="selectAll"></th>
               <th>显示循序</th>
               <th>标题</th>
               <th>图片</th>
               <th>连接</th>
               <th>添加时间</th>
               <th>失效时间</th>
               <th>显示</th>
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

<!-- 添加热点对话框 -->
<div class="modal fade" id="addHotspotDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加热点</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="addHotspotForm" name="addHotspotForm">
              <div class="form-group">
                <label for="hotspottitle" class="col-sm-3 control-label">标题：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="hotspottitle">
                </div>
              </div>
              <div class="form-group">
                <label for="hotspotindex" class="col-sm-3 control-label">显示循序：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="hotspotindex">
                </div>
              </div>
              <div class="form-group">
                <label for="hotspoturl" class="col-sm-3 control-label">连接：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="hotspoturl">
                </div>
              </div>
              <div class="form-group">
                <label for="hotspotimage" class="col-sm-3 control-label">图片：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="hotspotimage">
                </div>
              </div>
              <div class="form-group">
                <label for="hotspotdeadtime" class="col-sm-3 control-label">失效时间：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="hotspotdeadtime">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="addHotspotBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 修改热点对话框 -->
<div class="modal fade" id="editHotspotDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">编辑热点</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="editHotspotForm" name="editHotspotForm">
              <div class="form-group">
                <label for="hotspottitle" class="col-sm-3 control-label">标题：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="hotspottitle">
                </div>
              </div>
              <div class="form-group">
                <label for="hotspotindex" class="col-sm-3 control-label">显示循序：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="hotspotindex">
                </div>
              </div>
              <div class="form-group">
                <label for="hotspoturl" class="col-sm-3 control-label">连接：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="hotspoturl">
                </div>
              </div>
              <div class="form-group">
                <label for="hotspotimage" class="col-sm-3 control-label">图片：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="hotspotimage">
                </div>
              </div>
              <div class="form-group">
                <label for="hotspotdeadtime" class="col-sm-3 control-label">失效时间：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="hotspotdeadtime">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="editHotspotBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 删除热点对话框 -->
<div class="modal fade" id="delHotspotDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">删除热点</h4>
      </div>
      <div class="modal-body">
        <span>确认删除热点</span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="delHotspotBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
var hotspotList = new Array();
var curHotspot;
var curPage = 0;
$(function(){
    getAllHotspot(0);
    
    /////////////////////////////////////////////////////////
    
    $('#addHotspotDialog').on('show.bs.modal', function (event) {
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
        $(this).find("[name='hotspotdeadtime']").val(datestr);
        $(this).find("[name='hotspotindex']").val(0);
    });
    
    $('#editHotspotDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curHotspot = hotspotList[index];
        $(this).find("[name='hotspottitle']").val(curHotspot.title);
        $(this).find("[name='hotspotindex']").val(curHotspot.idx);
        $(this).find("[name='hotspoturl']").val(curHotspot.url);
        $(this).find("[name='hotspotimage']").val(curHotspot.image);
        $(this).find("[name='hotspotdeadtime']").val(curHotspot.expireTime);
        $(this).find('#editHotspotBtn').data("id",curHotspot.id);
    });
    
    $('#delHotspotDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        if(index!=null){
            $(this).find('.modal-body').text("是否删除热点  \""+hotspotList[index].title+"\"?");
            $(this).find('#delHotspotBtn').data("id",hotspotList[index].id);
            $('#delHotspotBtn').prop("disabled",false);
        }else{
            if($("table input[type='checkbox']:checked").size()>0){
                $(this).find('.modal-body').text("是否删除所选热点 ?");
                $(this).find('#delHotspotBtn').data("id",-1);
                $('#delHotspotBtn').prop("disabled",false);
            }else{
                $(this).find('.modal-body').text("没有热点被选中");
                $('#delHotspotBtn').prop("disabled",true);
            }
        }
    });
    
    /////////////////////////////////////////////////////////
    
    $("#addHotspotBtn").on("click",function(){
        var hotspot = {};
        hotspot.title      = $("#addHotspotForm").find("[name='hotspottitle']").val();
        hotspot.idx        = $("#addHotspotForm").find("[name='hotspotindex']").val();
        hotspot.url        = $("#addHotspotForm").find("[name='hotspoturl']").val();
        hotspot.image      = $("#addHotspotForm").find("[name='hotspotimage']").val();
        hotspot.expireTime = $("#addHotspotForm").find("[name='hotspotdeadtime']").val();
        addHotspot(hotspot);
    });
    
    $("#editHotspotBtn").on("click",function(){
        var hotspot = {};
        hotspot.id         = $(this).data("id");
        hotspot.title      = $("#editHotspotForm").find("[name='hotspottitle']").val();
        hotspot.idx        = $("#editHotspotForm").find("[name='hotspotindex']").val();
        hotspot.url        = $("#editHotspotForm").find("[name='hotspoturl']").val();
        hotspot.image      = $("#editHotspotForm").find("[name='hotspotimage']").val();
        hotspot.expireTime = $("#editHotspotForm").find("[name='hotspotdeadtime']").val();
        editHotspot(hotspot);
        console.log(JSON.stringify(hotspot));
    });
    
    /////////////////////////////////////////////////////////
    
    $("thead input[name='selectAll']").on("click",function(){
        if($(this).is(':checked')){
            $("tbody input[name='hotspot']").prop("checked",true);
        }else{
            $("tbody input[name='hotspot']").prop("checked",false);
        }
    });
    
    $("tbody").on("click","input[name='show']",function(){
        var index = $(this).data('index');
        var hotspot = {};
        hotspot.id = hotspotList[index].id;
        if($(this).is(':checked')){
            hotspot.display = true;
        }else{
            hotspot.display = false;
        }
        editHotspot(hotspot);
    });
    
    $("#delHotspotBtn").on("click",function(){
        hotspotId = $(this).data("id");
        if(hotspotId>0){
            delHotspot(hotspotId);
            $("tbody tr[data-id='"+hotspotId+"']").remove();
        }else{
            $("tbody input[name='hotspot']:checked").each(function(){
                var tr = $(this).parentsUntil("tbody").filter("tr");
                var index = $(tr).data('index');
                delHotspot(hotspotList[index].id);
                $(tr).remove();
            });
        }
    });
    
    $("#content-page .pagination").on("click","li",function(){
    	var page = $(this).data("page");
    	if(page!=undefined)
    	    getAllHotspot(page);
    });
});
</script>
</body>
</html>