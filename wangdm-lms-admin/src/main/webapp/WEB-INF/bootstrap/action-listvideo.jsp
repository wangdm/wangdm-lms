
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<#include "action-head.jsp">
<title></title>
<link rel="stylesheet" href="${contextPath}/assets/plugins/fileupload/css/jquery.fileupload.css">
</head>
<body>
<!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->

<div class="lefttree">
    <c:import url="categorytree.jsp"></c:import>
</div>

<div class="rightcontent">

    <div class="panel panel-default">
        <div class="panel-body">
            <div class="operationbar">
                <div class="operationleft col-xs-12 col-md-6">
                    <div class="operation"><a href="#AddVideoDialog" data-toggle="modal"><img src="${contextPath}/assets/images/add.png"/><span>&nbsp;上传视频</span></a></div>
                    <div class="operation"><a href="#DelVideoDialog" data-toggle="modal"><img src="${contextPath}/assets/images/delete.png"/><span>&nbsp;删除所选视频</span></a></div>
                </div>
                <div class="operationright col-xs-12 col-md-6">
                    <div class="operation"><a href="#ImportVideoDialog" data-toggle="modal"><img src="${contextPath}/assets/images/excel.png"/><span>&nbsp;导入视频</span></a></div>
                    <div class="operation"><a href="#ExportVideoDialog" data-toggle="modal"><img src="${contextPath}/assets/images/excel.png"/><span>&nbsp;导出视频</span></a></div>
                </div>
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="operationbar">
                <div class="col-xs-12 col-md-6" style="max-width:350px">
                    <div class="input-group">
                      <span class="input-group-addon"><strong>所有者</strong></span>
                      <input type="text" name="queryOwner" class="form-control" placeholder="视频所有者">
                      <input type="text" name="queryOwnerId" hidden="hidden">
                      <span class="input-group-btn">
                        <button class="btn btn-default" type="button" data-toggle="modal" data-target="#QueryOwnerDialog"><span class="glyphicon glyphicon-search"></span></button>
                      </span>
                    </div>
                </div>
                <div class="col-xs-12 hidden-md hidden-lg" style="height:10px;">
                </div>
                <div class="col-xs-12 col-md-6" style="max-width:350px">
                    <div class="input-group" id="videoname">
                      <span class="input-group-addon"><strong>查询</strong></span>
                      <input type="text" name="queryString" class="form-control" placeholder="查询视频">
                      <span class="input-group-btn">
                        <button class="btn btn-default" type="button" data-toggle="modal" id="QueryStringBtn"><span class="glyphicon glyphicon-search"></span></button>
                      </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <table class="table table-bordered table-hover table-striped table-condensed">
        <thead>
             <tr>
               <th><input type="checkbox" name="video"></th>
               <th>标题</th>
               <th>所有者</th>
               <th>分类</th>
               <th>播放次数</th>
               <th>点赞次数</th>
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

<!-- 添加视频对话框 -->
<div class="modal fade" id="AddVideoDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加视频</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="AddVideoForm" name="AddVideoForm">
              <div class="form-group">
                <label for="videotitle" class="col-sm-3 control-label">标题：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="videotitle">
                </div>
              </div>
              <div class="form-group">
                <label for="videoimg" class="col-sm-3 control-label">封面图片：</label>
                <div class="col-sm-8">
                    <div id="imagefile" class="imagefile" style="width:100%">
                        <img style="width:100%;display:none;position:absolute;top:0px;left:0px"/>
                        <input type="file" class="form-control" name="videoimg" accept="image/jpeg,image/png">
                    </div>
                </div>
              </div>
              
             <div class="form-group">
				<label  class="col-sm-3 control-label">课程分类：</label>
					<div class="col-sm-8">
						<select name="categoryId" id="category" class="form-control"
								style="border: 1px solid #ccc;">
							<c:forEach items="${categoryList}" var="category">
								<option value="${category.catId}">${category.catName }</option>
							</c:forEach>
						</select>
					</div>
			</div>          

			<div id="attr-list">
				<c:forEach items="${attrNameValueList }" var="attrNameValue">
					<div class="form-group">
						<label for="subject" class="btn-left col-sm-3 control-label" >${attrNameValue.key.attriName }：</label>
							<div class="col-sm-8">
								<select class="form-control" style="border: 1px solid #ccc;">
									<c:forEach items="${attrNameValue.value}" var="valueItem">
										<option data-id="${valueItem.id}" value="${valueItem.id}">${valueItem.value}</option>
									</c:forEach>
								</select>
							</div>
					</div>
				</c:forEach>
			</div>
   
              <div class="form-group">
                <label for="videofile" class="col-sm-3 control-label">文件：</label>
                <div class="col-sm-8">
                    <div id="progress" class="progress fileinput-button">
                        <span>选择视频文件</span>
                        <div class="progress-bar progress-bar-success"></div>
                        <input type="file" name="videofile" class="form-control" accept="video/mp4">
                    </div>
                    <div id="videofile" class="videofile" style="width:100%"></div>
                </div>
              </div>
              
              <div class="form-group">
                <label for="videodesc" class="col-sm-3 control-label">简介：</label>
                <div class="col-sm-8">
                    <textarea class="form-control" name="videodesc" rows="4"></textarea>
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="AddVideoBtn">上传</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 删除视频对话框 -->
<div class="modal fade" id="DelVideoDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">删除视频</h4>
      </div>
      <div class="modal-body">
        <span>确认删除视频</span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="DelVideoBtn">删除</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- 编辑视频对话框 -->
