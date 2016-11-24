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
                <div class="operation"><a href="#addDeviceDialog" data-toggle="modal"><img src="${contextPath}/assets/images/add.png"/><span>&nbsp;添加录播设备</span></a></div>
                <div class="operation"><a href="#delDeviceDialog" data-toggle="modal"><img src="${contextPath}/assets/images/delete.png"/><span>&nbsp;删除所选录播设备</span></a></div>
            </div>
        </div>
    </div>
    <table class="table table-bordered table-hover">
        <thead>
             <tr>
               <th><input type="checkbox" name="device"></th>
               <th>编号</th>
               <th>设备名</th>
               <th>推流地址</th>
               <th>观看地址</th>
               <th>推流状态</th>
               <th>录像状态</th>
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

<!-- 添加录播设备对话框 -->
<div class="modal fade" id="addDeviceDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加录播设备</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="addDeviceForm" name="addDeviceForm">
              <div class="form-group">
                <label for="deviceSN" class="col-sm-3 control-label">编号：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="deviceSN">
                </div>
              </div>
              <div class="form-group">
                <label for="deviceName" class="col-sm-3 control-label">录播设备：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="deviceName">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="addDeviceBtn">添加</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 重命名角色名对话框 -->
<div class="modal fade" id="editDeviceDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">修改</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="editDeviceForm" name="editDeviceForm">
              <div class="form-group">
                <label for="deviceSN" class="col-sm-3 control-label">编号：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="deviceSN">
                </div>
              </div>
              <div class="form-group">
                <label for="deviceName" class="col-sm-3 control-label">新录播设备名：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="deviceName">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="editDeviceBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 删除角色对话框 -->
<div class="modal fade" id="delDeviceDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">删除录播设备</h4>
      </div>
      <div class="modal-body">
        <span>确认删除录播设备</span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="delDeviceBtn">删除</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
var deviceList = new Array();
var curDevice;
var curPage = 0;
$(function(){
    getAllDevice(0);
    $('#editDeviceDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curDevice = deviceList[index];
        $(this).find("[name='deviceSN']").val(curDevice.sn);
        $(this).find("[name='deviceName']").val(curDevice.name);
        $(this).find("[name='devicePushUri']").val(curDevice.pushUri);
        $(this).find("[name='devicePlayUri']").val(curDevice.playUri);
        $(this).find('#editDeviceBtn').data("id",deviceList[index].id);
    });
    
    $('#delDeviceDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        if(index!=null){
            $(this).find('.modal-body').text("是否删除录播设备  \""+deviceList[index].name+"\"?");
            $(this).find('#delDeviceBtn').data("id",deviceList[index].id);
            $('#delDeviceBtn').prop("disabled",false);
        }else{
            if($("table input[type='checkbox']:checked").size()>0){
                $(this).find('.modal-body').text("是否删除所选录播设备 ?");
                $(this).find('#delDeviceBtn').data("id",-1);
                $('#delDeviceBtn').prop("disabled",false);
            }else{
                $(this).find('.modal-body').text("没有录播设备被选中");
                $('#delDeviceBtn').prop("disabled",true);
            }
        }
    });
    
    $("#addDeviceBtn").on("click",function(){
    	var device = {sn:"",name:""};
        device.sn = $("#addDeviceForm").find("[name='deviceSN']").val();
        device.name = $("#addDeviceForm").find("[name='deviceName']").val();
        addDevice(device);
    });
    
    $("#editDeviceBtn").on("click",function(){
        curDevice.sn = $("#editDeviceForm").find("[name='deviceSN']").val();
        curDevice.name = $("#editDeviceForm").find("[name='deviceName']").val();
        editDevice(curDevice);
        console.log(JSON.stringify(curDevice));
    });
    
    $("thead input[name='device']").on("click",function(){
        if($(this).is(':checked')){
            $("tbody input[type='checkbox']").prop("checked",true);
        }else{
            $("tbody input[type='checkbox']").prop("checked",false);
        }
    });
    
    $("#delDeviceBtn").on("click",function(){74
        deviceId = $(this).data("id");
        if(deviceId>0){
            delDevice(deviceId);
            $("tbody tr[data-id='"+deviceId+"']").remove();
        }else{
            $("tbody input[type='checkbox']:checked").each(function(){
                var tr = $(this).parentsUntil("tbody").filter("tr");
                var index = $(tr).data('index');
                delDevice(deviceList[index].id);
                $(tr).remove();
            });
        }
    });
    
    $("#content-page .pagination").on("click","li",function(){
        var page = $(this).data("page");
        if(page!=undefined)
        	getAllDevice(page);
    });
});
</script>
</body>
</html>