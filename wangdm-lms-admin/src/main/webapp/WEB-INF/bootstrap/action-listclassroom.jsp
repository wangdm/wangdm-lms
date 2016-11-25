
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
                <div class="operation"><a href="#addRoomDialog" data-toggle="modal"><img src="${contextPath}/assets/images/add.png"/><span>&nbsp;添加录播室</span></a></div>
                <div class="operation"><a href="#delRoomDialog" data-toggle="modal"><img src="${contextPath}/assets/images/delete.png"/><span>&nbsp;删除所选录播室</span></a></div>
            </div>
        </div>
    </div>
    <table class="table table-bordered table-hover">
        <thead>
             <tr>
               <th><input type="checkbox" name="room"></th>
               <th>编号</th>
               <th>录播室</th>
               <th>地址</th>
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

<!-- 添加录播室对话框 -->
<div class="modal fade" id="addRoomDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加录播室</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="addRoomForm" name="addRoomForm">
              <div class="form-group">
                <label for="roomSN" class="col-sm-3 control-label">编号：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="roomSN">
                </div>
              </div>
              <div class="form-group">
                <label for="roomName" class="col-sm-3 control-label">录播室：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="roomName">
                </div>
              </div>
              <div class="form-group">
                <label for="roomAddress" class="col-sm-3 control-label">地址：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="roomAddress">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="addRoomBtn">添加</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 重命名角色名对话框 -->
<div class="modal fade" id="editRoomDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">修改</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="editRoomForm" name="editRoomForm">
              <div class="form-group">
                <label for="roomSN" class="col-sm-3 control-label">编号：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="roomSN">
                </div>
              </div>
              <div class="form-group">
                <label for="roomName" class="col-sm-3 control-label">新录播室名：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="roomName">
                </div>
              </div>
              <div class="form-group">
                <label for="roomAddress" class="col-sm-3 control-label">地址：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="roomAddress">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="editRoomBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 删除角色对话框 -->
<div class="modal fade" id="delRoomDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">删除录播室</h4>
      </div>
      <div class="modal-body">
        <span>确认删除录播室</span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="delRoomBtn">删除</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
var roomList = new Array();
var curRoom;
var curPage = 0;
$(function(){
    getAllRoom(0);
    $('#editRoomDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curRoom = roomList[index];
        $(this).find("[name='roomSN']").val(curRoom.sn);
        $(this).find("[name='roomName']").val(curRoom.name);
        $(this).find("[name='roomAddress']").val(curRoom.address);
        $(this).find('#editRoomBtn').data("id",curRoom.id);
    });
    
    $('#delRoomDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        if(index!=null){
            $(this).find('.modal-body').text("是否删除录播室  \""+roomList[index].name+"\"?");
            $(this).find('#delRoomBtn').data("id",roomList[index].id);
            $('#delRoomBtn').prop("disabled",false);
        }else{
            if($("table input[type='checkbox']:checked").size()>0){
                $(this).find('.modal-body').text("是否删除所选录播室 ?");
                $(this).find('#delRoomBtn').data("id",-1);
                $('#delRoomBtn').prop("disabled",false);
            }else{
                $(this).find('.modal-body').text("没有录播室被选中");
                $('#delRoomBtn').prop("disabled",true);
            }
        }
    });
    
    $("#addRoomBtn").on("click",function(){
    	var room = {sn:"",name:"",address:""};
        room.sn = $("#addRoomForm").find("[name='roomSN']").val();
    	room.name = $("#addRoomForm").find("[name='roomName']").val();
        room.address = $("#addRoomForm").find("[name='roomAddress']").val();
        addRoom(room);
    });
    
    $("#editRoomBtn").on("click",function(){
        curRoom.sn = $("#editRoomForm").find("[name='roomSN']").val();
        curRoom.name = $("#editRoomForm").find("[name='roomName']").val();
        curRoom.address = $("#editRoomForm").find("[name='roomAddress']").val();
        editRoom(curRoom);
        console.log(JSON.stringify(curRoom));
    });
    
    $("thead input[name='room']").on("click",function(){
        if($(this).is(':checked')){
            $("tbody input[type='checkbox']").prop("checked",true);
        }else{
            $("tbody input[type='checkbox']").prop("checked",false);
        }
    });
    
    $("#delRoomBtn").on("click",function(){
        roomId = $(this).data("id");
        if(roomId>0){
            delRoom(roomId);
        }else{
            $("tbody input[type='checkbox']:checked").each(function(){
                var tr = $(this).parentsUntil("tbody").filter("tr");
                var index = $(tr).data('index');
                delRoom(roomList[index].id);
            });
        }
    });
    
    $("#content-page .pagination").on("click","li",function(){
        var page = $(this).data("page");
        if(page!=undefined)
        	getAllRoom(page);
    });
});
</script>
</body>
</html>