<div class="modal fade" id="EditVideoDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">编辑视频</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="EditVideoForm" name="EditVideoForm">
              <div class="form-group">
                <label for="videotitle" class="col-sm-3 control-label">标题：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="videotitle">
                </div>
              </div>
              <div class="form-group">
                <label for="imagefile" class="col-sm-3 control-label">封面图片：</label>
                <div class="col-sm-8">
                    <div class="imagefileupload"  style=" width: 100%; border: 0; height: 200px; position: relative; ">
                        <img src="" data-img="" style="width: 100%; height: 200px; border: 0; top: 0px; left: 0px; position: absolute;"/>
                        <input type="file" class="form-control" name="imagefile" accept="image/jpeg,image/png"  style="width: 100%; height: 100%; border: 0; top: 0px; left: 0px; position: absolute; opacity:0 ">
                    </div>
                </div>
              </div>
              
			<div class="form-group">
				<label  class="col-sm-3 control-label">课程分类：</label>
					<div class="col-sm-8">
						<select name="categoryId" id="category-edit" class="form-control"
								style="border: 1px solid #ccc;">
							<c:forEach items="${categoryList}" var="category">
								<option data-id="${category.catId}" value="${category.catId}">${category.catName }</option>
							</c:forEach>
						</select>
					</div>
			</div>          

			<div id="attr-list">
				<c:forEach items="${attrNameValueList }" var="attrNameValue">
					<div class="form-group">
						<label for="subject" class="btn-left col-sm-3 control-label" >${attrNameValue.key.attriName }：</label>
							<div class="col-sm-8">
								<select name="attr-edit" class="form-control" style="border: 1px solid #ccc;">
								</select>
							</div>
					</div>
				</c:forEach>
			</div>
			
              <div class="form-group">
                <label for="videodesc" class="col-sm-3 control-label">简介：</label>
                <div class="col-sm-8">
                    <textarea class="form-control" name="videodesc" rows="4"></textarea>
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="EditVideoBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 审核视频对话框 -->
<div class="modal fade" id="VerifyVideoDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">审核视频</h4>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="VerifyVideoBtn">发布</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 修改分类对话框 -->
<div class="modal" id="EditCategoryDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">修改分类</h4>
      </div>
      <div class="modal-body">
          <form  class="form-inline" id="EditCategoryForm" name="EditCategoryForm">
            <label for="category" class="control-label">选择分类：</label>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="EditCategoryBtn">重新分类</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 播放地址对话框 -->
<div class="modal" id="ShowVideoAddrDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">修改分类</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="ShowVideoAddrForm" name="ShowVideoAddrForm">
              <div class="form-group">
                <label for="rtmpurl" class="col-sm-3 control-label">RTMP观看地址：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="rtmpurl" readonly>
                </div>
              </div>
              <div class="form-group">
                <label for="hlsurl" class="col-sm-3 control-label">HLS观看地址：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="hlsurl" readonly>
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 导入视频对话框 -->
<div class="modal fade" id="ImportVideoDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">导入视频</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal">
              <div class="form-group">
                <label for="exampleInputFile" class="col-sm-3 control-label">选择视频文件：</label>
                <div class="col-sm-8">
                    <input type="file" class="form-control" id="exampleInputFile">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="ImportVideoBtn">导入</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 导出视频对话框 -->
