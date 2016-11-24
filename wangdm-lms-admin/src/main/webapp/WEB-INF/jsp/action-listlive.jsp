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

<div class="lefttree">
    <c:import url="categorytree.jsp"></c:import>
</div>

<div class="rightcontent">
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="operationbar">
                <div class="operationleft col-xs-12 col-md-6">
                    <div class="operation"><a href="#addLiveDialog" data-toggle="modal"><img src="${contextPath}/assets/images/add.png"/><span>&nbsp;添加直播</span></a></div>
                    <div class="operation"><a href="#DelLiveDialog" data-toggle="modal"><img src="${contextPath}/assets/images/delete.png"/><span>&nbsp;删除所选直播</span></a></div>
                </div>
                <div class="operationright col-xs-12 col-md-6">
                    <div class="operation"><a href="#ImportLiveDialog" data-toggle="modal"><img src="${contextPath}/assets/images/excel.png"/><span>&nbsp;导入直播</span></a></div>
                    <div class="operation"><a href="#ExportLiveDialog" data-toggle="modal"><img src="${contextPath}/assets/images/excel.png"/><span>&nbsp;导出直播</span></a></div>
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
                      <input type="text" name="queryOwner" class="form-control" placeholder="直播所有者">
                       <input type="text" name="queryOwnerId" hidden="hidden">
                      <span class="input-group-btn">
                        <button class="btn btn-default" type="button" data-toggle="modal" data-target="#QueryOwnerDialog"><span class="glyphicon glyphicon-search"></span></button>
                      </span>
                    </div>
                </div>
                <div class="col-xs-12 hidden-md hidden-lg" style="height:10px;">
                </div>
                <div class="col-xs-12 col-md-6" style="max-width:350px">
                    <div class="input-group" id = "livename">
                      <span class="input-group-addon"><strong>查询</strong></span>
                      <input type="text" name="queryString" class="form-control" placeholder="查询直播">
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
               <th><input type="checkbox" name="live"></th>
               <th>编号</th>
               <th>标题</th>
               <th>所有者</th>
               <th>直播时间</th>
               <th>状态</th>
               <th>操作</th>
             </tr>
        </thead>
        <tbody>
      <!--<c:forEach  items="${ liveList}"  var="live">
             <tr style="border:1px solid red">
                 <td><input type="checkbox" name="live" data-id="${live.id }"></td>
                 <td>${live.sn}</td>
                 <td>${live.title}</td>
                 <td>${live.userName}</td>
                  <td>333</td>
                 <td>${live.startTime }</td>
                 <td>${live.status}</td>
                 <td>${live.favtimes}</td>
                  <td><a href="#editLiveDialog" data-toggle="modal">编辑</a></td>
           </tr>
          </c:forEach>
          -->
        </tbody>
    </table>
    <div id="NoDataWarning" class="alert alert-warning" role="alert" style="padding:5px 15px;text-align:center;display:none">
      <span>未查询到数据</span>
    </div>
      <ul  class="pagination"  id="pagination" > </ul> 
</div>

