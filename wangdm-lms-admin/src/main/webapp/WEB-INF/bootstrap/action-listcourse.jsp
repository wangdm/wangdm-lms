
<!DOCTYPE html>
<html class="iframe-html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<#include "action-head.jsp">
<title></title>
</head>
<link href="${contextPath}/assets/css/course.css" rel="stylesheet"
	type="text/css" />
<body>

<div class="lefttree">
    <#include "categorytree.jsp">
</div>

<div class="rightcontent">
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="operationbar">
                <div class="operationleft col-xs-12 col-md-6">
                    <div class="operation"><a href="#AddCourseDialog" data-toggle="modal"><img src="${contextPath}/assets/images/add.png"/><span>&nbsp;添加课程</span></a></div>
                    <div class="operation"><a href="#DelCourseDialog" data-toggle="modal"><img src="${contextPath}/assets/images/delete.png"/><span>&nbsp;删除所选课程</span></a></div>
                </div>
                <div class="operationright col-xs-12 col-md-6">
                    <div class="operation"><a href="#ImportCourseDialog" data-toggle="modal"><img src="${contextPath}/assets/images/excel.png"/><span>&nbsp;导入课程</span></a></div>
                    <div class="operation"><a href="#ExportCourseDialog" data-toggle="modal"><img src="${contextPath}/assets/images/excel.png"/><span>&nbsp;导出课程</span></a></div>
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
                      <input type="text" name="queryOwner" class="form-control" placeholder="课程所有者">
                      <input type="text" name="queryOwnerId" hidden="hidden">
                      <span class="input-group-btn">
                        <button class="btn btn-default" type="button" data-toggle="modal" data-target="#QueryOwnerDialog"><span class="glyphicon glyphicon-search"></span></button>
                      </span>
                    </div>
                </div>
                <div class="col-xs-12 hidden-md hidden-lg" style="height:10px;">
                </div>
                <div class="col-xs-12 col-md-6" style="max-width:350px">
                    <div class="input-group" id="coursename">
                      <span class="input-group-addon"><strong>查询</strong></span>
                      <input type="text" name="queryString" class="form-control" placeholder="查询课程">
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
               <th><input type="checkbox" name="course"></th>
               <th>课程编号</th>
               <th>课程</th>
               <th>所有者</th>
               <th>分类</th>
               <th>开课时间</th>
               <th>学习人数</th>
               <th>评分</th>
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

<!-- 添加课程对话框 -->
<div class="modal fade" id="AddCourseDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加课程</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="AddCourseForm" name="AddCourseForm">
              <div class="form-group">
                <label for="coursetitle" class="col-sm-3 control-label">课程名：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="coursetitle">
                </div>
              </div>
              <div class="form-group">
                <label for="coursesn" class="col-sm-3 control-label">课程编号：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="coursesn">
                </div>
              </div>
              <div class="form-group">
                <label for="coursetype" class="col-sm-3 control-label">课程类型：</label>
                <div class="col-sm-8">
                    <select class="form-control" name="coursetype">
                    <#if coursetypeList??>
                    <#list coursetypeList?keys as key >
                        <option data-id="${key}">${coursetypeList["${key}"]}</option>
                    </#list>
                    </#if>
                    </select>
                </div>
              </div>
              <div class="form-group">
                <label for="coursestarttime" class="col-sm-3 control-label">开课时间：</label>
	              <div class="col-sm-8">
			          <input type="text" class="Wdate form-control"   style="height:34px;border:1px solid #ccc;" name="coursestarttime" placeholder="开始时间" onblur='formcheck(this,"startTime", this.value)'   onClick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'2016-09-10 11:30'})" >
			      </div>
              </div>
              <div class="form-group">
                <label for="courseendtime" class="col-sm-3 control-label">结课时间：</label>
                <div class="col-sm-8">
                     <input type="text" class="Wdate form-control"   style="height:34px;border:1px solid #ccc;" name="courseendtime" placeholder="开始时间"    onClick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'2016-09-10 11:30'})">
                </div>
              </div>
              <div class="form-group">
                <label for="courselesson" class="col-sm-3 control-label">预计课时：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="courselesson">
                </div>
              </div>
              <div class="form-group">
                <label for="imagefile" class="col-sm-3 control-label">封面图片：</label>
                <div class="col-sm-8">
                    <div class="imagefileupload"  style=" width: 100%; border: 0; height: 200px; position: relative; ">
                        <img style="width: 100%; height: 200px; border: 0; top: 0px; left: 0px; position: absolute;"/>
                        <input type="file" class="form-control" name="imagefile" accept="image/jpeg,image/png" style="width: 100%; height: 100%; border: 0; top: 0px; left: 0px; position: absolute; opacity:0">
                    </div>
                </div>
              </div>
			  <div class="form-group">
				<label for="category" class="col-sm-3 control-label">课程分类：</label>
				<div class="col-sm-8">
                    <input type="text" class="form-control" name="category" readonly>
				</div>
			  </div> 
              <div class="form-group">
                <label for="coursedesc" class="col-sm-3 control-label">简介：</label>
                <div class="col-sm-8">
                    <textarea class="form-control" name="coursedesc" rows="4"></textarea>
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="AddCourseBtn">添加</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 删除课程对话框 -->
<div class="modal fade" id="DelCourseDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">删除课程</h4>
      </div>
      <div class="modal-body">
        <span>确认删除课程</span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="DelCourseBtn">删除</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- 编辑课程对话框 -->
<div class="modal fade" id="EditCourseDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">编辑课程</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="EditCourseForm" name="EditCourseForm">
              <div class="form-group">
                <label for="coursetitle" class="col-sm-3 control-label">课程名：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="coursetitle">
                </div>
              </div>
              <div class="form-group">
                <label for="coursesn" class="col-sm-3 control-label">课程编号：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="coursesn">
                </div>
              </div>
              <div class="form-group">
                <label for="coursetype" class="col-sm-3 control-label">课程类型：</label>
                <div class="col-sm-8">
                        <span id="type-edit"></span>
                </div>
              </div>
              <div class="form-group">
                <label for="coursestarttime" class="col-sm-3 control-label">开课时间：</label>
	              <div class="col-sm-8">
			          <input type="text" class="Wdate form-control"   style="height:34px;border:1px solid #ccc;" name="coursestarttime" placeholder="开始时间" onblur='formcheck(this,"startTime", this.value)'   onClick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'2016-09-10 11:30'})" >
			      </div>
              </div>
              <div class="form-group">
                <label for="courseendtime" class="col-sm-3 control-label">结课时间：</label>
                <div class="col-sm-8">
                     <input type="text" class="Wdate form-control"   style="height:34px;border:1px solid #ccc;" name="courseendtime" placeholder="开始时间"    onClick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'2016-09-10 11:30'})">
                </div>
              </div>
              <div class="form-group">
                <label for="courselesson" class="col-sm-3 control-label">预计课时：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="courselesson">
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
                    <input type="text" class="form-control" name="category" readonly>
				  </div>
			  </div>  
              <div class="form-group">
                <label for="coursedesc" class="col-sm-3 control-label">简介：</label>
                <div class="col-sm-8">
                    <textarea class="form-control" name="coursedesc" rows="4"></textarea>
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="EditCourseBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 修改课程详细信息对话框 -->
<div class="modal fade" id="EditCourseDetailDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">编辑课程详细信息</h4>
      </div>
      <div class="modal-body">
        <script type="text/plain" id="myEditor" style="height:350px;">
        </script>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="EditCourseDetailBtn">修改</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 修改课程章节对话框 -->