<div class="modal fade" id="ExportVideoDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">导出视频</h4>
      </div>
      <div class="modal-body">
			<h5>选择导出项 (默认全选)</h5>
			<input type="checkbox" value="1" name = "title" checked="checked">标题
			<input type="checkbox" value="2" name = "description" checked="checked">简介
			<input type="checkbox" value="3" name = "user" checked="checked">所属用户
			<input type="checkbox" value="4" name = "category" checked="checked">分类
			<input type="checkbox" value="5" name = "course" checked="checked">所属课程
			<input type="checkbox" value="6" name = "subject" checked="checked">学科
			<input type="checkbox" value="7" name = "grade" checked="checked">年级
			<input type="checkbox" value="8" name = "createTime" checked="checked">创建时间
			<input type="checkbox" value="9" name = "status" checked="checked">状态
      </div>
      
      <div class="modal-footer">
        <form action="" method="post" style="width: 100%">
        	<input class="btn btn-sm btn-primary" type="submit" name = "" value="导出" onclick="exportVideoExcel()">
        </form>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 选择所有者对话框 -->
<div class="modal fade" id="QueryOwnerDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">选择所有者</h4>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="QueryOwnerBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
var videoList = new Array();
var curVideo;
var curPage = 0;
var editCat = {"id":0, "name":"在线学习平台"};
var queryCat = {"id":0, "name":"在线学习平台"};
var queryOwner = -1;
var queryOwnerList;
var queryString = "";
var attrValueIdList=[];
$(function(){

    'use strict';
    var jqXHR;
    var videoimg;
    
    getAllVideo(queryCat.id,queryOwner,queryString,0);

    
    /*选择分类时，属性级联变化
	 */
	$("#category").change(function(){
		var categoryId=$("#category").find("option:selected").val(); 
		//alert("change"+categoryId);
		findAttrList(categoryId);
 	});
	$("#category-edit").change(function(){
		var categoryId=$("#category-edit").find("option:selected").val(); 
		//alert("change-edit"+categoryId);
		findAttrListEdit(categoryId);
 	});
	
	
    /**************** 分类管理 *****************/
    $(".lefttree").on("click",".node",function(){
        queryCat.id = $(this).attr("data-id");
        getAllVideo(queryCat.id,queryOwner,"",0);
    });

    /**************** 全选 *****************/
    $("thead input[name='video']").on("click",function(){
        if($(this).is(':checked')){
            $("tbody input[type='checkbox']").prop("checked",true);
        }else{
            $("tbody input[type='checkbox']").prop("checked",false);
        }
    });

    //################## 模态框初始化  ################
    /**************** 播放地址对话框 *****************/
    $('#ShowVideoAddrDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        $(this).find("[name='rtmpurl']").val(videoList[index].rtmpUrl);
        $(this).find("[name='hlsurl']").val(videoList[index].hlsUrl);
    });
    
    /**************** 添加视频对话框 *****************/
    $('#AddVideoDialog').on('show.bs.modal', function (event) {
        $("#progress").children("span").text('选择视频文件');
        $('#progress .progress-bar').css('width', '0%');
        $("#AddVideoBtn").prop('disabled', true);
        var tfile = $("#AddVideoDialog input[name='videofile']");
        tfile.after(tfile.clone().val(""));
        tfile.remove();
        $('#videofile').children().remove();
        $('#imagefile').children("img").css("display","none");
        $('#imagefile').attr("style","");
        $('#imagefile input').css("height","100%");
        $('#imagefile input').css("opacity","100");
        jqXHR = null;

        //alert("contextPath::"+contextPath);
        //图片上传
        $("#AddVideoDialog input[name='videoimg']").fileupload({
            url: imageUploadUrl,
            dataType: 'json',
            autoUpload: true,
            acceptFileTypes: /(\.|\/)(jpg|png)$/i
        }).on('fileuploaddone', function (e, data) {
            videoimg = data.result.filename;
        }).prop('disabled', !$.support.fileInput)
            .parent().addClass($.support.fileInput ? undefined : 'disabled');
        //视频文件上传
        $("#AddVideoDialog input[name='videofile']").fileupload({
            url: imageUploadUrl,
            dataType: 'json',
            autoUpload: false,
            acceptFileTypes: /(\.|\/)(mp4|flv)$/i,
            disableImageResize: /Android(?!.*Chrome)|Opera/
                .test(window.navigator.userAgent),
            previewMaxWidth: "100%",
            previewCrop: true
        }).on('fileuploadadd', function (e, data) {
        	$('#videofile').children().remove();
            data.context = $('<div/>').appendTo('#videofile');
            $('<p/>').appendTo(data.context);
            $('<span class="btn btn-default" id="screenshot"/>').text("截图为封面").appendTo(data.context);
            
            jqXHR = data;
            $("#progress").children("span").text(data.files[0].name);
            var title = $("#AddVideoDialog").find("[name='videotitle']").val();
            if(title.length<=0){
                $("#AddVideoDialog").find("[name='videotitle']").val(data.files[0].name);
            }
            $("#AddVideoBtn").prop('disabled', false);
        }).on('fileuploadprocessalways', function (e, data) {
            var index = data.index, 
                file = data.files[index],
                node = $(data.context.children()[index]);
            if (file.preview) {
                node.prepend('<br>').prepend(file.preview);
            }
            data.context.find('video').attr("id","video")
            data.context.find('#screenshot').on("click", function(){
            	videoimg = null;
                var canvas = document.createElement("canvas");
                var video = $("#video").get(0);
                if(video.videoWidth>480){
                    canvas.width = 480;
                    canvas.height = 480*video.videoHeight/video.videoWidth;
                }else{
                    canvas.width = video.videoWidth;
                    canvas.height = video.videoHeight;
                }
                canvas.getContext("2d").drawImage(video,0,0,canvas.width,canvas.height);
                var img = $("#imagefile").find("img");
                $(img).attr("src",canvas.toDataURL());
                var width = $("#imagefile").width();
                $(img).css("height",width*canvas.height/canvas.width);
                $(img).css("display","inline");
                $("#imagefile").css("height",width*canvas.height/canvas.width);
                $("#imagefile").css("position","relative");
                $('#imagefile input').css("position","relative");
                $('#imagefile input').css("opacity","0");
                //$(img).prependTo($("#imagefile"));
            });
//             if (index + 1 === data.files.length) {
//                 data.context.find('button').text('Upload').prop('disabled', !!data.files.error);
//             }
        }).on('fileuploadprogressall', function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $('#progress .progress-bar').css('width', progress + '%');
        }).on('fileuploaddone', function (e, data) {
            var video = {"id":0,"title":"","filename":"","description":"","categoryId":"","&attrValueIdList":""};
			video.title = $("#AddVideoDialog").find("[name='videotitle']").val();
            if(videoimg){
                video.image = videoimg;//$("#AddVideoDialog").find("[name='videoimg']").val();
            }else{
            	video.image = $("#imagefile").find("img").attr("src");
            }
            //alert(JSON.stringify(data));
            video.filename = data.result.filename;
            //alert("video.filename>>"+video.filename);
            video.categoryId = $("#AddVideoDialog").find("[name='categoryId']").val();
            var selectNum=$("#AddVideoDialog #attr-list select").length;
    		for(var i=0;i<selectNum;i++){
    			attrValueIdList[i]=$("#AddVideoDialog #attr-list select")[i].value;
    		}
    		// alert(attrValueIdList);
    		video.attrValueIdList = attrValueIdList;
            video.description = $("#AddVideoDialog").find("[name='videodesc']").val();
            //alert("video.>>"+JSON.stringify(video));
            addVideo(video);
        }).prop('disabled', !$.support.fileInput)
            .parent().addClass($.support.fileInput ? undefined : 'disabled');
    });

    
    $("#AddVideoDialog input[name='imagefile']").on("change",function(){
    	var file = this.files[0]
    	if(file.size>512*1024){
    		$(this).val("");
    		layer.msg("文件大小不能大于512kb");
    		return;
    	}
    	if(!(file.type=="image/jpeg" || file.type=="image/png")){
            $(this).val("");
            layer.msg("只支持 PNG 和 JPEG 格式的图片");
            return;
    	}
    	var reader = new FileReader();
    	reader.readAsDataURL(file);
    	reader.onload = function(e){
            var img = $("#imagefile").find("img");
            var width = $("#imagefile").width();
            $(img).css("display","inline");
            $(img).attr("src",reader.result);
            $(img).attr("title","点击更换图片");
            $("#imagefile").css("height",width*img.height()/img.width());
            $("#imagefile").css("position","relative");
            $('#imagefile input').css("position","relative");
            $('#imagefile input').css("opacity","0");
    	}
    });
    /**************** 编辑视频对话框 *****************/
    $('#EditVideoDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curVideo = videoList[index];
        $(this).find("[name='videotitle']").val(videoList[index].title);
        $(this).find("[name='videoimg']").val(videoList[index].image);
        $(this).find("[name='videodesc']").val(videoList[index].description);
        $(this).find('#EditVideoBtn').data("id",videoList[index].id);
        if(videoList[index].image && videoList[index].image.length>0){
            $(this).find(".imagefileupload img").attr("src", "${contextPath}/"+videoList[index].image).show();
            $(this).find(".imagefileupload img").attr("data-img",videoList[index].image);
            $(this).find(".imagefileupload span").hide();
            //$(this).find(".imagefileupload").css("height","auto");
        }else{
            $(this).find(".imagefileupload img").hide();
            $(this).find(".imagefileupload span").show();
        }
        //分类
        if(curVideo.categoryId){
            $(this).find("[name='categoryId'] option[data-id="+curVideo.categoryId+"]").attr("selected",true);
        }
        
        
        var jqEditXHR=null;
        var that = $(this);
      //图片上传
        $(this).find("input[name='imagefile']").fileupload({
            url: imageUploadUrl,
            dataType: 'json',
            autoUpload: true,
            acceptFileTypes: /(\.|\/)(jpg|png)$/i
        }).on('fileuploadadd', function (e, data) {
        	jqEditXHR = data;
            var file = jqEditXHR.files[0]
            if(file.size>512*1024){
                $(this).val("");
                alert("文件大小不能大于512kb");
                return;
            }
            if(!(file.type=="image/jpeg" || file.type=="image/png")){
                $(this).val("");
                alert("只支持 PNG 和 JPEG 格式的图片");
                return;
            }
            var reader = new FileReader();
            reader.readAsDataURL(file);
            reader.onload = function(e){
                var img = $(that).find(".imagefileupload").find("img");
                var width = $(that).find(".imagefileupload").width();
                $(img).show();
                $(img).attr("src",reader.result);
                $(that).find(".imagefileupload").find("span").hide();
                $(that).find(".imagefileupload").css("height",width*img.height()/img.width());
            }
        }).on('fileuploaddone', function (e, data) {
        	//alert(data.result.filename);
            $("#EditVideoDialog").find(".imagefileupload img").attr("data-img", data.result.filename);
        }).prop('disabled', !$.support.fileInput)
            .parent().addClass($.support.fileInput ? undefined : 'disabled');
        //初始化所有属性
        findAttrListEdit(curVideo.categoryId);
    });

    /**************** 删除确认对话框 *****************/
    $('#DelVideoDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        if(index!=null){
            $(this).find('.modal-body').text("是否删除视频  \""+videoList[index].title+"\"?");
            $(this).find('#DelVideoBtn').data("id",videoList[index].id);
            $('#DelVideoBtn').prop("disabled",false);
        }else{
            if($("table input[type='checkbox']:checked").size()>0){
                $(this).find('.modal-body').text("是否删除所选视频 ?");
                $(this).find('#DelVideoBtn').data("id",-1);
                $('#DelVideoBtn').prop("disabled",false);
            }else{
                $(this).find('.modal-body').text("没有视频被选中");
                $('#DelVideoBtn').prop("disabled",true);
            }
        }
    });

    /**************** 审核确认对话框 *****************/
    $('#VerifyVideoDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        if(index!=null){
            $(this).find('.modal-body').text("是否审核通过视频  \""+videoList[index].title+"\"?");
            $(this).find('#VerifyVideoBtn').data("id",videoList[index].id);
            $('#VerifyVideoBtn').prop("disabled",false);
        }else{
            if($("table input[type='checkbox']:checked").size()>0){
                $(this).find('.modal-body').text("是否审核通过所选视频 ?");
                $(this).find('#VerifyVideoBtn').data("id",-1);
                $('#VerifyVideoBtn').prop("disabled",false);
            }else{
                $(this).find('.modal-body').text("没有视频被选中");
                $('#VerifyVideoBtn').prop("disabled",true);
            }
        }
    });

    /**************** 修改分类对话框 *****************/
    $('#EditCategoryDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curVideo = videoList[index];
        $("#EditCategoryForm .form-group").remove();
        if(curVideo.category && curVideo.category.id>0){
	        var path = new Array();
	        var i=0;
	        var curTree = categoryTree.children;
	        traverseTree(categoryTree.children,path,curVideo.category.id);
	        $.each(path,function(){
	        	var j=0;
	            $.each(curTree,function(){
	            	var index=0;
	            	var selectNode = $("#EditCategoryForm .category:eq("+i+")");
	            	if(selectNode.size()<=0){
	            		$("#EditCategoryForm").append("<div class=\"form-group\"><select class=\"form-control category\" data-deep=\""+i+"\"><option>请选择</option></select></div>");
	            	}
	            	$("#EditCategoryForm .category:eq("+i+")").append("<option data-index=\""+j+"\" data-id=\""+this.id+"\">"+this.name+"</option>");
	            	j++;
	            });

                for(index=0; i<curTree.length; index++){
                    if(curTree[index].id==this.id){
                        break;
                    }
                }
	            
	            $("#EditCategoryForm .category:eq("+i+")").find("option[data-id="+this.id+"]").attr("selected",true);
	            curTree = curTree[index].children;
                i++;
	        });
        }else{
            var j=0;
        	$("#EditCategoryForm").append("<div class=\"form-group\"><select class=\"form-control category\" data-deep=\"0\"><option>请选择</option></select></div>");
            $.each(categoryTree.children,function(){
                $("#EditCategoryForm .category").append("<option data-index=\""+j+"\" data-id=\""+this.id+"\">"+this.name+"</option>");
                j++;
            });
        }
        $(this).find('#EditCategoryBtn').data("id",curVideo.vid);
    });

    /**************** 修改分类级联下拉框 *****************/
    $("#EditCategoryForm").on("change",".category",function(){
        $(this).parent().nextAll().remove();
        var deep = $(this).data("deep");
        var sel = $(this).find("option:selected").data("index");
        editCat.id = $(this).find("option:selected").data("id");
        var curTree = categoryTree;
        if(sel>=0){
            for(var i=0; i<deep+1; i++){
                sel = $("#EditCategoryForm .category:eq("+i+")").find("option:selected").data("index");
                curTree = curTree.children[sel];
            }
            if(curTree.children && curTree.children.length>0){
                $("#EditCategoryForm").append("<div class=\"form-group\"><select class=\"form-control category\" data-deep=\""+i+"\"><option>请选择</option></select></div>");
                var j=0;
                $.each(curTree.children,function(){
                    $("#EditCategoryForm .category:eq("+(deep+1)+")").append("<option data-index=\""+j+"\" data-id=\""+this.id+"\">"+this.name+"</option>");
                    j++;
                });
            }
        }
    });

    /**************** 选择所有者对话框 *****************/
    $('#QueryOwnerDialog').on('show.bs.modal', function (event) {
        var querystr = $("input[name='queryOwner']").val();
        queryUser(querystr,function(data){
            queryOwnerList = data.data;
            var node = $('#QueryOwnerDialog').find('.modal-body');
            var liststr = "<form class=\"form-horizontal\" role=\"form\" name=\"roleform\">";
            liststr += "<table class=\"table table-bordered table-hover table-striped table-condensed\">";
            liststr += "<thead>";
            liststr += "     <tr>";
            liststr += "       <th>#</th>";
            liststr += "       <th>用户名</th>";
            liststr += "       <th>邮箱</th>";
            liststr += "       <th>电话</th>";
            liststr += "     </tr>";
            liststr += "</thead>";
            liststr += "<tbody>";
            for(var i=0; i<queryOwnerList.length; i++){
                liststr += "<tr>";
                liststr += "<td><input type=\"radio\" name=\"user\" data-id=\""+queryOwnerList[i].id+"\"  data-index=\""+i+"\" /></td>";
                liststr += "<td>"+queryOwnerList[i].username+"</td>";
                liststr += "<td>"+queryOwnerList[i].email+"</td>";
                liststr += "<td>"+queryOwnerList[i].phone+"</td>";
                liststr += "</tr>";
            }
            liststr += "</tbody>";
            liststr += "</table>";
            liststr += "</form>";
            node.html(liststr);
        });
    });

    //################## 按钮点击事件  ################
    $("#AddVideoDialog input[name='videotitle']").on("keyup",function(){
        var title = $("#AddVideoDialog").find("[name='videotitle']").val();
        if(jqXHR && title.length>0){
            $("#AddVideoBtn").prop('disabled', false);
        }else{
            $("#AddVideoBtn").prop('disabled', true);
        }
    });
    
    /**************** 选择图片 *****************/
    $("#AddVideoDialog input[name='videoimg']").on("change",function(){
    	var file = this.files[0]
    	if(file.size>512*1024){
    		$(this).val("");
    		alert("文件大小不能大于512kb");
    		return;
    	}
    	if(!(file.type=="image/jpeg" || file.type=="image/png")){
            $(this).val("");
            alert("只支持 PNG 和 JPEG 格式的图片");
            return;
    	}
    	var reader = new FileReader();
    	reader.readAsDataURL(file);
    	reader.onload = function(e){
            var img = $("#imagefile").find("img");
            var width = $("#imagefile").width();
            $(img).css("display","inline");
            $(img).attr("src",reader.result);
	        $("#imagefile").css("height",width*img.height()/img.width());
	        $("#imagefile").css("position","relative");
	        $('#imagefile input').css("position","relative");
	        $('#imagefile input').css("opacity","0");
    	}
    });

    /**************** 添加视频按钮 *****************/
    $("#AddVideoBtn").on("click",function(){
    	if(jqXHR){
            $(this).prop('disabled', true);
            jqXHR.submit();
    	}
    });

    /**************** 编辑视频按钮 *****************/
    $("#EditVideoBtn").on("click",function(){
    	var attrValueIdList=[];
        curVideo.title = $("#EditVideoForm").find("[name='videotitle']").val();
        curVideo.image = $("#EditVideoForm").find("img").attr("data-img");
        curVideo.categoryId = $("#EditVideoForm").find("[name='categoryId']").val();
        var selectNum=$("#EditVideoForm #attr-list select").length;
		for(var i=0;i<selectNum;i++){
			attrValueIdList[i]=$("#EditVideoForm #attr-list select")[i].value;
		}
		curVideo.attrValueIdList = attrValueIdList;
        curVideo.description = $("#EditVideoForm").find("[name='videodesc']").val();
        console.log(JSON.stringify(curVideo));
        editVideo(curVideo);
    });

    /**************** 重新分类按钮 *****************/
    $("#EditCategoryBtn").on("click",function(){
        curVideo.category = {"id":0};
        curVideo.categoryId = editCat.id;
        editVideoCategory(curVideo);
    });

    /**************** 删除视频按钮 *****************/
    $("#DelVideoBtn").on("click",function(){
    	//alert("DDD"+$(this).data("id"));
       var videoId = $(this).data("id");
        if(videoId>0){
            delVideo(videoId);
            $("tbody tr[data-id='"+videoId+"']").remove();
        }else{
            $("tbody input[type='checkbox']:checked").each(function(){
                var tr = $(this).parentsUntil("tbody").filter("tr");
                var index = $(tr).data('index');
                delVideo(videoList[index].id);
                $(tr).remove();
            });
        }
    });

    /**************** 发布按钮 *****************/
    $("table").on("click","ul li a#PublishBtn",function(){
        var video = {id:0,videoStatus:""};
        video.id = $(this).attr("data-id");
        video.videoStatus = "Verified";
        editVideoStatus(video);
    });
    /**************** 审核按钮 *****************/
    $("table").on("click","ul li a#VerifyBtn",function(){
        var video = {id:0,videoStatus:""};
        video.id = $(this).attr("data-id");
        video.videoStatus = "Verified";
        editVideoStatus(video);
    });

    /**************** 审核Status按钮 *****************/
    $("table").on("click","ul li a#StatusVerifyBtn",function(){
        var video = {id:0,status:""};
        video.id = $(this).attr("data-id");
        video.status = "NORMAL";
        editVideoStatus(video);
    });

    /**************** 取消审核按钮 *****************/
    $("table").on("click","ul li a#UnVerifyBtn",function(){
        var video = {id:0,status:""};
        video.id = $(this).attr("data-id");
        video.status = "UNAURHORIZED";
        editVideoStatus(video);
    });

    $("#QueryOwnerBtn").on("click",function(){
        $("#QueryOwnerDialog").modal("hide");
        var index = $("#QueryOwnerDialog input[type='radio']:checked").data("index");
        if(typeof index=='undefined'){
        	queryOwner=-1;
        }else{
	        queryOwner = queryOwnerList[index].id;
	        $("input[name='queryOwner']").val(queryOwnerList[index].username);
	        $("input[name='queryOwnerId']").val(queryOwnerList[index].id);
        }
        getAllVideo(queryCat.id,queryOwner,"",0);
    });
    
    $("#QueryStringBtn").on("click",function(){
        queryString = $("input[name='queryString']").val();
        getAllVideo(queryCat.id,queryOwner,queryString,0);
    });
    
    $("#content-page .pagination").on("click","li",function(){
        var page = $(this).data("page");
        if(page!=undefined)
            getAllVideo(queryCat.id,queryOwner,queryString,page);
    });
    
});