<!-- 添加直播对话框 -->
<div class="modal fade" id="addLiveDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog"  style="min-width:640px;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加直播</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="AddLiveForm" name="AddLiveForm">
              
                <div class="form-group" >
                
                   <div class="col-md-2 text-right"  style="line-height:36px">
                              编号：
                      </div>
                      <div class="col-md-4">
                           <input type="text" class="form-control" name="sn">
                      </div>
                      
                    <div class="col-md-2 text-right"  style="line-height:36px">
                        标题：
                      </div>
                      <div class="col-md-4">
                              <input type="text" class="form-control " name="title">
                      </div>
                      
                </div>
                
                
                     <div class="form-group" >
                        <div class="col-md-2 text-right"  style="line-height:36px">分类：</div>
                        <div class="col-sm-10">
                                  <select class="form-control" name="categoryId"   id="category"  style="border:1px solid #ccc;">
                                         <c:forEach  items="${categoryList}" var="category" >
                                              <option value="${category.catId}">${category.catName }</option>
                                         </c:forEach>
                                    </select>
                        </div>
                    </div>
                    
                 <div   id="attr-list">
                        
                 </div>
                  
                   <div class="form-group" >
                    <div class="col-md-2 text-right"  style="line-height:36px">
                      开始时间：
                      </div>
                      <div class="col-md-4">
                          <input type="text" class="Wdate form-control"   style="height:34px;border:1px solid #ccc;" name="startTime" placeholder="开始时间"   onClick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'2016-11-01 11:30'})">
                      </div>
                         <div class="col-md-2 text-right"  style="line-height:36px">
                       结束时间：
                      </div>
                      <div class="col-md-4">
                              <input type="text" name="endTime" class="Wdate form-control"   style="height:34px;border:1px solid #ccc;"  placeholder="结束时间"  onClick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'2016-11-10 11:30'})">
                      </div>
                </div>
                
                  <div class="form-group">
                    <div class="col-md-2 text-right"  style="line-height:36px">封面图片：</div>
                    <div class="col-md-4">
                        <div id="imagefile" class="imagefile" style="width:100%;border:none;height:100px;line-height:100px;font-size:15px;position:relative;text-align:center">
                            <i class="iconfont"  style="font-size:60px;top:-5%;left:32%;display:block;position:absolute;">&#xe632;</i>
                            <img  style="width:100%;height:100%;border:0;top:0px;left:0px;position:absolute;" />
                            <input type="file" class="form-control" name="imagefile" accept="image/jpeg,image/png"  style="width:100%;height:100%;border:0;top:0px;left:0px;position:absolute;opacity:0"/>
                        </div>
                    </div>
                    
                      <!--  直播室
                      <div class="col-md-2 text-right"  style="line-height:36px">直播室：</div>
                        <div class="col-sm-4">
                            <div class="input-group">
                            <input type="text" class="form-control" name="room" placeholder="选择直播室" readonly>
                            <span class="input-group-btn">
                              <button class="btn btn-default" type="button" data-toggle="modal" data-target="#ChooseRoomDialog"><span class="glyphicon glyphicon-search"></span></button>
                            </span>
                          </div>
                        </div>
                        -->
                  </div>
                  
              
              
               <div class="form-group" >
                    <div class="col-md-2 text-right"  style="line-height:36px">
                       简介：
                      </div>
                      <div class="col-md-10">
                           <textarea class="form-control" name="description" rows="4"></textarea>
                      </div>
                </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="AddLiveBtn">添加</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 删除直播对话框 -->
<div class="modal fade" id="DelLiveDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">删除直播</h4>
      </div>
      <div class="modal-body">
        <span>确认删除直播</span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="DelLiveBtn">删除</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

 <!-- 编辑直播对话框 -->
<div class="modal fade" id="editLiveDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog" style="min-width:640px;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">编辑直播</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="editLiveForm" name="EditLiveForm">
          
            <div class="form-group" >
            
                      <div class="col-md-2 text-right"  style="line-height:36px">
                           编号：
                      </div>
                      <div class="col-md-4">
                           <input type="text" class="form-control" name="livesn">
                      </div>
                      
                      <div class="col-md-2 text-right"  style="line-height:36px">
                            标题：
                      </div>
                      <div class="col-md-4">
                              <input type="text" class="form-control " name="livetitle">
                      </div>
                       
                </div>
              
                   <div class="form-group">
                        <div class="col-md-2 text-right"  style="line-height:36px">分类：</div>
                        <div class="col-sm-10">
                               <select class="form-control" name="categoryId"   id="livecategory"  style="border:1px solid #ccc;">
                                         <c:forEach  items="${categoryList}" var="category" >
                                              <option value="${category.catId}">${category.catName }</option>
                                         </c:forEach>
                                    </select>
                        </div>
                    </div>
                  
                    <div   id="attr-list-update">
                        
                     </div>
              
                <div class="form-group" >
                    <div class="col-md-2 text-right"  style="line-height:36px">
                      开始时间：
                      </div>
                      <div class="col-md-4">
                           <input type="text" class="Wdate form-control"   style="height:34px;border:1px solid #ccc;" name="livestarttime" placeholder="开始时间"   onClick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'2016-11-01 11:30'})">
                      </div>
                         <div class="col-md-2 text-right"  style="line-height:36px">
                       结束时间：
                      </div>
                      <div class="col-md-4">
                          <input type="text" class="Wdate form-control"   style="height:34px;border:1px solid #ccc;" name="liveendtime" placeholder="开始时间"   onClick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'2016-11-10 11:30'})">
                      </div>
                </div>
                
                <div class="form-group">
                    <div class="col-md-2 text-right"  style="line-height:36px">封面图片：</div>
                    <div class="col-md-4">
                        <div id="imagefileUpdate" class="imagefile" style="width:100%;border:0;height:100px;line-height:100px;font-size:16px;position:relative;text-align:center">
                           上传图片
                            <img  style="width:100%;height:100%;border:0;top:0px;left:0px;position:absolute;"  data-url=""/>
                            <input type="file" class="form-control" name="imagefile" accept="image/jpeg,image/png"  style="width:100%;height:100%;border:0;top:0px;left:0px;position:absolute;opacity:0"/>
                        </div>
                    </div>
                    
                    <!--  直播室
                      <div class="col-md-2 text-right"  style="line-height:36px">直播室：</div>
                        <div class="col-sm-4">
                            <div class="input-group">
                            <input type="text" class="form-control" name="liveroom" placeholder="选择直播室" readonly>
                            <span class="input-group-btn">
                              <button class="btn btn-default" type="button" data-toggle="modal" data-target="#ChooseRoomDialog"><span class="glyphicon glyphicon-search"></span></button>
                            </span>
                          </div>
                    </div>
                    -->
                 </div>
                  
               
                 <div class="form-group" >
                    <div class="col-md-2 text-right"  style="line-height:36px">
                       简介：
                      </div>
                      <div class="col-md-10">
                           <textarea class="form-control" name="livedesc" rows="4"></textarea>
                      </div>
                </div>
                
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="EditLiveBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 选择录播室对话框 -->
<div class="modal" id="ChooseRoomDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">选择录播室</h4>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="ChooseRoomBtn">确定</button>
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

