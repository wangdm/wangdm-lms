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
            <span><label><input type="radio" name="player" checked="checked" value="jwplayer">JWPlayer</label></span>
        </div>
        <div class="panel-body">
          <form  class="form-horizontal" id="JWPlayer" name="JWPlayer">
              <div class="form-group">
                <label for="playerUrl" class="col-sm-3 control-label">播放器库：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="playerUrl">
                </div>
              </div>
              <div class="form-group">
                <label for="playerKey" class="col-sm-3 control-label">播放器KEY：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="playerKey">
                </div>
              </div>
              <div class="form-group">
                <label for="playerConfig" class="col-sm-3 control-label">播放器配置：</label>
                <div class="col-sm-8">
                    <textarea class="form-control" rows="6" name="playerConfig"></textarea>
                </div>
              </div>
          </form>
        </div>
        <div class="panel-footer">
            <span><button id="saveJWPlayer" class="btn btn-primary">保存</button></span>
            <span><button id="resetJWPlayer" class="btn btn-default">重置</button></span>
        </div>
    </div>
</div>
<div class="col-md-12 col-lg-6">
    <div class="panel panel-default">
        <div class="panel-heading">
            <span><label><input type="radio" name="player" value="ckplayer">CKPlayer</label></span>
        </div>
        <div class="panel-body">
          <form  class="form-horizontal" id="addGradeForm" name="addGradeForm">
              <div class="form-group">
                <div class="col-sm-12">
                </div>
              </div>
          </form>
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
var jwplayer;
$(function(){
    $.ajax({
        "url": sdkPath+"/player",
        "type": "GET",
        "dataType":"json",      
        "contentType":"application/json",    
    }).success(function(data){
    	jwplayer = data;
    	$("#JWPlayer").find("[name='playerUrl']").val(data.url);
        $("#JWPlayer").find("[name='playerKey']").val(data.key);
        $("#JWPlayer").find("[name='playerConfig']").val(data.config);
    }).fail(function(){
        console.log("connect "+this.url+" failed!");
    });
    
    $("#saveJWPlayer").on("click",function(){
        var config = $("#JWPlayer").find("[name='playerConfig']").val();
        try{
        	JSON.parse(config);
        }catch(err){
        	alert("播放器配置语法错误");
        	return;
        }
        jwplayer.config = config;
    	jwplayer.url = $("#JWPlayer").find("[name='playerUrl']").val();
    	jwplayer.key = $("#JWPlayer").find("[name='playerKey']").val();
        $.ajax({
            "url": sdkPath+"/player",
            "type": "POST",
            "data": JSON.stringify(jwplayer),
            "dataType":"json",      
            "contentType":"application/json",    
        }).success(function(data){
            showMessageBox("保存成功",1500,0);
        }).fail(function(){
            console.log("connect "+this.url+" failed!");
        });
     });
    
    $("#resetJWPlayer").on("click",function(){
        $("#JWPlayer").find("[name='playerUrl']").val(jwplayer.url);
        $("#JWPlayer").find("[name='playerKey']").val(jwplayer.key);
        $("#JWPlayer").find("[name='playerConfig']").val(jwplayer.config);
    });
});
</script>
</body>
</html>