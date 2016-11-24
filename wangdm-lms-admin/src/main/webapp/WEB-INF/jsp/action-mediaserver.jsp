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
<div class="col-md-12 col-lg-6">
    <div class="panel panel-default">
        <div class="panel-heading">
            <span><label><input type="radio" name="player" checked="checked" value="jwplayer">流媒体服务器</label></span>
        </div>
        <div class="panel-body">
          <form  class="form-horizontal" id="MediaServer" name="MediaServer">
              <div class="form-group">
                <label for="serverhost" class="col-sm-3 control-label">服务器地址：</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" name="serverhost">
                </div>
              </div>
              <div class="form-group">
                <label for="serverport" class="col-sm-3 control-label">服务器端口：</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control" name="serverport">
                </div>
              </div>
              <div class="form-group">
                <label for="liveapp" class="col-sm-3 control-label">直播应用：</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" name="liveapp">
                </div>
              </div>
              <div class="form-group">
                <label for="vodapp" class="col-sm-3 control-label">点播应用：</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" name="vodapp">
                </div>
              </div>
              <div class="form-group">
                <label for="vodfilepath" class="col-sm-3 control-label">点播文件路径：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="vodfilepath" readonly>
                </div>
              </div>
              <div class="form-group">
                <label for="tmpfilepath" class="col-sm-3 control-label">临时文件路径：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="tmpfilepath" readonly>
                </div>
              </div>
          </form>
        </div>
        <div class="panel-footer">
            <span><button id="saveServer" class="btn btn-primary">保存</button></span>
            <span><button id="resetServer" class="btn btn-default">重置</button></span>
        </div>
    </div>
</div>
</div>

<!-- 消息对话框 -->
<div class="modal fade" id="MessageBox" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-body">
        <span></span>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
var server;
$(function(){
    $.ajax({
        "url": sdkPath+"/server",
        "type": "GET",
        "dataType":"json",      
        "contentType":"application/json",    
    }).success(function(data){
    	server = data;
        $("#MediaServer").find("[name='serverhost']").val(server.serverHost);
        $("#MediaServer").find("[name='serverport']").val(server.serverPort);
        $("#MediaServer").find("[name='liveapp']").val(server.liveApp);
        $("#MediaServer").find("[name='vodapp']").val(server.vodApp);
        $("#MediaServer").find("[name='vodfilepath']").val(server.vodFilepath);
        $("#MediaServer").find("[name='tmpfilepath']").val(server.tmpFilepath);
    }).fail(function(){
        console.log("connect "+this.url+" failed!");
    });
    
    $("#saveServer").on("click",function(){
    	server.serverHost = $("#MediaServer").find("[name='serverhost']").val();
        server.serverPort = $("#MediaServer").find("[name='serverport']").val();
        server.liveApp = $("#MediaServer").find("[name='liveapp']").val();
        server.vodApp = $("#MediaServer").find("[name='vodapp']").val();
        server.vodFilepath = $("#MediaServer").find("[name='vodfilepath']").val();
        server.tmpFilepath = $("#MediaServer").find("[name='tmpfilepath']").val();
        $.ajax({
            "url": sdkPath+"/server",
            "type": "POST",
            "data": JSON.stringify(server),
            "dataType":"json",      
            "contentType":"application/json",    
        }).success(function(data){
            showMessageBox("保存成功",1500,0);
        }).fail(function(){
            console.log("connect "+this.url+" failed!");
        });
     });
    
    $("#resetServer").on("click",function(){
        $("#MediaServer").find("[name='serverhost']").val(server.serverHost);
        $("#MediaServer").find("[name='serverport']").val(server.serverPort);
        $("#MediaServer").find("[name='liveapp']").val(server.liveApp);
        $("#MediaServer").find("[name='vodapp']").val(server.vodApp);
        $("#MediaServer").find("[name='vodfilepath']").val(server.vodFilepath);
        $("#MediaServer").find("[name='tmpfilepath']").val(server.tmpFilepath);
    });
});
</script>
</body>
</html>