<!-- 直播地址对话框 -->
<div class="modal" id="ShowLiveAddrDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">修改分类</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="ShowLiveAddrForm" name="ShowLiveAddrForm">
              <div class="form-group">
                <label for="pushurl" class="col-sm-3 control-label">推流地址：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="pushurl" readonly>
                </div>
              </div>
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

<!-- 导入直播对话框 -->
<div class="modal fade" id="ImportLiveDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">导入直播</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal">
              <div class="form-group">
                <label for="exampleInputFile" class="col-sm-3 control-label">选择直播文件：</label>
                <div class="col-sm-8">
                    <input type="file" class="form-control" id="exampleInputFile">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="ImportLiveBtn">导入</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 导出直播对话框 -->
<div class="modal fade" id="ExportLiveDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
       <h4 class="modal-title">导出直播</h4>
      </div>
      <div class="modal-body">
			<h5>选择导出项 (默认全选)</h5>
			<input type="checkbox" value="1" name = "sn" checked="checked">编号
			<input type="checkbox" value="2" name = "title" checked="checked">标题
			<input type="checkbox" value="3" name = "description" checked="checked">描述
			<input type="checkbox" value="12" name = "room" checked="checked">录播室
			<br/>
			<input type="checkbox" value="7" name = "status" checked="checked">状态
			<input type="checkbox" value="10" name = "subject" checked="checked">学科
			<input type="checkbox" value="11" name = "grade" checked="checked">年级
			<input type="checkbox" value="8" name = "user" checked="checked">所属用户
			<input type="checkbox" value="9" name = "category" checked="checked">所属分类
			<br/>
			<input type="checkbox" value="4" name = "createTime" checked="checked">创建时间
			<input type="checkbox" value="5" name = "startTime" checked="checked">开始时间
			<input type="checkbox" value="6" name = "endTime" checked="checked">结束时间
      </div>
      
      <div class="modal-footer">
        <form action="" method="post" style="width: 100%">
        	<input class="btn btn-sm btn-primary" type="submit" name = "" value="导出" onclick="exportLiveExcel()">
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

