<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<#include "action-head.jsp">
<title></title>
</head>
<body>
<div class="content-wrapper" style="overflow-y:scroll;height:100%">

    <div class="col-md-6 col-lg-6">
        <div class="panel panel-default">
            <div class="panel-heading">
                <span>系统信息</span>
            </div>
            <div class="panel-body">
              <form  class="form-horizontal" id="SystemInfo" name="SystemInfo">
                  <div class="form-group">
                    <label for="systemtitle" class="col-sm-3 control-label">网站标题：</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="systemtitle" readonly>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="systemicp" class="col-sm-3 control-label">备案信息：</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="systemicp" readonly>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="systemcopyright" class="col-sm-3 control-label">版权声明：</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="systemcopyright" readonly>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="systemaddress" class="col-sm-3 control-label">公司地址：</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="systemaddress" readonly>
                    </div>
                  </div>
              </form>
            </div>
            <div class="panel-footer">
                <span><button id="editSystemInfo" class="btn btn-primary">编辑</button></span>
                <span><button id="saveSystemInfo" class="btn btn-primary" style="display:none">保存</button></span>
                <span><button id="resetSystemInfo" class="btn btn-default" style="display:none">重置</button></span>
           
            </div>
        </div>
    </div>

    <div class="col-md-6 col-lg-6">
        <div class="panel panel-default">
            <div class="panel-heading">
                <span>模块设置</span>
            </div>
            <div class="panel-body">
              <form  class="form-horizontal" id="ModularConfig" name="SystemInfo">
                  <div class="form-group">
                    <label for="webhosturl" class="col-sm-3 control-label">前台地址：</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="webhosturl" readonly>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="mobilehosturl" class="col-sm-3 control-label">移动端地址：</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="mobilehosturl" readonly>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="adminhosturl" class="col-sm-3 control-label">后台地址：</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="adminhosturl" readonly>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="sdkhosturl" class="col-sm-3 control-label">SDK地址：</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="sdkhosturl" readonly>
                    </div>
                  </div>
              </form>
            </div>
            <div class="panel-footer">
                <span><button id="editModularConfig" class="btn btn-primary">编辑</button></span>
                <span><button id="saveModularConfig" class="btn btn-primary" style="display:none">保存</button></span>
                <span><button id="resetModularConfig" class="btn btn-default" style="display:none">重置</button></span>
                <span class="label label-danger">警告：修改错误会导致平台运行出错，一般只需在平台部署时配置一次</span>
            </div>
        </div>
    </div>
    
    <div class="col-md-6 col-lg-6">
        <div class="panel panel-default">
            <div class="panel-heading">
                <span>图片服务器设置</span>
            </div>
            <div class="panel-body">
              <form  class="form-horizontal" id="ImageServer" name="ImageServer">
                  <div class="form-group">
                    <label for="imageuploadurl" class="col-sm-3 control-label">图片上传路径：</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="imageuploadurl" readonly>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="imageserverurl" class="col-sm-3 control-label">图片服务器路径：</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="imageserverurl" readonly>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="imagelocalpath" class="col-sm-3 control-label">图片存储目录：</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="imagelocalpath" readonly>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="imageformat" class="col-sm-3 control-label">支持的图片格式：</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="imageformat" readonly>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="imageuploadsize" class="col-sm-3 control-label">最大上传大小：</label>
                    <div class="col-sm-8">
                        <div class="input-group">
                        <input type="text" class="form-control" name="imageuploadsize" readonly>
                        <span class="input-group-addon">KB</span>
                        </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="imagedirectorytype" class="col-sm-3 control-label">目录策略：</label>
                    <div class="col-sm-8">
                        <select name="imagedirectorytype" class="form-control" disabled="disabled">
                            <option value="none">不分目录</option>
                            <option value="date">按日期保存图片</option>
                            <option value="hash">按文件HASH值保存图片</option>
                        </select>
                    </div>
                  </div>
              </form>
            </div>
            <div class="panel-footer">
                <span><button id="editImageServer" class="btn btn-primary">编辑</button></span>
                <span><button id="saveImageServer" class="btn btn-primary" style="display:none">保存</button></span>
                <span><button id="resetImageServer" class="btn btn-default" style="display:none">重置</button></span>
                <span class="label label-danger">警告：修改错误会导致平台运行出错，一般只需在平台部署时配置一次</span>
            </div>
        </div>
    </div>
    
    <div class="col-md-6 col-lg-6">
        <div class="panel panel-default">
            <div class="panel-heading">
                <span>系统设置</span>
            </div>
            <div class="panel-body">
              <form  class="form-horizontal" id="SystemSetting" name="SystemSetting">
                  <div class="form-group">
                    <label  class="col-sm-offset-1 col-sm-6">
                        <input type="checkbox" name="accessAuthc" disabled> 登陆用户才能访问平台
                    </label>
                  </div>
                  <div class="form-group">
                    <label  class="col-sm-offset-1 col-sm-5">
                        <input type="checkbox" name="enableRegister" disabled> 开启注册功能
                    </label>
                    <label  class="col-sm-offset-1 col-sm-5">
                        <input type="checkbox" name="verifyRegister" disabled> 注册用户需要审核
                    </label>
                  </div>
                  <div class="form-group">
                    <label  class="col-sm-offset-1 col-sm-5">
                        <input type="checkbox" name="enableComment" disabled> 开启评论功能
                    </label>
                    <label  class="col-sm-offset-1 col-sm-5">
                        <input type="checkbox" name="verifyConment" disabled> 评论需要审核才能显示
                    </label>
                  </div>
                  <div class="form-group">
                    <label  class="col-sm-offset-1 col-sm-5">
                        <input type="checkbox" name="verifyNewCourse" disabled> 专辑需要审核才能发布
                    </label>
                    <label  class="col-sm-offset-1 col-sm-5">
                        <input type="checkbox" name="verifyEditCourse" disabled> 专辑修改后需要重新审核
                    </label>
                  </div>
                  <div class="form-group">
                    <label  class="col-sm-offset-1 col-sm-5">
                        <input type="checkbox" name="verifyNewLive" disabled> 直播需要审核才能发布
                    </label>
                    <label  class="col-sm-offset-1 col-sm-5">
                        <input type="checkbox" name="verifyEditLive" disabled> 直播修改后需要重新审核
                    </label>
                  </div>
                  <div class="form-group">
                    <label  class="col-sm-offset-1 col-sm-5">
                        <input type="checkbox" name="verifyNewVideo" disabled> 视频需要审核才能发布
                    </label>
                    <label  class="col-sm-offset-1 col-sm-5">
                        <input type="checkbox" name="verifyEditVideo" disabled> 视频修改后需要重新审核
                    </label>
                  </div>
              </form>
            </div>
            <div class="panel-footer">
                <span><button id="editSystemSetting" class="btn btn-primary">编辑</button></span>
                <span><button id="saveSystemSetting" class="btn btn-primary" style="display:none">保存</button></span>
                <span><button id="resetSystemSetting" class="btn btn-default" style="display:none">重置</button></span>
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
var systeminfo;
var imageserver;
var modularconfig;
var systemsetting;