<div class="modal fade" id="EditCourseChapterDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">编辑课程章节信息</h4>
      </div>
      		<div id="updateCourse_three" style="display: none">
						<div class="form-group">
							<div class="course_update_chapter">
								<a href="javascript:void(0);" >添加新的一章</a>
							</div>
						</div>
						<div id="myCourseChapter" class="form-group">
							<div id="0">
								<h4 onmousemove="show_updatebtnshow(this)"
									onmouseout="show_updatebtnhide(this)">
									<span class="coursechapter_chapter">第一节</span>
									<div id="coursetitle_0">
										<span class="chapter_input"> <input type="text"
											name="Couesechapter_title" class="" value="">
										</span> <span class="confirm">
											<button class="btn btn-warning btn-sm" type="button"
												onclick="coursetitle_add_btn(this)">保存</button>
										</span>
									</div>
									<div id="coursetitle_none_0" style="display: none">
										<b></b>
										<button class="btn btn-warning btn-sm" type="button"
											onclick="coursetitle_update_btn(this)" style="display: none">修改</button>
										<button class="btn btn-warning btn-sm" type="button"
											onclick="coursetitle_delete_btn(this)" style="display: none">删除</button>
										<a onclick="showupload(this)"
											style="float: right; margin-right: 5px; font-size: 14px; font-weight: bold; color: #A3C2E0;">收起</a>
									</div>
								</h4>
								<div class="select_video" style="display: none">
									<div class="select_box">
										<input type="text" hidden="hidden" name="videoid"> <input
											type="text" hidden="hidden" name="title"> <a
											href="#updateCourseChapterDialog" data-toggle="modal"
											class="video" onclick="selectCourse(this)"></a>
									</div>
								</div>
								
							</div>
						</div>
						
					</div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="EditCourseChapterBtn">修改</button>
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

<!-- 导入课程对话框 -->
<div class="modal fade" id="ImportCourseDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">导入课程</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal">
              <div class="form-group">
                <label for="exampleInputFile" class="col-sm-3 control-label">选择课程文件：</label>
                <div class="col-sm-8">
                    <input type="file" class="form-control" id="exampleInputFile">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="ImportCourseBtn">导入</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 导出课程对话框 -->
<div class="modal fade" id="ExportCourseDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
         <h4 class="modal-title">导出课程</h4>
      </div>
      <div class="modal-body">
			<h5>选择导出项 (默认全选)</h5>
			<input type="checkbox" value="2" name = "status" checked="checked">状态
			<input type="checkbox" value="3" name = "title" checked="checked">标题
			<input type="checkbox" value="4" name = "description" checked="checked">描述
			<input type="checkbox" value="8" name = "subject" checked="checked">学科
			<input type="checkbox" value="9" name = "grade" checked="checked">年级
			<br/>
			<input type="checkbox" value="5" name = "detail" checked="checked">详细介绍
			<input type="checkbox" value="6" name = "user" checked="checked">所属用户
			<input type="checkbox" value="7" name = "textbook" checked="checked">关联课本
			<input type="checkbox" value="12" name = "totallesson" checked="checked">预计课时
			<input type="checkbox" value="13" name = "type" checked="checked">课程类型
			<input type="checkbox" value="1" name = "createTime" checked="checked">创建时间
			<br/>
			<input type="checkbox" value="10" name = "startTime" checked="checked">预计开课时间
			<input type="checkbox" value="11" name = "endTime" checked="checked">预计结课时间
      </div>
      
      <div class="modal-footer">
        <form action="" method="post" style="width: 100%">
        	<input class="btn btn-sm btn-primary" type="submit" name = "" value="导出" onclick="exportCourseExcelUp()">
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

	
	<div class="modal fade" id="updateCourseChapterDialog" tabindex="-1"
		role="dialog">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 700px">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<div id="title">
						<h4 class="modal-title"></h4>
					</div>
				</div>
				<div class="modal-body">
					<div class="alert alert-warning" role="alert"
							style="padding: 5px 15px; text-align: center;">
						<span>未查询到数据</span>
					</div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


<script>
var chapterid = "";
var chapter = 0;
var chaptername = new Array("一", "二", "三", "四", "五", "六", "七", "八", "九", "十",
		"十一", "十二", "十三", "十四", "十五", "十六", "十七", "十八", "十九", "二十", "二十一",
		"二十二", "二十三", "二十四", "二十五", "二十六", "二十七", "二十八", "二十九", "三十", "三十一",
		"三十二", "三十三", "三十四", "三十五", "三十六", "三十七", "三十八", "三十九", "四十");
var head='	<div class=\"form-group\"> <div class=\"course_update_chapter\"><a href=\"javascript:void(0);\" onclick="shoeAdd()">添加新的一章</a></div></div>';
var strId="-1";

var courseList = new Array();
var userList = new Array();
var query = new Object();
var curCourse;
var curPage = 0;
var editCat = {"id":0, "name":"在线学习平台"};
var queryCat = {"id":0, "name":"在线学习平台"};
var queryOwner = -1;
var queryOwnerList;
var queryString = "";
var videoList=[];
var liveList=[];
var courseChapters="";