//判断选中的要到处的项
  function exportVideoExcel(){
  	    	var url = "member/video/exportVideoExcel?param=";
  	    	var a = "";
  	    	if($("#ExportVideoDialog .modal-body input[name = 'title']").prop("checked")){
  	    		a += "1";
  	    	}
  	    	if($("#ExportVideoDialog .modal-body input[name = 'description']").prop("checked")){
  	    		if(a!=""){a+=","}
  	    		a += "2";
  	    	}
  	    	if($("#ExportVideoDialog .modal-body input[name = 'user']").prop("checked")){
  	    		if(a!=""){a+=","}
  	    		a += "3";
  	    	}
  	    	if($("#ExportVideoDialog .modal-body input[name = 'category']").prop("checked")){
  	    		if(a!=""){a+=","}
  	    		a += "4";
  	    	}
  	    	if($("#ExportVideoDialog .modal-body input[name = 'course']").prop("checked")){
  	    		if(a!=""){a+=","}
  	    		a += "5";
  	    	}
  	    	if($("#ExportVideoDialog .modal-body input[name = 'subject']").prop("checked")){
  	    		if(a!=""){a+=","}
  	    		a += "6";
  	    	}
  	    	if($("#ExportVideoDialog .modal-body input[name = 'grade']").prop("checked")){
  	    		if(a!=""){a+=","}
  	    		a += "7";
  	    	}
  	    	if($("#ExportVideoDialog .modal-body input[name = 'createTime']").prop("checked")){
  	    		if(a!=""){a+=","}
  	    		a += "8";
  	    	}
  	    	if($("#ExportVideoDialog .modal-body input[name = 'status']").prop("checked")){
  	    		if(a!=""){a+=","}
  	    		a += "9";
  	    	}
  	    	
  	    	var userid = "";
	    	var param1 = "";
	    	param1 = $("#videoname input").val();
	    	userid = $("input[name = 'queryOwnerId']").val();
	    	
	    	
  	    	url = url +a;
  	    	url += "&userid=" + userid + "&param1=" + param1;
  	    	$("#ExportVideoDialog .modal-footer form").attr("action",url);
  }
  
  
  function findAttrList(categoryId){
	    $.ajax({
	       "url": sdkPath + "/category/findAttrById",
	       "type": "post",
	       "data":{
	           "categoryId":categoryId,
	        },
	        datatype:"json",
	   }).success(function(data){
	   	allTypeList = data;
	   		var categorys=data.categorys;
		 		var items=data.itemlist;
		 		var categoryitems='';
		 		for(var i=0;i<categorys.length;i++){
		 		 	 categoryitems+="<div class=\"form-group\">"
		                +"<label class=\"btn-left col-sm-3 control-label\">"+categorys[i].attriName+" :</label>"
		                +" <div class=\"col-sm-8\">"
		                +" <select  class=\"form-control query\" id=\"c"+categorys[i].attriId+"\" data-id=\""+categorys[i].attriId+"\" name=\"queryArray["+i+"]\"></select>"
		 		    	+"</div>"
		 		    	+"<div class=\"col-md-3 col-sm-4 col-xs-6\">"
		 		    	+"</div>"
		 		    	+" </div>";
		 		   }
		 		$("#AddVideoDialog #attr-list").html("").append(categoryitems);
		 		for(var i=0;i<categorys.length;i++){
		 			 for(var j=0;j<items.length;j++){
			 			if(items[j].attributenameId==categorys[i].attriId){
			 				$("#c"+categorys[i].attriId+"").append("<option  id=\""+items[j].id+"\" value=\""+items[j].id+"\">"+items[j].value+"</option>");
			 			}
			 	    }
		 		}
	   	}).fail(function(){
	   });
	}
  
  
  function findAttrListEdit(categoryId){
	    $.ajax({
	       "url": sdkPath + "/category/findAttrById",
	       "type": "post",
	       "data":{
	           "categoryId":categoryId,
	        },
	        datatype:"json",
	   }).success(function(data){
	   	allTypeList = data;
	   		var categorys=data.categorys;
		 		var items=data.itemlist;
		 		var categoryitems='';
		 		for(var i=0;i<categorys.length;i++){
		 		 	 categoryitems+="<div class=\"form-group\">"
		                +"<label class=\"btn-left col-sm-3 control-label\">"+categorys[i].attriName+" :</label>"
		                +" <div class=\"col-sm-8\">"
		                +" <select  class=\"form-control query\" id=\"c"+categorys[i].attriId+"\" data-id=\""+categorys[i].attriId+"\" name=\"queryArray["+i+"]\"></select>"
		 		    	+"</div>"
		 		    	+"<div class=\"col-md-3 col-sm-4 col-xs-6\">"
		 		    	+"</div>"
		 		    	+" </div>";
		 		   }
		 		$("#EditVideoDialog #attr-list").html("").append(categoryitems);
			 	//alert(curVideo.attrValueIdList);
		 		for(var i=0;i<categorys.length;i++){
		 			 for(var j=0;j<items.length;j++){
			 			if(items[j].attributenameId==categorys[i].attriId){
			 				var option='';
			 				option +="<option  data-id=\""+items[j].id+"\" value=\""+items[j].id+" \" ";
			 				for(var k=0;k<curVideo.attrValueIdList.length;k++){
								if(curVideo.attrValueIdList[k]==items[j].id){
									option += "selected = \"selected\" ";
								} 
		 		        	}
			 				option +=" >"+items[j].value+"</option>";
			 				$("#c"+categorys[i].attriId+"").append(option);
			 			}
			 	    }
		 		} 
		 		
		 		
	   	}).fail(function(){
	   });
	}

  
  
</script>
</body>
</html>