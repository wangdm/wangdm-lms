
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
                <div class="operation"><a href="#addMenuDialog" data-toggle="modal"><img src="${contextPath}/assets/images/add.png"/><span>&nbsp;添加导航</span></a></div>
                <div class="operation"><a href="#delMenuDialog" data-toggle="modal"><img src="${contextPath}/assets/images/delete.png"/><span>&nbsp;删除所选导航</span></a></div>
            </div>
        </div>
    </div>
    <table class="table table-bordered table-hover">
        <thead>
             <tr>
               <th><input type="checkbox" name="selectAll"></th>
               <th>标题</th>
               <th>显示循序</th>
               <th>图标</th>
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

<!-- 添加导航对话框 -->
<div class="modal fade" id="addMenuDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加导航</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="addMenuForm" name="addMenuForm">
              <div class="form-group">
                <label for="menutitle" class="col-sm-3 control-label">标题：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="menutitle">
                </div>
              </div>
              <div class="form-group">
                <label for="menuindex" class="col-sm-3 control-label">显示循序：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="menuindex">
                </div>
              </div>
              <div class="form-group">
                <label for="menuurl" class="col-sm-3 control-label">连接：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="menuurl">
                </div>
              </div>
              <div class="form-group">
                <label for="menuimage" class="col-sm-3 control-label">图片：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="menuimage">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="addMenuBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 修改导航对话框 -->
<div class="modal fade" id="editMenuDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">编辑导航</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="editMenuForm" name="editMenuForm">
              <div class="form-group">
                <label for="menutitle" class="col-sm-3 control-label">标题：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="menutitle">
                </div>
              </div>
              <div class="form-group">
                <label for="menuindex" class="col-sm-3 control-label">显示循序：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="menuindex">
                </div>
              </div>
              <div class="form-group">
                <label for="menuurl" class="col-sm-3 control-label">连接：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="menuurl">
                </div>
              </div>
              <div class="form-group">
                <label for="menuimage" class="col-sm-3 control-label">图片：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="menuimage">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="editMenuBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 删除导航对话框 -->
<div class="modal fade" id="delMenuDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">删除导航</h4>
      </div>
      <div class="modal-body">
        <span>确认删除导航</span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="delMenuBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
var menuList = new Array();
var curMenu;
var curPage = 0;
$(function(){
    getAllMenu(0);
    
    /////////////////////////////////////////////////////////
    
    $('#addMenuDialog').on('show.bs.modal', function (event) {
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
        $(this).find("[name='menudeadtime']").val(datestr);
        $(this).find("[name='menuindex']").val(0);
    });
    
    $('#editMenuDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curMenu = menuList[index];
        $(this).find("[name='menutitle']").val(curMenu.name);
        $(this).find("[name='menuindex']").val(curMenu.idx);
        $(this).find("[name='menuurl']").val(curMenu.url);
        $(this).find("[name='menuimage']").val(curMenu.icon);
        $(this).find('#editMenuBtn').data("id",curMenu.id);
    });
    
    $('#delMenuDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        if(index!=null){
            $(this).find('.modal-body').text("是否删除导航  \""+menuList[index].title+"\"?");
            $(this).find('#delMenuBtn').data("id",menuList[index].id);
            $('#delMenuBtn').prop("disabled",false);
        }else{
            if($("table input[type='checkbox']:checked").size()>0){
                $(this).find('.modal-body').text("是否删除所选导航 ?");
                $(this).find('#delMenuBtn').data("id",-1);
                $('#delMenuBtn').prop("disabled",false);
            }else{
                $(this).find('.modal-body').text("没有导航被选中");
                $('#delMenuBtn').prop("disabled",true);
            }
        }
    });
    
    /////////////////////////////////////////////////////////
    
    $("#addMenuBtn").on("click",function(){
        var menu = {};
        menu.name      = $("#addMenuForm").find("[name='menutitle']").val();
        menu.idx        = $("#addMenuForm").find("[name='menuindex']").val();
        menu.url        = $("#addMenuForm").find("[name='menuurl']").val();
        menu.icon      = $("#addMenuForm").find("[name='menuimage']").val();
        addMenu(menu);
    });
    
    $("#editMenuBtn").on("click",function(){
        var menu = {};
        menu.id         = $(this).data("id");
        menu.name      = $("#editMenuForm").find("[name='menutitle']").val();
        menu.idx        = $("#editMenuForm").find("[name='menuindex']").val();
        menu.url        = $("#editMenuForm").find("[name='menuurl']").val();
        menu.icon      = $("#editMenuForm").find("[name='menuimage']").val();
        editMenu(menu);
    });
    
    /////////////////////////////////////////////////////////
    
    $("thead input[name='selectAll']").on("click",function(){
        if($(this).is(':checked')){
            $("tbody input[name='menu']").prop("checked",true);
        }else{
            $("tbody input[name='menu']").prop("checked",false);
        }
    });
    
    $("tbody").on("click","input[name='show']",function(){
        var index = $(this).data('index');
        var menu = {};
        menu.id = menuList[index].id;
        if($(this).is(':checked')){
            menu.display = true;
        }else{
            menu.display = false;
        }
        editMenu(menu);
    });
    
    $("#delMenuBtn").on("click",function(){
        menuId = $(this).data("id");
        if(menuId>0){
            delMenu(menuId);
            $("tbody tr[data-id='"+menuId+"']").remove();
        }else{
            $("tbody input[name='menu']:checked").each(function(){
                var tr = $(this).parentsUntil("tbody").filter("tr");
                var index = $(tr).data('index');
                delMenu(menuList[index].id);
                $(tr).remove();
            });
        }
    });
    
    $("#content-page .pagination").on("click","li",function(){
    	var page = $(this).data("page");
    	if(page!=undefined)
    	    getAllMenu(page);
    });
});
</script>
</body>
</html>