$(function(){
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
	
    getAllCourse(query);

    /**************** 分类管理 *****************/
    $(".lefttree").on("click",".node",function(){
        query.categoryId = $(this).attr("data-id");
        getAllCourse(query);
    });

    /**************** 全选 *****************/
    $("thead input[name='course']").on("click",function(){
        if($(this).is(':checked')){
            $("tbody input[type='checkbox']").prop("checked",true);
        }else{
            $("tbody input[type='checkbox']").prop("checked",false);
        }
    });

    //################## 模态框初始化  ################
    /**************** 添加课程对话框 *****************/
    var jqAddXHR = null;
    $('#AddCourseDialog').on('show.bs.modal', function (event) {
        var time = new Date();
        var timestr = time.getFullYear()+"-"+(time.getMonth()+1)+"-"+time.getDate()+" "+time.getHours()+":"+time.getMinutes()+":"+time.getSeconds();
        $(this).find("[name='coursestarttime']").val(timestr);
        var timestr = "C"+time.getTime();
        $(this).find("[name='coursesn']").val(timestr);
        time.setMilliseconds(time.getMilliseconds()+30*24*60*60*1000);
        var timestr = time.getFullYear()+"-"+(time.getMonth()+1)+"-"+time.getDate()+" "+time.getHours()+":"+time.getMinutes()+":"+time.getSeconds();
        $(this).find("[name='courseendtime']").val(timestr);
        $(this).find("[name='courselesson']").val(30);

        var tfile = $("#AddVideoDialog input[name='videofile']");
        tfile.after(tfile.clone().val(""));
        tfile.remove();
        $("#AddCourseDialog .imagefileupload").find("img").hide();
        $("#AddCourseDialog .imagefileupload").find("span").show();
        $("#AddCourseDialog .imagefileupload").css("height","auto");
        $("#AddCourseBtn").prop('disabled', true);
        jqAddXHR = null;
        

        //图片上传
        
        $("#AddCourseDialog input[name='imagefile']").fileupload({
            url:imageUploadUrl,
            dataType: 'json',
            autoUpload: false,
            acceptFileTypes: /(\.|\/)(jpg|png)$/i
        }).on('fileuploadadd', function (e, data) {
            jqAddXHR = data;
            var file = jqAddXHR.files[0]
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
                var img = $("#AddCourseDialog .imagefileupload").find("img");
                var width = $("#AddCourseDialog .imagefileupload").width();
                $(img).show();
                $(img).attr("src",reader.result);
                $("#AddCourseDialog .imagefileupload").find("span").hide();
                $("#AddCourseDialog .imagefileupload").css("height",width*img.height()/img.width());
                
            }
            var title = $("#AddCourseDialog").find("[name='coursetitle']").val();
            if(title.length>0){
                $("#AddCourseBtn").prop('disabled', false);
            }
        	
        }).on('fileuploaddone', function (e, data) {
            var course = {"id":0,"title":"","sn":"","image":"","description":"","&categoryId":"","&attrValueIdList":""};
            var attrValueIdList=[];
            course.sn = $("#AddCourseDialog").find("[name='coursesn']").val();
            course.title = $("#AddCourseDialog").find("[name='coursetitle']").val();
            course.courseType = $("#AddCourseDialog").find("[name='coursetype'] option:selected").data("id");
            course.totallesson = $("#AddCourseDialog").find("[name='courselesson']").val();
            course.startTime = Date.parse($("#AddCourseDialog").find("[name='coursestarttime']").val());
            course.endTime = Date.parse($("#AddCourseDialog").find("[name='courseendtime']").val());
            //course.image = $("#AddCourseDialog").find("[name='imagefile']").val();
            course.image = data.result.filename;
            course.categoryId = $("#AddCourseDialog").find("[name='categoryId']").val();
            var selectNum=$("#AddCourseDialog #attr-list select").length;
    		for(var i=0;i<selectNum;i++){
    			attrValueIdList[i]=attrValueId=$("#AddCourseDialog #attr-list select")[i].value;
    		}
    		//alert(attrValueIdList);
    		course.attrValueIdList = attrValueIdList;
            course.description = $("#AddCourseDialog").find("[name='coursedesc']").val();
            addCourse(course);
        }).prop('disabled', !$.support.fileInput)
            .parent().addClass($.support.fileInput ? undefined : 'disabled');
        
    });
    
    
    

    /**************** 编辑课程对话框 *****************/
    var jqEditXHR = null;
    $('#EditCourseDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
      
        curCourse = courseList[index];
        $(this).find("[name='coursesn']").val(courseList[index].sn);
        $(this).find("[name='coursetitle']").val(courseList[index].title);
        $(this).find("[name='coursetype']").val(courseList[index].courseType);
        $(this).find("[name='courselesson']").val(courseList[index].totallesson);
        $(this).find("[name='coursestarttime']").val(courseList[index].startTime);
        $(this).find("[name='courseendtime']").val(courseList[index].endTime);
        if(courseList[index].courseType == "VIDEO"){
	        $(this).find("#type-edit").text("录播课");
        }
        if(courseList[index].courseType == "LIVE"){
	        $(this).find("#type-edit").text("直播课");
        }
        if(courseList[index].image && courseList[index].image.length>0){
            $(this).find(".imagefileupload img").attr("src", "${contextPath}/"+courseList[index].image).show();
            $(this).find(".imagefileupload img").attr("data-img",courseList[index].image);
            $(this).find(".imagefileupload span").hide();
            //$(this).find(".imagefileupload").css("height","auto");
        }else{
            $(this).find(".imagefileupload img").hide();
            $(this).find(".imagefileupload span").show();
        }
        $(this).find("[name='coursedesc']").val(courseList[index].description);
        $(this).find('#EditCourseBtn').data("id",courseList[index].id);
        //分类
        if(curCourse.categoryId){
            $(this).find("[name='categoryId'] option[data-id="+curCourse.categoryId+"]").attr("selected",true);
        }
        //初始化所有属性
        findAttrListEdit(curCourse.categoryId);
        
        if(curCourse.type){
            $(this).find("[name='coursetype'] option[data-id="+curCourse.type+"]").attr("selected",true);
        }
        
        jqEditXHR = null;
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
            var title = $(that).find("[name='coursetitle']").val();
            if(title.length>0){
                $("#EditCourseBtn").prop('disabled', false);
            }
            
        }).on('fileuploaddone', function (e, data) {
            $("#EditCourseDialog").find(".imagefileupload img").attr("data-img", data.result.filename);
        }).prop('disabled', !$.support.fileInput)
            .parent().addClass($.support.fileInput ? undefined : 'disabled');
    });

    /**************** 删除确认对话框 *****************/
    $('#DelCourseDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        if(index!=null){
            $(this).find('.modal-body').text("是否删除课程  \""+courseList[index].title+"\"?");
            $(this).find('#DelCourseBtn').data("id",courseList[index].id);
            $('#DelCourseBtn').prop("disabled",false);
        }else{
            if($("table input[type='checkbox']:checked").size()>0){
                $(this).find('.modal-body').text("是否删除所选课程 ?");
                $(this).find('#DelCourseBtn').data("id",-1);
                $('#DelCourseBtn').prop("disabled",false);
            }else{
                $(this).find('.modal-body').text("没有课程被选中");
                $('#DelCourseBtn').prop("disabled",true);
            }
        }
    });

    /**************** 修改分类对话框 *****************/
    $('#EditCategoryDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curCourse = courseList[index];
        $("#EditCategoryForm .form-group").remove();
        if(curCourse.categoryId>=0){
            var path = new Array();
            var i=0;
            var curTree = categoryTree.children;
            traverseTree(categoryTree.children,path,curCourse.categoryId);
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
        $(this).find('#EditCategoryBtn').data("id",curCourse.vid);
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
        //alert("querystr"+querystr);
        queryUser(querystr,function(data){
        	//alert(JSON.stringify(data));
            queryOwnerList = data.data;
            var node = $('#QueryOwnerDialog').find('.modal-body');
            liststr = "<form class=\"form-horizontal\" role=\"form\" name=\"roleform\">";
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

    /**************** 编辑课程详情对话框 *****************/
    $('#EditCourseDetailDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curCourse = courseList[index];
        $.ajax({
            "url": sdkPath+"/courses/"+curCourse.id+"/detail",
            "type": "GET",
            "dataType":"json",      
            "contentType":"application/json",
        }).success(function(data){
        	curCourse.detail = data.detail;
            UM.getEditor('myEditor').setContent(curCourse.detail,0);
        }).fail(function(data){
            console.log("connect "+this.url+" failed!");
            console.log(data);
        });
    });

    /**************** 修改课程章节对话框 *****************/
    $('#EditCourseChapterDialog').on('show.bs.modal', function (event) {
    	//alert(0);
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        //alert(index+"<<<<index");
        curCourse = courseList[index];
        $.ajax({
            "url": sdkPath+"/courses/"+curCourse.id+"/courseChapterDtoS",
            "type": "GET",
            "dataType":"json",      
            "contentType":"application/json",
        }).success(function(data){
        	if(data.videoList){
        		videoList=data.videoList;
        	}
        	if(data.liveList){
	        	liveList=data.liveList;
        	}
        	console.log("courseChapterDtoS>>>"+JSON.stringify(data.courseDto.courseChapterDtoS))
            updateChapter(data.courseDto);
        }).fail(function(data){
            console.log("connect "+this.url+" failed!");
            console.log(data);
        });
        
        
        
        
    });

    //################## 按钮点击事件  ################

    $("#AddCourseDialog input[name='coursetitle']").on("keyup",function(){
        var title = $("#AddCourseDialog").find("[name='coursetitle']").val();
        if(jqAddXHR && title.length>0){
            $("#AddCourseBtn").prop('disabled', false);
        }else{
            $("#AddCourseBtn").prop('disabled', true);
        }
    });
    
    /**************** 添加课程按钮 *****************/
    $("#AddCourseBtn").on("click",function(){
        if(jqAddXHR){
            $(this).prop('disabled', true);
            jqAddXHR.submit();
          
        }
    });

    /**************** 编辑课程按钮 *****************/
    $("#EditCourseBtn").on("click",function(){
    	var time = new Date();
    	var attrValueIdList=[];
    	curCourse.sn = $("#EditCourseDialog").find("[name='coursesn']").val();
        curCourse.title = $("#EditCourseDialog").find("[name='coursetitle']").val();
        curCourse.courseType = $("#EditCourseDialog").find("[name='coursetype'] option:selected").data("id");
        curCourse.totallesson = $("#EditCourseDialog").find("[name='courselesson']").val();
        curCourse.startTime = ($("#EditCourseDialog").find("[name='coursestarttime']").val());
        curCourse.endTime =($("#EditCourseDialog").find("[name='courseendtime']").val());
        curCourse.modifyTime = time;
        curCourse.image = $("#EditCourseDialog").find("img").attr("data-img");
        curCourse.categoryId = $("#EditCourseDialog").find("[name='categoryId']").val();
        var selectNum=$("#EditCourseDialog #attr-list select").length;
		for(var i=0;i<selectNum;i++){
			attrValueIdList[i]=$("#EditCourseDialog #attr-list select")[i].value;
		}
		curCourse.attrValueIdList = attrValueIdList;
        curCourse.description = $("#EditCourseDialog").find("[name='coursedesc']").val();
        console.log(JSON.stringify(curCourse));
        editCourse(curCourse);
        
    });

    /**************** 重新分类按钮 *****************/
    $("#EditCategoryBtn").on("click",function(){
    	var course = curCourse;
    	course.categoryId = editCat.id;
        editCourseCategory(course);
    });

    /**************** 删除课程按钮 *****************/
    $("#DelCourseBtn").on("click",function(){
        var courseId = $(this).data("id");
        //alert(courseId);
        if(courseId>0){
            delCourse(courseId);
            $("tbody tr[data-id='"+courseId+"']").remove();
        }else{
            $("tbody input[type='checkbox']:checked").each(function(){
                var tr = $(this).parentsUntil("tbody").filter("tr");
                var index = $(tr).data('index');
                delCourse(courseList[index].id);
                $(tr).remove();
            });
        }
    });

    /**************** 编辑课程详情课程按钮 *****************/
    $("#EditCourseDetailBtn").on("click",function(){
        var course = curCourse;
        course.detail = UM.getEditor('myEditor').getContent();
        editCourseDetail(course);
    });

    /**************** 发布按钮 *****************/
    $("table").on("click","ul li a#PublishBtn",function(){
        var course = {"id":"","courseStatus":""};
        course.id = $(this).attr("data-id");
        course.courseStatus = "Verified";
        editCourseStatus(course);
    });

    /**************** 审核按钮 *****************/
    $("table").on("click","ul li a#VerifyBtn",function(){
    	var course = {"id":"","courseStatus":""};
        course.id = $(this).attr("data-id");
        course.courseStatus = "Verified";
        editCourseStatus(course);
    });
    /**************** 审核Status按钮 *****************/
    $("table").on("click","ul li a#StatusVerifyBtn",function(){
    	var course = {"id":"","status":""};
        course.id = $(this).attr("data-id");
        course.status = "NORMAL";
        editCourseStatus(course);
    });


    /**************** 取消审核按钮 *****************/
    $("table").on("click","ul li a#UnVerifyBtn",function(){
    	var course = {"id":"","status":""};
        course.id = $(this).attr("data-id");
        course.status = "UNAURHORIZED";
        editCourseStatus(course);
    });

    /**************** 开课按钮 *****************/
    $("table").on("click","ul li a#StartBtn",function(){
    	var course = {"id":"","courseStatus":""};
        course.id = $(this).attr("data-id");
        course.courseStatus = "Ongoing";
        editCourseStatus(course);
    });

    /**************** 停课课按钮 *****************/
    $("table").on("click","ul li a#StopBtn",function(){
    	var course = {"id":"","courseStatus":""};
        course.id = $(this).attr("data-id");
        course.courseStatus = "Finish";
        editCourseStatus(course);
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
        getAllCourse(queryCat.id,queryOwner,"",0);
        
    });
    
    $("#QueryStringBtn").on("click",function(){
        queryString = $("input[name='queryString']").val();
        //alert(queryString);
        getAllCourse(queryCat.id,queryOwner,queryString,0);
    });
    
    $("#content-page .pagination").on("click","li",function(){
        var page = $(this).data("page");
       // alert("queryOwner:"+queryOwner+"   queryString:"+queryString	);
        if(page!=undefined)
            getAllCourse(queryCat.id,queryOwner,queryString,page);
    });
});



//判断选中的要到处的项
function exportCourseExcelUp(){
	    	var url = "member/course/exportCourseExcel?param=";
	    	var a = "";
	    	if($("#ExportCourseDialog .modal-body input[name = 'createTime']").prop("checked")){
	    		a += "1";
	    	}
	    	if($("#ExportCourseDialog .modal-body input[name = 'status']").prop("checked")){
	    		if(a!=""){a+=","}
	    		a += "2";
	    	}
	    	if($("#ExportCourseDialog .modal-body input[name = 'title']").prop("checked")){
	    		if(a!=""){a+=","}
	    		a += "3";
	    	}
	    	if($("#ExportCourseDialog .modal-body input[name = 'description']").prop("checked")){
	    		if(a!=""){a+=","}
	    		a += "4";
	    	}
	    	if($("#ExportCourseDialog .modal-body input[name = 'detail']").prop("checked")){
	    		if(a!=""){a+=","}
	    		a += "5";
	    	}
	    	if($("#ExportCourseDialog .modal-body input[name = 'user']").prop("checked")){
	    		if(a!=""){a+=","}
	    		a += "6";
	    	}
	    	if($("#ExportCourseDialog .modal-body input[name = 'textbook']").prop("checked")){
	    		if(a!=""){a+=","}
	    		a += "7";
	    	}
	    	if($("#ExportCourseDialog .modal-body input[name = 'subject']").prop("checked")){
	    		if(a!=""){a+=","}
	    		a += "8";
	    	}
	    	if($("#ExportCourseDialog .modal-body input[name = 'grade']").prop("checked")){
	    		if(a!=""){a+=","}
	    		a += "9";
	    	}
	    	if($("#ExportCourseDialog .modal-body input[name = 'startTime']").prop("checked")){
	    		if(a!=""){a+=","}
	    		a += "10";
	    	}
	    	if($("#ExportCourseDialog .modal-body input[name = 'endTime']").prop("checked")){
	    		if(a!=""){a+=","}
	    		a += "11";
	    	}
	    	if($("#ExportCourseDialog .modal-body input[name = 'totallesson']").prop("checked")){
	    		if(a!=""){a+=","}
	    		a += "12";
	    	}
	    	if($("#ExportCourseDialog .modal-body input[name = 'type']").prop("checked")){
	    		if(a!=""){a+=","}
	    		a += "13";
	    	}

	    	var userid = "";
	    	var param1 = "";
	    	param1 = $("#coursename input").val();
	    	userid = $("input[name = 'queryOwnerId']").val();
	    	
	    	url = url +a;
	    	url += "&userid=" + userid + "&param1=" + param1;
	    	$("#ExportCourseDialog .modal-footer form").attr("action",url);
	    	
	    	layer.msg("导出成功");
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
	                +"<label class=\"col-sm-3 control-label\">"+categorys[i].attriName+" :</label>"
	                +" <div class=\"col-sm-8\">"
	                +" <select  class=\"form-control query\" id=\"c"+categorys[i].attriId+"\" data-id=\""+categorys[i].attriId+"\" name=\"queryArray["+i+"]\"></select>"
	 		    	+"</div>"
	 		    	+"<div class=\"col-md-3 col-sm-4 col-xs-6\">"
	 		    	+"</div>"
	 		    	+" </div>";
	 		   }
	 		$("#AddCourseDialog #attr-list").html("").append(categoryitems);
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
	                +"<label class=\"col-sm-3 control-label\">"+categorys[i].attriName+" :</label>"
	                +" <div class=\"col-sm-8\">"
	                +" <select  class=\"form-control query\" id=\"c"+categorys[i].attriId+"\" data-id=\""+categorys[i].attriId+"\" name=\"queryArray["+i+"]\"></select>"
	 		    	+"</div>"
	 		    	+"<div class=\"col-md-3 col-sm-4 col-xs-6\">"
	 		    	+"</div>"
	 		    	+" </div>";
	 		   }
	 		$("#EditCourseDialog #attr-list").html("").append(categoryitems);
		 	//alert(curCourse.attrValueIdList);
	 		for(var i=0;i<categorys.length;i++){
	 			 for(var j=0;j<items.length;j++){
		 			if(items[j].attributenameId==categorys[i].attriId){
		 				var option='';
		 				option +="<option  data-id=\""+items[j].id+"\" value=\""+items[j].id+" \" ";
		 				for(var k=0;k<curCourse.attrValueIdList.length;k++){
							if(curCourse.attrValueIdList[k]==items[j].id){
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


//加载章节事件
function updateChapter(dataAll) {
	$("#updateCourse_three").html("");
	$("#updateCourse_three").append(head);
	var data=dataAll.courseChapterDtoS;
	console.log("updateChapter>>>>"+data);
	if(dataAll.type=="0"){
		var b = "";
		if (data.length > 0) {
		
			var a = "";
			for (var intt = 0; intt < data.length; intt++) {
				a += "<div class=\"form-group\">" + "  		<div id=\""
						+ intt
						+ "\">"
						+ "  			<h4 onmousemove=\"show_updatebtnshow(this)\" onmouseout=\"show_updatebtnhide(this)\">"
						+ "  				<span class=\"coursechapter_chapter\">第"
						+ chaptername[(intt)]
						+ "节</span>"
						+ "  			<div id=\"coursetitle_"
						+ (intt)
						+ "\" style=\"display: none;\">"
						+ "  				<span class=\"chapter_input\">"
						+ "  					<input type=\"text\" name=\"Couesechapter_title\" placeholder=\"输入标题\" value=\""
						+ data[intt].title
						+ "\">"
						+ "  				</span>"
						+ "  				<span class=\"confirm\">"
						+ "						<button class=\"btn btn-warning btn-sm\" type=\"button\" onclick=\"coursetitle_add_btn(this)\">保存</button>"
						+ "					<button class=\"btn btn-danger btn-sm\" type=\"button\" onclick=\"delChapter(this)\">取消</button>"
						+ "  				</span>"
						+ "  			</div>"
						+ "  			<div  id=\"coursetitle_none_"
						+ (intt)
						+ "\" style=\"display: block\">"
						+ "      				<b>"
						+ data[intt].title
						+ "</b>"
						+ "      			<button class=\"btn btn-warning btn-sm\" type=\"button\"  onclick=\"coursetitle_update_btn(this)\" style=\"display: none\">修改</button>"
						+ "      			<button class=\"btn btn-warning btn-sm\" type=\"button\"  onclick=\"coursetitle_delete_btn(this)\" style=\"display: none\">删除</button>"
						+ "      			<a  onclick=\"showupload(this)\" style=\"float: right;margin-right:5px;font-size: 14px; font-weight: bold;color: #A3C2E0;\">展开</a>"
						+ "  			</div>"
						+ "  			</h4>"
						+ "  			<div class=\"select_video\" style=\"display: none\">"
						+ "       			 <div class=\"select_box\">"
				if (data[intt].videoImgUrl == "") {
					a += "       			 	<input type=\"text\" hidden=\"hidden\" name=\"videoid\">"
							+ "       			 	<input type=\"text\" hidden=\"hidden\" name=\"title\">"
							+ "       			 	<a href=\"#updateCourseChapterDialog\" data-toggle=\"modal\" class=\"video\" onclick=\"selectCourse(this)\"></a>"
				} else {
					a += "<input type=\"text\" hidden=\"hidden\" name=\"videoid\" value=\""
							+ data[intt].videoId
							+ "\">"
							+ "<input type=\"text\" hidden=\"hidden\" name=\"title\">"
							+ "<img alt=\""
							+ data[intt].videoImgUrl
							+ "\" src=\""
							+ contextPath
							+ "/"
							+ data[intt].videoImgUrl
							+ "\" "
							+ "style=\"max-width: 200px;max-height: 200px;min-width: 60px;min-height: 60px;margin-left: 159px; "
							+ "float: left\" href=\"#updateCourseChapterDialog\" data-toggle=\"modal\" "
							+ "title=\""
							+ data[intt].title
							+ "\"  "
							+ "onclick=\"selectCourse(this)\">"
				}
				a += "        			 </div>"
				a += "  			</div>"
				a += "  			  		</div>"
				a += "  </div>"
			}
			$("#updateCourse_three").html("");
			$("#updateCourse_three").append(head);
			$("#updateCourse_three").append(a);
		}
		$("#updateCourse_three").show();
		chapter = data.length - 1;
	}
	
	if(dataAll.type=="1"){
		var b = "";
		if (data.length > 0) {

			var a = "";
			for (var intt = 0; intt < data.length; intt++) {
				a += "<div class=\"form-group\">" + "  		<div id=\""
						+ intt
						+ "\">"
						+ "  			<h4 onmousemove=\"show_updatebtnshow(this)\" onmouseout=\"show_updatebtnhide(this)\">"
						+ "  				<span class=\"coursechapter_chapter\">第"
						+ chaptername[(intt)]
						+ "节</span>"
						+ "  			<div id=\"coursetitle_"
						+ (intt)
						+ "\" style=\"display: none;\">"
						+ "  				<span class=\"chapter_input\">"
						+ "  					<input type=\"text\" name=\"Couesechapter_title\" placeholder=\"输入标题\" value=\""
						+ data[intt].title
						+ "\">"
						+ "  				</span>"
						+ "  				<span class=\"confirm\">"
						+ "						<button class=\"btn btn-warning btn-sm\" type=\"button\" onclick=\"coursetitle_add_btn(this)\">保存</button>"
						+ "					<button class=\"btn btn-danger btn-sm\" type=\"button\" onclick=\"delChapter(this)\">取消</button>"
						+ "  				</span>"
						+ "  			</div>"
						+ "  			<div  id=\"coursetitle_none_"
						+ (intt)
						+ "\" style=\"display: block\">"
						+ "      				<b>"
						+ data[intt].title
						+ "</b>"
						+ "      			<button class=\"btn btn-warning btn-sm\" type=\"button\"  onclick=\"coursetitle_update_btn(this)\" style=\"display: none\">修改</button>"
						+ "      			<button class=\"btn btn-warning btn-sm\" type=\"button\"  onclick=\"coursetitle_delete_btn(this)\" style=\"display: none\">删除</button>"
						+ "      			<a  onclick=\"showupload(this)\" style=\"float: right;margin-right:5px;font-size: 14px; font-weight: bold;color: #A3C2E0;\">展开</a>"
						+ "  			</div>"
						+ "  			</h4>"
						+ "  			<div class=\"select_video\" style=\"display: none\">"
						+ "       			 <div class=\"select_box\">"
				if (data[intt].liveImgUrl == "") {
					a += "       			 	<input type=\"text\" hidden=\"hidden\" name=\"videoid\">"
							+ "       			 	<input type=\"text\" hidden=\"hidden\" name=\"title\">"
							+ "       			 	<a href=\"#updateCourseChapterDialog\" data-toggle=\"modal\" class=\"video\" onclick=\"selectCourse(this)\"></a>"
				} else {
					a += "<input type=\"text\" hidden=\"hidden\" name=\"videoid\" value=\""
							+ data[intt].liveId
							+ "\">"
							+ "<input type=\"text\" hidden=\"hidden\" name=\"title\">"
							+ "<img alt=\""
							+ data[intt].liveImgUrl
							+ "\" src=\""
							+ contextPath
							+ "/"
							+ data[intt].liveImgUrl
							+ "\" "
							+ "style=\"max-width: 200px;max-height: 200px;min-width: 60px;min-height: 60px;margin-left: 159px; "
							+ "float: left\" href=\"#updateCourseChapterDialog\" data-toggle=\"modal\" "
							+ "title=\""
							+ data[intt].title
							+ "\"  "
							+ "onclick=\"selectCourse(this)\">"
				}
				a += "        			 </div>"
				a += "  			</div>"
				a += "  			  		</div>"
				a += "  </div>"
			}
			$("#updateCourse_three").html("");
			$("#updateCourse_three").append(head);
			$("#updateCourse_three").append(a);
		}
		$("#updateCourse_three").show();
		chapter = data.length - 1;
	}

}

function shoeAdd() {
	
	if (chapter > 39) {
		layer.msg("章节最多40章");
		return;
	}
	if ($("#coursetitle_" + chapter + " span input").val() == "") {
		layer.msg("章节标题不能为空");
		return;
	}
	var a = "";
	a += "<div class=\"form-group\">" + "  		<div id=\""
			+ (chapter + 1)
			+ "\">"
			+ "  			<h4 onmousemove=\"show_updatebtnshow(this)\" onmouseout=\"show_updatebtnhide(this)\">"
			+ "  				<span class=\"coursechapter_chapter\">第"
			+ chaptername[(chapter + 1)]
			+ "节</span>"
			+ "  			<div id=\"coursetitle_"
			+ (chapter + 1)
			+ "\">"
			+ "  				<span class=\"chapter_input\">"
			+ "  					<input type=\"text\" name=\"Couesechapter_title\" placeholder=\"输入标题\">"
			+ "  				</span>"
			+ "  				<span class=\"confirm\">"
			+ "						<button class=\"btn btn-warning btn-sm\" type=\"button\" onclick=\"coursetitle_add_btn(this)\">保存</button>"
			+ "					<button class=\"btn btn-danger btn-sm\" type=\"button\" onclick=\"delChapter()\">取消</button>"
			+ "  				</span>"
			+ "  			</div>"
			+ "  			<div  id=\"coursetitle_none_"
			+ (chapter + 1)
			+ "\" style=\"display: none\">"
			+ "      				<b></b>"
			+ "      			<button class=\"btn btn-warning btn-sm\" type=\"button\"  onclick=\"coursetitle_update_btn(this)\" style=\"display: none\">修改</button>"
			+ "      			<button class=\"btn btn-warning btn-sm\" type=\"button\"  onclick=\"coursetitle_delete_btn(this)\" style=\"display: none\">删除</button>"
			+ "      			<a  onclick=\"showupload(this)\" style=\"float: right;margin-right:5px;font-size: 14px; font-weight: bold;color: #A3C2E0;\">收起</a>"
			+ "  			</div>"
			+ "  			</h4>"
			+ "  			<div class=\"select_video\" style=\"display: none\">"
			+ "       			 <div class=\"select_box\">"
			+ "       			 	<input type=\"text\" hidden=\"hidden\" name=\"videoid\">"
			+ "       			 	<input type=\"text\" hidden=\"hidden\" name=\"title\">"
			+ "       			 	<a href=\"#updateCourseChapterDialog\" data-toggle=\"modal\" class=\"video\" onclick=\"selectCourse(this)\"></a>"
			+ "        			 </div>" + "  			</div>"
			+ "  			  		</div>" + "  </div>"
	$("#updateCourse_three").append(a);
	chapter = chapter + 1;
}

//显示修改按钮事件
function show_updatebtnshow(o) {
	$(o).find("div").eq(1).find("button").show();
}
// 显示修改按钮事件
function show_updatebtnhide(o) {
	$(o).find("div").eq(1).find("button").hide();
}


//显示上传
function showupload(o) {
	if ($(o).text() == "收起") {
		$(o).text("展开");
		$(o).parent().parent().parent().find(".select_video").hide();
	} else {
		$(o).text("收起");
		$(o).parent().parent().parent().find(".select_video").show();
	}
}

//去除新增的章节
function delChapter(o) {
	layer.confirm('确认删除此章节', {
		btn : [ '确认', '取消' ]
	}, function() {
		$(o).parent().parent().parent().parent().remove();
		chapter = chapter - 1;
		layer.msg("删除成功");
	}, function() {
	});
}
//选择节点事件
function selectCourse(o) {
	var title="";
	var content="";
	//alert(curCourse.title);
	if(curCourse.type=="0"){
		title="添加视频";
		content="";
		content+=" <table "
		+ " class=\"table table-bordered table-hover table-striped table-condensed\" "
		+"id=\"IsDataSuccess\">"
		+"<h5>可用视频：" +videoList.length+ "部</h5> "
		+"<thead>"
		+"<tr>"	
		+"<th>文件名</th>"		
		+"<th>封面</th>"		
		+"<th>上传时间</th>"		
		+"<th>选择</th>"		
		+"</tr>"	
		+"</thead>"
		+"<tbody>";
		for(var i=0;i<videoList.length;i++){
			content+=""
				+"<tr data-id=\" "+videoList[i].id+"  \" class=\"info\">"		
				+"<td>"+videoList[i].title+"</td>"			
				+"<td><img alt=\" "+videoList[i].image+" \""			
				+"src=\"${contextPath}/"+videoList[i].image+"\""				
				+"style=\"max-width: 100px; max-height: 100px\"></td>"				
				+"<td>"+videoList[i].createTime+"</td>"			
				+"<td>"			
				+"<button type=\"button\" class=\"btn btn-default btn-sm\""				
				+"data-toggle=\"modal\""					
				+"data-target=\"#updateCourseChapterDialog\""					
				+"onclick=\"selectvideo(this)\">选择</button>"					
				+"</td>"			
				+"</tr>"
		}		
		content+=""		
		+"</tbody>"
		+"</table>"
		
		
		$("#updateCourseChapterDialog .modal-body").html("");
		$("#updateCourseChapterDialog .modal-body").append(content);
		
		
	}
	if(curCourse.type=="1"){
		title="添加直播";
		content="";
		content+=" <table "
		+ " class=\"table table-bordered table-hover table-striped table-condensed\" "
		+"id=\"IsDataSuccess\">"
		+"<h5>可用视频：" +liveList.length+ "部</h5> "
		+"<thead>"
		+"<tr>"	
		+"<th>文件名</th>"		
		+"<th>封面</th>"		
		+"<th>上传时间</th>"		
		+"<th>选择</th>"		
		+"</tr>"	
		+"</thead>"
		+"<tbody>";
		for(var i=0;i<liveList.length;i++){
			content+=""
				+"<tr data-id=\" "+liveList[i].id+"  \" class=\"info\">"		
				+"<td>"+liveList[i].title+"</td>"			
				+"<td><img alt=\" "+liveList[i].image+" \""			
				+"src=\"${contextPath}/"+liveList[i].image+"\""				
				+"style=\"max-width: 100px; max-height: 100px\"></td>"				
				+"<td>"+liveList[i].createTime+"</td>"			
				+"<td>"			
				+"<button type=\"button\" class=\"btn btn-default btn-sm\""				
				+"data-toggle=\"modal\""					
				+"data-target=\"#updateCourseChapterDialog\""					
				+"onclick=\"selectvideo(this)\">选择</button>"					
				+"</td>"			
				+"</tr>"
		}		
		content+=""		
		+"</tbody>"
		+"</table>"
		
		
		$("#updateCourseChapterDialog .modal-body").html("");
		$("#updateCourseChapterDialog .modal-body").append(content);
		
	}
	$("#updateCourseChapterDialog .modal-title").html(title);
	chapterid = $(o).parent().parent().parent().attr("id");
	
	
}

// 确认标题事件
function coursetitle_add_btn(o) {
	if ($(o).parent().parent().find("input").val() == "") {
		layer.msg("标题不为空");
		return;
	}
	$(o).parent().parent().hide();
	var a = $(o).parent().parent().find("input").val();
	$(
			"#coursetitle_none_"
					+ $(o).parent().parent().parent().parent().attr("id")
					+ " b").text(a);
	$(
			"#coursetitle_none_"
					+ $(o).parent().parent().parent().parent().attr("id") + "")
			.show();
	$(o).parent().parent().parent().parent().find(".select_video").show();
	$(o).parent().parent().parent().find("div").eq(1).find("a").text("收起")
}

//确认标题事件
function coursetitle_update_btn(o) {
	$("#coursetitle_none_" + $(o).parent().parent().parent().attr("id") + "")
			.hide();
	$("#coursetitle_" + $(o).parent().parent().parent().attr("id") + "").show();
}

// 删除章节
function coursetitle_delete_btn(o) {
	layer.confirm('确认删除此章节', {
		btn : [ '确认', '取消' ]
	}, function() {
		layer.closeAll("dialog");
		var courseId = curCourse.id;
		var chapterIndex = $(o).parent().parent().parent().attr("id");
		if (courseId ==""|| chapterIndex=="") {
			return
		}
		courseId=parseInt(courseId);
		chapterIndex=parseInt(chapterIndex)+1;
		//alert("courseId:"+courseId+"  chapterIndex:"+chapterIndex);
		$.ajax({
			"url" : sdkPath + "/course/delChapter/" + courseId+"/"+chapterIndex,
			"type" : "GET",
		}).success(function(data) {
			//alert(data.courseChapterDtoS);
			//layer.msg("删除成功");
			initUpdataForm(data);
			
		}).fail(function() {
			console.log("connect " + this.url + " failed!");
		})
		
	}, function() {
		layer.close();
	});
}

//选择章节添加的视频
function selectvideo(o) {
	//alert($("#EditCourseChapterDialog .form-group #" + chapterid + ""));
	$("#EditCourseChapterDialog .form-group #" + chapterid + "").find("input[name='videoid']").val(
			$(o).parent().parent().attr("data-id"));
	$("#EditCourseChapterDialog .form-group #" + chapterid + "").find("input[name='title']").val(
			$(o).parent().parent().find("td").eq(0).text());
	var imagefile = $(o).parent().parent().find("td").eq(1).find("img").attr(
			'src');
	var a = "";
	a += "<img alt=\""
			+ imagefile
			+ "\" src=\""
			+ imagefile
			+ "\" "
			+ "style=\"max-width: 200px;max-height: 200px;min-width: 60px;min-height: 60px;margin-left: 159px; "
			+ "float: left\" href=\"#updateCourseChapterDialog\" data-toggle=\"modal\" "
			+ "title=\"" + $(o).parent().parent().find("td").eq(0).text()
			+ "\"  " + "onclick=\"selectCourse(this)\">"
	$("#EditCourseChapterDialog .form-group #" + chapterid + " .select_box a").remove();
	$("#EditCourseChapterDialog .form-group #" + chapterid + " .select_box img").remove();
	$("#EditCourseChapterDialog .form-group #" + chapterid + " .select_box").append(a);
}


//修改专辑按钮
$("#EditCourseChapterBtn")
		.on(
				"click",
				function() {
					courseChapters="";
					for (var intt = 0; intt < (chapter + 1); intt++) {
						if (intt == 0) {
							// 获取节点数字
							courseChapters += (intt + 1);

							courseChapters += " ,";

							// 获取节点名称
							courseChapters += $(
									"#EditCourseChapterDialog #coursetitle_none_" + intt + " b")
									.text();

							courseChapters += " ,";

							// 获取节点视频id
							strId=$(
									"#EditCourseChapterDialog .form-group #" + intt
											+ " .select_video").find(
									"input[name = videoid]").val();
							if(isNaN(strId)){
								strId="-1";
							}
							 courseChapters +=strId;
						} else {
							courseChapters += " ;";

							// 获取节点数字
							courseChapters += (intt + 1);

							courseChapters += " ,";

							// 获取节点名称
							courseChapters += $(
									"#EditCourseChapterDialog #coursetitle_none_" + intt + " b")
									.text();

							courseChapters += " ,";

							// 获取节点视频id
							strId=$(
									"#EditCourseChapterDialog .form-group #" + intt
											+ " .select_video").find(
									"input[name = videoid]").val();
							if(isNaN(strId)){
								strId="-1";
							}
							 courseChapters +=strId;
							
						}
					}

					//alert(courseChapters);
					var course=curCourse;
					course.courseChapters=courseChapters;
					$.ajax(
							{
								"url" : sdkPath
										+ "/course/updateCourseChapters",
								"type" : "PUT",
								"data" : JSON.stringify(course),
								"dataType" : "json",
								"contentType" : "application/json",
							}).success(
							function(data) {
								if (data.result) {
									layer.msg("修改成功");
									$("#EditCourseChapterDialog").modal('hide');
									
								} else {
									$("#worngMsgUpdate").text(
											data.wrong_msg);
								}
							}).fail(function() {
						console.log("connect " + this.url + " failed!");
					})
});

//放入表单
function initUpdataForm(data) {
	if (data.courseChapterDtoS != null || data.courseChapterDtoS != "") {
		updateChapter(data);
	}
}
</script>

</body>
</html>