$(function(){
    
    ////////////////////////////////////////////////
    // 网站基本信息设置
    ////////////////////////////////////////////////
    
    $.ajax({
        "url": sdkPath+"/systeminfo",
        "type": "GET",
        "dataType":"json",      
        "contentType":"application/json",
    }).success(function(data){
    	systeminfo = data;
        $("#SystemInfo").find("[name='systemtitle']").val(systeminfo.title);
        $("#SystemInfo").find("[name='systemicp']").val(systeminfo.icp);
        $("#SystemInfo").find("[name='systemcopyright']").val(systeminfo.copyright);
        $("#SystemInfo").find("[name='systemaddress']").val(systeminfo.address);
    }).fail(function(){
        console.log("connect "+this.url+" failed!");
    });
    
    $("#editSystemInfo").on("click",function(){
        $("#SystemInfo input").attr("readonly", false);
        $("#editSystemInfo").hide();
        $("#saveSystemInfo").show();
        $("#resetSystemInfo").show();
    });
    
    $("#saveSystemInfo").on("click",function(){
    	systeminfo.title = $("#SystemInfo").find("[name='systemtitle']").val();
    	systeminfo.icp = $("#SystemInfo").find("[name='systemicp']").val();
    	systeminfo.copyright = $("#SystemInfo").find("[name='systemcopyright']").val();
    	systeminfo.address = $("#SystemInfo").find("[name='systemaddress']").val();
        $.ajax({
            "url": sdkPath+"/systeminfo",
            "type": "POST",
            "data": JSON.stringify(systeminfo),
            "dataType":"json",      
            "contentType":"application/json",    
        }).success(function(data){
        	showMessageBox("保存成功",1500,0);
            $("#SystemInfo input").attr("readonly", true);
            $("#editSystemInfo").show();
            $("#saveSystemInfo").hide();
            $("#resetSystemInfo").hide();
        }).fail(function(){
            console.log("connect "+this.url+" failed!");
        });
     });
    
    $("#resetSystemInfo").on("click",function(){
        $("#SystemInfo").find("[name='systemtitle']").val(systeminfo.title);
        $("#SystemInfo").find("[name='systemicp']").val(systeminfo.icp);
        $("#SystemInfo").find("[name='systemcopyright']").val(systeminfo.copyright);
        $("#SystemInfo").find("[name='systemaddress']").val(systeminfo.address);
    });
    
    
    ////////////////////////////////////////////////
    // 模块设置
    ////////////////////////////////////////////////

    $.ajax({
        "url": sdkPath+"/modularconfig",
        "type": "GET",
        "dataType":"json",      
        "contentType":"application/json",
    }).success(function(data){
        modularconfig = data;
        $("#ModularConfig").find("[name='webhosturl']").val(modularconfig.webHostUrl);
        $("#ModularConfig").find("[name='mobilehosturl']").val(modularconfig.mobileHostUrl);
        $("#ModularConfig").find("[name='adminhosturl']").val(modularconfig.adminHostUrl);
        $("#ModularConfig").find("[name='sdkhosturl']").val(modularconfig.sdkHostUrl);
    }).fail(function(){
        console.log("connect "+this.url+" failed!");
    });
    
    $("#editModularConfig").on("click",function(){
        $("#ModularConfig input").attr("readonly", false);
        $("#editModularConfig").hide();
        $("#saveModularConfig").show();
        $("#resetModularConfig").show();
    });
    
    $("#saveModularConfig").on("click",function(){
        modularconfig.webHostUrl = $("#ModularConfig").find("[name='webhosturl']").val();
        modularconfig.mobileHostUrl = $("#ModularConfig").find("[name='mobilehosturl']").val();
        modularconfig.adminHostUrl = $("#ModularConfig").find("[name='adminhosturl']").val();
        modularconfig.sdkHostUrl = $("#ModularConfig").find("[name='sdkhosturl']").val();
        $.ajax({
            "url": sdkPath+"/modularconfig",
            "type": "POST",
            "data": JSON.stringify(modularconfig),
            "dataType":"json",      
            "contentType":"application/json",    
        }).success(function(data){
            showMessageBox("保存成功",1500,0);
            $("#ModularConfig input").attr("readonly", true);
            $("#editModularConfig").show();
            $("#saveModularConfig").hide();
            $("#resetModularConfig").hide();
        }).fail(function(){
            console.log("connect "+this.url+" failed!");
        });
    });
    
    $("#resetModularConfig").on("click",function(){
        $("#ModularConfig").find("[name='webhosturl']").val(modularconfig.webHostUrl);
        $("#ModularConfig").find("[name='mobilehosturl']").val(modularconfig.mobileHostUrl);
        $("#ModularConfig").find("[name='adminhosturl']").val(modularconfig.adminHostUrl);
        $("#ModularConfig").find("[name='sdkhosturl']").val(modularconfig.sdkHostUrl);
    });
    
    
    ////////////////////////////////////////////////
    // 图片服务器设置
    ////////////////////////////////////////////////

    $.ajax({
        "url": sdkPath+"/imageserver",
        "type": "GET",
        "dataType":"json",      
        "contentType":"application/json",
    }).success(function(data){
        imageserver = data;
        $("#ImageServer").find("[name='imageuploadurl']").val(imageserver.imageUploadUrl);
        $("#ImageServer").find("[name='imageserverurl']").val(imageserver.imageServerUrl);
        $("#ImageServer").find("[name='imagelocalpath']").val(imageserver.imageLocalPath);
        $("#ImageServer").find("[name='imageformat']").val(imageserver.imageSupportFormat);
        $("#ImageServer").find("[name='imageuploadsize']").val(imageserver.imageUploadMaxsize);
        $("#ImageServer").find("[name='imagedirectorytype']").val(imageserver.imageDirectoryType);
    }).fail(function(){
        console.log("connect "+this.url+" failed!");
    });
    
    $("#editImageServer").on("click",function(){
        $("#ImageServer input").attr("readonly", false);
        $("#ImageServer select").attr("disabled", false);
        $("#editImageServer").hide();
        $("#saveImageServer").show();
        $("#resetImageServer").show();
    });
    
    $("#saveImageServer").on("click",function(){
        imageserver.imageUploadUrl = $("#ImageServer").find("[name='imageuploadurl']").val();
        imageserver.imageServerUrl = $("#ImageServer").find("[name='imageserverurl']").val();
        imageserver.imageLocalPath = $("#ImageServer").find("[name='imagelocalpath']").val();
        imageserver.imageSupportFormat = $("#ImageServer").find("[name='imageformat']").val();
        imageserver.imageUploadMaxsize = $("#ImageServer").find("[name='imageuploadsize']").val();
        imageserver.imageDirectoryType = $("#ImageServer").find("[name='imagedirectorytype']").val();
        $.ajax({
            "url": sdkPath+"/imageserver",
            "type": "POST",
            "data": JSON.stringify(imageserver),
            "dataType":"json",      
            "contentType":"application/json",    
        }).success(function(data){
            showMessageBox("保存成功",1500,0);
            $("#ImageServer input").attr("readonly", true);
            $("#ImageServer select").attr("disabled", true);
            $("#editImageServer").show();
            $("#saveImageServer").hide();
            $("#resetImageServer").hide();
        }).fail(function(){
            console.log("connect "+this.url+" failed!");
        });
    });
    
    $("#resetImageServer").on("click",function(){
        $("#ImageServer").find("[name='imageuploadurl']").val(imageserver.imageUploadUrl);
        $("#ImageServer").find("[name='imageserverurl']").val(imageserver.imageServerUrl);
        $("#ImageServer").find("[name='imagelocalpath']").val(imageserver.imageLocalPath);
        $("#ImageServer").find("[name='imageformat']").val(imageserver.imageSupportFormat);
        $("#ImageServer").find("[name='imageuploadsize']").val(imageserver.imageUploadMaxsize);
        $("#ImageServer").find("[name='imagedirectorytype']").val(imageserver.imageDirectoryType);
    });
    
    
    ////////////////////////////////////////////////
    // 系统设置
    ////////////////////////////////////////////////

    $.ajax({
        "url": sdkPath+"/systemsetting",
        "type": "GET",
        "dataType":"json",      
        "contentType":"application/json",
    }).success(function(data){
        systemsetting = data;
        $("#SystemSetting").find("[name='accessAuthc']").prop("checked",systemsetting.accessAuthc);
        $("#SystemSetting").find("[name='enableRegister']").prop("checked",systemsetting.enableRegister);
        $("#SystemSetting").find("[name='verifyRegister']").prop("checked",systemsetting.verifyRegister);
        $("#SystemSetting").find("[name='enableComment']").prop("checked",systemsetting.enableComment);
        $("#SystemSetting").find("[name='verifyConment']").prop("checked",systemsetting.verifyConment);
        $("#SystemSetting").find("[name='verifyNewCourse']").prop("checked",systemsetting.verifyNewCourse);
        $("#SystemSetting").find("[name='verifyEditCourse']").prop("checked",systemsetting.verifyEditCourse);
        $("#SystemSetting").find("[name='verifyNewLive']").prop("checked",systemsetting.verifyNewLive);
        $("#SystemSetting").find("[name='verifyEditLive']").prop("checked",systemsetting.verifyEditLive);
        $("#SystemSetting").find("[name='verifyNewVideo']").prop("checked",systemsetting.verifyNewVideo);
        $("#SystemSetting").find("[name='verifyEditVideo']").prop("checked",systemsetting.verifyEditVideo);
    }).fail(function(){
        console.log("connect "+this.url+" failed!");
    });
    
    $("#editSystemSetting").on("click",function(){
        $("#SystemSetting input").attr("disabled", false);
        $("#editSystemSetting").hide();
        $("#saveSystemSetting").show();
        $("#resetSystemSetting").show();
    });
    
    $("#saveSystemSetting").on("click",function(){
        systemsetting.accessAuthc      = $("#SystemSetting").find("[name='accessAuthc']").prop("checked");
        systemsetting.enableRegister   = $("#SystemSetting").find("[name='enableRegister']").prop("checked");
        systemsetting.verifyRegister   = $("#SystemSetting").find("[name='verifyRegister']").prop("checked");
        systemsetting.enableComment    = $("#SystemSetting").find("[name='enableComment']").prop("checked");
        systemsetting.verifyConment    = $("#SystemSetting").find("[name='verifyConment']").prop("checked");
        systemsetting.verifyNewCourse  = $("#SystemSetting").find("[name='verifyNewCourse']").prop("checked");
        systemsetting.verifyEditCourse = $("#SystemSetting").find("[name='verifyEditCourse']").prop("checked");
        systemsetting.verifyNewLive    = $("#SystemSetting").find("[name='verifyNewLive']").prop("checked");
        systemsetting.verifyEditLive   = $("#SystemSetting").find("[name='verifyEditLive']").prop("checked");
        systemsetting.verifyNewVideo   = $("#SystemSetting").find("[name='verifyNewVideo']").prop("checked");
        systemsetting.verifyEditVideo  = $("#SystemSetting").find("[name='verifyEditVideo']").prop("checked");
        $.ajax({
            "url": sdkPath+"/systemsetting",
            "type": "POST",
            "data": JSON.stringify(systemsetting),
            "dataType":"json",      
            "contentType":"application/json",    
        }).success(function(data){
            showMessageBox("保存成功",1500,0);
            $("#SystemSetting input").attr("disabled", true);
            $("#editSystemSetting").show();
            $("#saveSystemSetting").hide();
            $("#resetSystemSetting").hide();
        }).fail(function(){
            console.log("connect "+this.url+" failed!");
        });
    });
    
    $("#resetSystemSetting").on("click",function(){
        $("#SystemSetting").find("[name='accessAuthc']").prop("checked",systemsetting.accessAuthc);
        $("#SystemSetting").find("[name='enableRegister']").prop("checked",systemsetting.enableRegister);
        $("#SystemSetting").find("[name='verifyRegister']").prop("checked",systemsetting.verifyRegister);
        $("#SystemSetting").find("[name='enableComment']").prop("checked",systemsetting.enableComment);
        $("#SystemSetting").find("[name='verifyConment']").prop("checked",systemsetting.verifyConment);
        $("#SystemSetting").find("[name='verifyNewCourse']").prop("checked",systemsetting.verifyNewCourse);
        $("#SystemSetting").find("[name='verifyEditCourse']").prop("checked",systemsetting.verifyEditCourse);
        $("#SystemSetting").find("[name='verifyNewLive']").prop("checked",systemsetting.verifyNewLive);
        $("#SystemSetting").find("[name='verifyEditLive']").prop("checked",systemsetting.verifyEditLive);
        $("#SystemSetting").find("[name='verifyNewVideo']").prop("checked",systemsetting.verifyNewVideo);
        $("#SystemSetting").find("[name='verifyEditVideo']").prop("checked",systemsetting.verifyEditVideo);
    });
    
});
</script>
</body>
</html>