<script type="text/javascript">
    var liveList = new Array();
    var curLive;
    var curPage = 0;
    var chooseRoom = -1;
    var editCat = {"id":0, "name":"在线学习平台"};
    var queryCat = -1;
    var queryOwner = -1;
    var queryOwnerList;
    var queryRoomList;
    var queryString = "";
    var currentPage=1;
    var queryCategoryId=null;
    
    //下拉框分类初始化
    var videoimg=null;
    var attrIds=[];
    var liveId;
    var initcategoryId=$("#category").find("option:selected").val();
    $("#category").find("option:selected").val();
    findAllTypeList(initcategoryId,"1");
    
    
    $("#category").change(function(){
        var initcategoryId=$("#category").find("option:selected").val(); 
        findAllTypeList(initcategoryId,"1");
    });
    
    
    $("#livecategory").change(function(){
        var categoryId=$("#livecategory").find("option:selected").val();
        for(var i=0;i<attrIds.length;i++){
            $("#y"+attrIds[i]).attr("selected","");
        }
        findAllTypeList(categoryId,"2");
    });

        //上传图片操作开始(添加)
    $("#addLiveDialog  input[name='imagefile']").fileupload({
            url: imageUploadUrl,
            dataType: 'json',
            autoUpload: true,
            acceptFileTypes: /(\.|\/)(jpg|png)$/i
      }).on('fileuploaddone', function (e, data) {
            console.log(data.result);
            $("#imagefile").find("img").attr("src",data.result.url);
            $("#imagefile").find("img").attr("data-url",data.result.filepath);
     }).prop('disabled', !$.support.fileInput)
            .parent().addClass($.support.fileInput ? undefined : 'disabled');
     
        //上传图片操作开始(更新)
     $("#editLiveForm  input[name='imagefile']").fileupload({
            url: imageUploadUrl,
            dataType: 'json',
            autoUpload: true,
            acceptFileTypes: /(\.|\/)(jpg|png)$/i
       }).on('fileuploaddone', function (e, data) {
           $("#imagefileUpdate").find("img").attr("src",data.result.url);
           $("#imagefileUpdate").find("img").attr("data-url",data.result.filepath);
       }).prop('disabled', !$.support.fileInput)
            .parent().addClass($.support.fileInput ? undefined : 'disabled');
    
      //获取所有直播
      function  queryAjax(){
           $.ajax({
             "url": sdkPath+"/lives",
             "type": "post",
             "data":{
                 "currentPage":currentPage,
                 "categoryId":queryCategoryId
               },
              "datatype":"json",
           }).success(function(data){
                      liveList = data.livelist;
                      createLiveTable(liveList);
                      currentPage = data.currentPage;
                      $("#pagination").html(data.pagelist);
            }).fail(function(data){
                    if (data.status == 200) {
                        $("#NoDataWarning").show();
                        if (data.responseText != ""){
                              console.log(data.responseText);
                        }
                      }
                      else{
                          console.log(data);
                          console.log("connect " + this.url + " failed!");
                      }
                      $("tbody tr").remove();
                 });
         }
      
      
       //为实现方法复用，index的值1为添加，2为更新   2016-11-01
      function findAllTypeList(categoryId,index){
          $.ajax({
             "url": sdkPath+"/category/findAttrById",
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
              
                if(index=="1"){
                    for(var i=0;i<categorys.length;i++){
                        categoryitems+="<div class=\"form-group\">"
                                      +"<div class=\"col-md-2 text-right\"  style=\"line-height:36px\">"
                                      +""+categorys[i].attriName+" :  "
                                      +"</div>"
                                      +"<div class=\"col-md-10\">"
                                      +" <select  class=\"form-control query\"  data-id=\""+categorys[i].attriId+"\"  id=\"c"+categorys[i].attriId+"\" name=\"queryArray["+i+"]\"></select>"
                                      +"</div>"
                                      +"</div>";
                                                  
                   }
                    $("#attr-list").html("").append(categoryitems);
                    for(var i=0;i<categorys.length;i++){
                         for(var j=0;j<items.length;j++){
                            if(items[j].attributenameId==categorys[i].attriId){
                                $("#c"+categorys[i].attriId+"").append("<option  id=\"v"+items[j].id+"\" value=\""+items[j].id+"\">"+items[j].value+"</option>");
                            }
                        }
                    } 
                }
                if(index=="2"){
                    for(var i=0;i<categorys.length;i++){
                        categoryitems+="<div class=\"form-group\">"
                                         +"<div class=\"col-md-2 text-right\"  style=\"line-height:36px\">"
                                         +""+categorys[i].attriName+" :  "
                                         +"</div>"
                                         +"<div class=\"col-md-10\">"
                                         +"<select  class=\"form-control querys\" id=\"s"+categorys[i].attriId+"\" name=\"queryArray["+i+"]\"  queryId=\""+categorys[i].attriId+"\"></select>"
                                         +"</div>"
                                         +"</div>";
                        }
                    
                    $("#attr-list-update").html("").append(categoryitems);
                    for(var i=0;i<categorys.length;i++){
                         for(var j=0;j<items.length;j++){
                            if(items[j].attributenameId==categorys[i].attriId){
                                $("#s"+categorys[i].attriId+"").append("<option  id=\"y"+items[j].id+"\" value=\""+items[j].id+"\">"+items[j].value+"</option>");
                            }
                        }
                    }
                    
                    $.ajax({
                        "url":sdkPath+ "/live/getAttribute?id="+liveId,
                        "type": "get",
                         datatype:"json",
                         success:function(data){
                            var listAttributes=data.listAttributes;
                            for(var i=0;i<listAttributes.length;i++){
                                $("#y"+listAttributes[i].attributevalueId).attr("selected",true);
                                attrIds.push(listAttributes[i].attributevalueId);
                            }
                         }
                    });
                }
            }).fail(function(){
                
        });
     }
    
    $(function(){
    	
        queryAjax();//首次进入页面加载直播列表数据
        /**************** 分类管理 *****************/
        $(".lefttree ").on("click",".node",function(){
            var currentIndex=$(this).index();
            if(currentIndex!=1){
            	   queryCategoryId = $(this).attr("data-id");
            }else{
            	queryCategoryId=null;
            }
        	currentPage=1;
        	queryAjax();
        });

  
  
     /**************** 全选 *****************/
     $("thead input[name='live']").on("click",function(){
        if($(this).is(':checked')){
            $("tbody input[type='checkbox']").prop("checked",true);
        }else{
            $("tbody input[type='checkbox']").prop("checked",false);
        }
     });

   
    /**************** 添加直播对话框 *****************/
    $('#addLiveDialog').on('show.bs.modal', function (event) {
   
    });
    
    //################## 按钮点击事件  ################
    /**************** 添加直播按钮 *****************/
    $("#AddLiveBtn").on("click",function(){
         var live = new Object();
         live.sn= $("#AddLiveForm").find("[name='sn']").val();
         live.title= $("#AddLiveForm").find("[name='title']").val();
         live.startTime= $("#AddLiveForm").find("[name='startTime']").val();
         live.endTime= $("#AddLiveForm").find("[name='endTime']").val();
         live.image = $("#imagefile").find("img").attr("data-url");
         live.categoryId= $("#AddLiveForm").find("[name='categoryId']").val();
         live.description= $("#AddLiveForm").find("[name='description']").val();
         live.publiced="1";
         live.fowarded="1";
         live.commented="1";
         live.userId="1";
         //var roomId=chooseRoom;  学校版备用//
         if($("input[name = 'publiced']").prop("checked"))
         {live.publiced = "0"}
         if($("input[name = 'fowarded']").prop("checked"))
         {live.fowarded = "0"}
         if($("input[name = 'commented']").prop("checked"))
         {live.commented = "0"}
        
         var querydata="";
         //querydata+="sn="+sn+"&title="+title+"&startTime="+startTime+"&endTime="+endTime+"&image="+image+"&categoryId="+categoryId+"&description="+description+"&publiced="+publiced+"&fowarded="+fowarded+"&commented="+commented;
         live.queryArray=new Array();
         live.queryName=new Array();
         var querylist=$(".query");
        //条件动态拼接
         for(var i=0;i<querylist.length;i++){
            live.queryName.push($(querylist[i]).attr("data-id"));
            live.queryArray.push($(querylist[i]).find("option:selected").val());
            //querydata+="&queryArray["+i+"]="+queryArray[i]+"&queryName["+i+"]="+queryName[i];
         }
         console.log(live);
         $.ajax({
            "url": sdkPath+"/live",
            "type": "post",
            "data": JSON.stringify(live),
            "datatype":"json",  
            "contentType" : "application/json",
          }).success(function(data){
            if(data.result){
                layer.msg("添加成功");
                window.location.href=contextPath+"/listlive";
            }
            else{
                $("#worngMsgUpdate").text(data.wrongmsg);
            }
          }).fail(function(){
            console.log("connect "+this.url+" failed!");
         })
    });


    /**************** 编辑直播对话框 *****************/
    $('#editLiveDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curLive = liveList[index];
        liveId=liveList[index].id;
        var categoryId=liveList[index].categoryId;
        findAllTypeList(categoryId,"2");
        $("#livecategory").val(categoryId);
    
        $("#imagefileUpdate").find("img").attr("src",liveList[index].imageurl);
        $("#imagefileUpdate").find("img").attr("data-url",liveList[index].image);
        $(this).find("[name='livesn']").val(liveList[index].sn);
        $(this).find("[name='livetitle']").val(liveList[index].title);
        $(this).find("[name='liveimg']").val(liveList[index].image);
        $(this).find("[name='livedesc']").val(liveList[index].description);
        $(this).find("[name='livestarttime']").val((liveList[index].startTime).substr(0,19));
        $(this).find("[name='liveendtime']").val((liveList[index].endTime).substr(0,19));
        $(this).find('#EditLiveBtn').data("id",liveList[index].id);
     
    });
    
    
    //################## 按钮点击事件  ################
    /**************** 更改直播按钮 *****************/
    $("#EditLiveBtn").on("click",function(){
        var live = new Object();
        live.id=liveId;
        live.sn= $("#editLiveForm").find("[name='livesn']").val();
        live.title= $("#editLiveForm").find("[name='livetitle']").val();
        live.startTime= $("#editLiveForm").find("[name='livestarttime']").val();
        live.endTime= $("#editLiveForm").find("[name='liveendtime']").val();
        live.categoryId= $("#editLiveForm").find("[name='categoryId']").val();
        live.description= $("#editLiveForm").find("[name='livedesc']").val();
        live.image=$("#imagefileUpdate").find("img").attr("data-url");
        live.publiced="1";
        live.fowarded="1";
        live.commented="1";
        if($("input[name = 'publiced']").prop("checked"))
        {live.publiced = "0"}
        if($("input[name = 'fowarded']").prop("checked"))
        {live.fowarded = "0"}
        if($("input[name = 'commented']").prop("checked"))
        {live.commented = "0"}
        
        var querydata="";
        //querydata+="id="+id+"&sn="+sn+"&title="+title+"&startTime="+startTime+"&endTime="+endTime+"&image="+image+"&categoryId="+categoryId+"&description="+description+"&publiced="+publiced+"&fowarded="+fowarded+"&commented="+commented;
        live.queryArray=new Array();
        live.queryName=new Array();
        var querylist=$(".querys");
        //条件动态拼接
        for(var i=0;i<querylist.length;i++){
            live.queryName.push(($(querylist[i]).attr("queryId")));
            live.queryArray.push($(querylist[i]).find("option:selected").val());
            //querydata+="&queryArray["+i+"]="+queryArray[i]+"&queryName["+i+"]="+queryName[i];
        }
        $.ajax({
            "url": sdkPath+"/live/"+live.id,
            "type": "put",
            "data": JSON.stringify(live),
            "datatype":"json",  
             "contentType" : "application/json",
        }).success(function(data){
            if(data.result){
                layer.msg("更新成功");
                window.location.href=contextPath+"/listlive";
            }
            else{
                $("#worngMsgUpdate").text(data.wrongmsg);
            }
        }).fail(function(){
            console.log("connect "+this.url+" failed!");
        }) 
    });
    
    
    /**************** 删除确认对话框 *****************/
    $('#DelLiveDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        if(index!=null){
            $(this).find('.modal-body').text("是否删除直播  \""+liveList[index].title+"\"?");
            $(this).find('#DelLiveBtn').data("id",liveList[index].id);
            $('#DelLiveBtn').prop("disabled",false);
        }else{
            if($("table input[type='checkbox']:checked").size()>0){
                $(this).find('.modal-body').text("是否删除所选直播 ?");
                $(this).find('#DelLiveBtn').data("id",-1);
                $('#DelLiveBtn').prop("disabled",false);
            }else{
                $(this).find('.modal-body').text("没有直播被选中");
                $('#DelLiveBtn').prop("disabled",true);
            }
        }
    });

   
    /**************** 修改分类对话框 *****************/
    $('#EditCategoryDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curLive = liveList[index];
        $("#EditCategoryForm .form-group").remove();
        if(curLive.category && curLive.category.id>0){
            var path = new Array();
            var i=0;
            var curTree = categoryTree.children;
            traverseTree(categoryTree.children,path,curLive.category.id);
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
        $(this).find('#EditCategoryBtn').data("id",curLive.vid);
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
    	querystr = $("input[name='queryOwner']").val();
    	queryUser(querystr,function(data){
    		queryOwnerList = data;
    		var node = $('#QueryOwnerDialog').find('.modal-body');
    		liststr = "<form class=\"form-horizontal\" role=\"form\" name=\"roleform\">";
    		liststr += "<table class=\"table table-bordered table-hover table-striped table-condensed\">";
    		liststr += "<thead>";
    		liststr += "    <tr>";
    		liststr += "       <th>#</th>";
    		liststr += "       <th>用户名</th>";
    		liststr += "       <th>邮箱</th>";
    		liststr += "       <th>电话</th>";
    		liststr += "     </tr>";
    		liststr += "</thead>";
    		liststr += "<tbody>";
            for(var i=0; i<data.length; i++){
                liststr += "<tr>";
                liststr += "<td><input type=\"radio\" name=\"user\" data-id=\""+data[i].uid+"\"  data-index=\""+i+"\" /></td>";
                liststr += "<td>"+data[i].username+"</td>";
                liststr += "<td>"+data[i].email+"</td>";
                liststr += "<td>"+data[i].phone+"</td>";
                liststr += "</tr>";
            }
            liststr += "</tbody>";
            liststr += "</table>";
            liststr += "</form>";
            node.html(liststr);
    	});
    });
    
    
    $("#pagination").on("click","li",function(){
        currentPage=$(this).attr("page-num");
        queryAjax();
     });
     
    
    
     /**************** 播放地址对话框 *****************/
     $('#ShowLiveAddrDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var id= $(tr).attr('data-id');
      //获取直播推流地址
            $.ajax({
                "url": sdkPath+"/live/"+id+"/pushurl",
                "type": "GET",
            }).success(function(data){
                $("#ShowLiveAddrForm").find("input[name='pushurl']").val(data.livePath);
                $("#ShowLiveAddrForm").find("input[name='rtmpurl']").val(data.rtmpUrl);
                $("#ShowLiveAddrForm").find("input[name='hlsurl']").val(data.hlsUrl);
            }).fail(function(){
                layer.msg("获取推流地址失败");
            })
      });
    
    

    /**************** 重新分类按钮 *****************/
    $("#EditCategoryBtn").on("click",function(){
        var live = {id:0};
        live.id = curLive.id;
        live.category = {"id":0};
        live.category.id = editCat.id;
        editLiveCategory(live);
    });

    /**************** 删除直播按钮 *****************/
    $("#DelLiveBtn").on("click",function(){
        liveId = $(this).data("id");
        if(liveId>0){
            delLive(liveId);
            $("tbody tr[data-id='"+liveId+"']").remove();
        }else{
            $("tbody input[type='checkbox']:checked").each(function(){
                var tr = $(this).parentsUntil("tbody").filter("tr");
                var index = $(tr).data('index');
                delLive(liveList[index].id);
                $(tr).remove();
            });
        }
    });

    /**************** 发布按钮 *****************/
    $("table").on("click","ul li a#PublishBtn",function(){
        var live ={id:0,liveStatus:""};
        live.id = $(this).attr("data-id");
        live.liveStatus = "Living";
        editLiveStatus(live);
    });

    /**************** 审核按钮 *****************/
    $("table").on("click","ul li a#VerifyBtn",function(){
        var live = {id:0,status:""};
        live.id = $(this).attr("data-id");
        live.status = "NORMAL";
        editLiveStatus(live);
    });

    /**************** 取消审核按钮 *****************/
    $("table").on("click","ul li a#UnVerifyBtn",function(){
        var live = {id:0,status:""};
        live.id = $(this).attr("data-id");
        live.status= "UNAURHORIZED";
        editLiveStatus(live);
    });
    
    /**************** 彻底删除按钮 *****************/
    $("table").on("click","ul li a#RemoveBtn",function(){
        var live = {id:0,status:""};
        live.id = $(this).attr("data-id");
        removeLive(live.id);
    });
    
    /**************** 恢复按钮 *****************/
    $("table").on("click","ul li a#RecoverBtn",function(){
    	 var live = {id:0,liveStatus:"",status:""};
        live.id = $(this).attr("data-id");
        live.status= "NORMAL";
        live.liveStatus="Upcoming";
        editLiveStatus(live);
    });

    

    /**************** 开始直播按钮 *****************/
    $("table").on("click","ul li a#StartBtn",function(){
        var live = {id:0,liveStatus:""};
        live.id = $(this).attr("data-id");
        live.liveStatus= "Living";
        editLiveStatus(live);
    });
    
    /**************** 重新开始直播 *****************/
    $("table").on("click","ul li a#RestartBtn",function(){
        var live = {id:0,liveStatus:"",status:""};
        live.id = $(this).attr("data-id");
        live.liveStatus= "Living";
        live.status= "UNAURHORIZED";
        editLiveStatus(live);
    });

    /**************** 暂停直播按钮 *****************/
    $("table").on("click","ul li a#PauseBtn",function(){
        var live = {id:0,liveStatus:""};
        live.id = $(this).attr("data-id");
        live.liveStatus= "Pause";
        editLiveStatus(live);
    });

    /**************** 停止直播按钮 *****************/
    $("table").on("click","ul li a#StopBtn",function(){
        var live = {id:0,liveStatus:""};
        live.id = $(this).attr("data-id");
        live.liveStatus= "Stop";
        editLiveStatus(live);
    });

    /**************** 结束直播按钮 *****************/
    $("table").on("click","ul li a#EndBtn",function(){
        var live = {id:0,liveStatus:""};
        live.id = $(this).attr("data-id");
        live.status = "End";
        editLiveStatus(live);
    });
    
    $("#QueryOwnerBtn").on("click",function(){
        $("#QueryOwnerDialog").modal("hide");
        var index = $("#QueryOwnerDialog input[type='radio']:checked").data("index");
        var queryOwner = queryOwnerList[index].uid;
        $("input[name='queryOwner']").val(queryOwnerList[index].username);
        $("input[name='queryOwnerId']").val(queryOwnerList[index].uid);
        getAllLive(queryCat,queryOwner,"",0);
    });
    
    $("#QueryStringBtn").on("click",function(){
        queryString = $("input[name='queryString']").val();
        getAllLive(queryCat,queryOwner,queryString,0);
    });
    
});


   //判断选中的要到处的项
  function exportLiveExcel(){
	    	var url = "member/live/exportLiveExcel?param=";
	    	var a = "";
	    	if($("#ExportLiveDialog .modal-body input[name = 'sn']").prop("checked")){
	    		a += "1";
	    	}
	    	if($("#ExportLiveDialog .modal-body input[name = 'title']").prop("checked")){
	    		if(a!=""){a+=","}
	    		a += "2";
	    	}
	    	if($("#ExportLiveDialog .modal-body input[name = 'description']").prop("checked")){
	    		if(a!=""){a+=","}
	    		a += "3";
	    	}
	    	if($("#ExportLiveDialog .modal-body input[name = 'createTime']").prop("checked")){
	    		if(a!=""){a+=","}
	    		a += "4";
	    	}
	    	if($("#ExportLiveDialog .modal-body input[name = 'startTime']").prop("checked")){
	    		if(a!=""){a+=","}
	    		a += "5";
	    	}
	    	if($("#ExportLiveDialog .modal-body input[name = 'endTime']").prop("checked")){
	    		if(a!=""){a+=","}
	    		a += "6";
	    	}
	    	if($("#ExportLiveDialog .modal-body input[name = 'status']").prop("checked")){
	    		if(a!=""){a+=","}
	    		a += "7";
	    	}
	    	if($("#ExportLiveDialog .modal-body input[name = 'user']").prop("checked")){
	    		if(a!=""){a+=","}
	    		a += "8";
	    	}
	    	if($("#ExportLiveDialog .modal-body input[name = 'category']").prop("checked")){
	    		if(a!=""){a+=","}
	    		a += "9";
	    	}
	    	if($("#ExportLiveDialog .modal-body input[name = 'subject']").prop("checked")){
	    		if(a!=""){a+=","}
	    		a += "10";
	    	}
	    	if($("#ExportLiveDialog .modal-body input[name = 'grade']").prop("checked")){
	    		if(a!=""){a+=","}
	    		a += "11";
	    	}
	    	if($("#ExportLiveDialog .modal-body input[name = 'room']").prop("checked")){
	    		if(a!=""){a+=","}
	    		a += "12";
	    	}
	    	
	    	var userid = "";
	    	var param1 = "";
	    	param1 = $("#livename input").val();
	    	userid = $("input[name = 'queryOwnerId']").val();
	    	
	    	
	    	url = url +a;
	    	url += "&userid=" + userid + "&param1=" + param1;
	    	$("#ExportLiveDialog .modal-footer form").attr("action",url);
	    	
	    	layer.msg("导出成功");
}
</script>
<script type="text/javascript">
   
         function editLiveStatus(live)
         {
             $.ajax({
                 "url" : sdkPath + "/lives/status/" + live.id,
                 "type" : "PUT",
                 "data" : JSON.stringify(live),
                 "dataType" : "json",
                 "contentType" : "application/json",
             }).success(function(data)
             {
            	 queryAjax();
             }).fail(function(data)
             {
                 console.log("connect " + this.url + " failed!");
             });
         }

         function delLive(liveId)
         {
             $.ajax({
                 "url" : sdkPath + "/live/" + liveId,
                 "type" : "DELETE",
                 "dataType" : "json", 
                 "contentType" : "application/json",
             }).success(function(data)
             {
                 $("#DelLiveDialog").modal("hide");
                 queryAjax();
             }).fail(function()
             {
                 console.log("connect " + this.url + " failed!");
             });
         }

         function removeLive(id)
         {
             $.ajax({
                 "url" :sdkPath + "/lives/status/"+id,
                 "type" : "DELETE",
                 "dataType" : "json", 
                 "contentType" : "application/json",
             }).success(function(data)
             {
            	 queryAjax();
             }).fail(function()
             {
                 console.log("connect " + this.url + " failed!");
             });
         }


</script>
</body>
</html>