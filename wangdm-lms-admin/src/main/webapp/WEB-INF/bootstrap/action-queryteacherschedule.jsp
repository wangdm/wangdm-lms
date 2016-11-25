
<!DOCTYPE html>
<html>
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
                <div class="operationleft col-sm-6">
                    <div class="input-group">
                      <span class="input-group-addon"><strong>老师</strong></span>
                      <input type="text" name="queryTeacher" class="form-control" placeholder="选择老师">
                      <span class="input-group-btn">
                        <button class="btn btn-default" type="button" data-toggle="modal" data-target="#QueryTeacherDialog"><span class="glyphicon glyphicon-search"></span></button>
                      </span>
                    </div>
                </div>
                <div class="operationright col-sm-6">
                    <div class="operation"><a href="#ImportScheduleDialog" data-toggle="modal"><img src="${contextPath}/assets/images/excel.png"/><span>&nbsp;导入课表</span></a></div>
                    <div class="operation"><a href="#ExportScheduleDialog" data-toggle="modal"><img src="${contextPath}/assets/images/excel.png"/><span>&nbsp;导出课表</span></a></div>
                </div>
            </div>
        </div>
    </div>
    <table class="table table-bordered table-hover">
        <thead>
             <tr>
               <th>#</th>
               <th>星期一</th>
               <th>星期二</th>
               <th>星期三</th>
               <th>星期四</th>
               <th>星期五</th>
               <th>星期六</th>
               <th>星期日</th>
             </tr>
        </thead>
        <tbody>
        <c:forEach var="lesson" items="${lessonList}">
            <tr data-lesson="${lesson.id}">
                <th>${lesson.name}</th>
                <td data-lesson="${lesson.index}" data-week="0"></td>
                <td data-lesson="${lesson.index}" data-week="1"></td>
                <td data-lesson="${lesson.index}" data-week="2"></td>
                <td data-lesson="${lesson.index}" data-week="3"></td>
                <td data-lesson="${lesson.index}" data-week="4"></td>
                <td data-lesson="${lesson.index}" data-week="5"></td>
                <td data-lesson="${lesson.index}" data-week="6"></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- 选择老师对话框 -->
<div class="modal" id="QueryTeacherDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">选择老师</h4>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="QueryTeacherBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 导入课表对话框 -->
<div class="modal fade" id="ImportScheduleDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">导入课表</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal">
              <div class="form-group">
                <label for="exampleInputFile" class="col-sm-3 control-label">选择课表文件：</label>
                <div class="col-sm-8">
                    <input type="file" class="form-control" id="exampleInputFile">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="ImportScheduleBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 导出课表对话框 -->
<div class="modal fade" id="ExportScheduleDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">导出课表</h4>
      </div>
      <div class="modal-body">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="ExportScheduleBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 添加课表对话框 -->
<div class="modal" id="addScheduleDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">编辑课表</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="addScheduleForm" name="addScheduleForm">
              <div class="form-group">
                <label for="scheduleTeacher" class="col-sm-3 control-label">老师：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="scheduleTeacher" readonly>
                </div>
              </div>
              <div class="form-group">
                <label for="scheduleLesson" class="col-sm-3 control-label">节次：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="scheduleLesson" readonly>
                </div>
              </div>
              <div class="form-group">
                <label for="scheduleWeek" class="col-sm-3 control-label">星期：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="scheduleWeek" readonly>
                </div>
              </div>
              <div class="form-group">
                <label for="scheduleSubject" class="col-sm-3 control-label">学科：</label>
                <div class="col-sm-8">
                    <select class="form-control" name="scheduleSubject">
			        <c:forEach var="subject" items="${subjectList}">
			            <option data-id="${subject.id}">${subject.name}</option>
			        </c:forEach>
                    </select>
                </div>
              </div>
              <div class="form-group">
                <label for="scheduleGroup" class="col-sm-3 control-label">班级：</label>
                <div class="col-sm-8 form-inline scheduleGroup">
                    <select class="form-control group" name="scheduleGroup"></select>
                    <select class="form-control group" name="scheduleGroup"></select>
                    <select class="form-control group" name="scheduleGroup"></select>
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="addScheduleBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
//$('#ChooseClassDialog').on('show.bs.modal', function (e) {
//var week = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"];
var week = ["星期一","星期二","星期三","星期四","星期五","星期六","星期日"];
var queryTeacherList;
var groupTree;
var scheduleList;
var curTeacher = {uid:"0",fullname:"dffsdfd"};
var curSchedule;
var chooseGroup = {gid:"0",name:""};
$(function(){
	
	getAllChildrenGroup(0, function(data){
		groupTree = data;
		//console.log(JSON.stringify(groupTree));
	});
	
    $('#QueryTeacherDialog').on('show.bs.modal', function (event) {
        querystr = $("input[name='queryTeacher']").val();
        queryTeacher(querystr,function(data){
            queryTeacherList = data;
            var node = $('#QueryTeacherDialog').find('.modal-body');
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
    
    $('#addScheduleDialog').on('show.bs.modal', function (event) {
        $("#addScheduleDialog .group").remove();
        if(curSchedule.id>0){
            var path = new Array();
            var i=0;
            var curTree = groupTree.children;
            traverseGroupTree(groupTree.children,path,curSchedule.group.gid);
            $.each(path,function(){
                var j=0;
                $.each(curTree,function(){
                    var index=0;
                    var selectNode = $("#addScheduleDialog .group:eq("+i+")");
                    if(selectNode.size()<=0){
                        $("#addScheduleDialog .scheduleGroup").append("<select class=\"form-control group\" data-deep=\""+i+"\"><option>请选择</option></select>");
                    }
                    $("#addScheduleDialog .group:eq("+i+")").append("<option data-index=\""+j+"\" data-id=\""+this.gid+"\">"+this.name+"</option>");
                    j++;
                });

                for(index=0; i<curTree.length; index++){
                    if(curTree[index].gid==this.gid){
                        break;
                    }
                }
                
                $("#addScheduleDialog .group:eq("+i+")").find("option[data-id="+this.gid+"]").attr("selected",true);
                curTree = curTree[index].children;
                i++;
            });
        }else{
	        var j=0;
	        $("#addScheduleDialog .scheduleGroup").append("<select class=\"form-control group\" data-deep=\"0\"><option>请选择</option></select>");
	        $.each(groupTree.children,function(){
	            $("#addScheduleDialog .group").append("<option data-index=\""+j+"\" data-id=\""+this.gid+"\">"+this.name+"</option>");
	            j++;
	        });
        }
    });
    
    $("#addScheduleDialog").on("change",".group",function(){
        $(this).nextAll().remove();
        var deep = $(this).data("deep");
        var sel = $(this).find("option:selected").data("index");
        chooseGroup.gid = $(this).find("option:selected").data("id");
        chooseGroup.name = $(this).find("option:selected").text();
        var curTree = groupTree;
        if(sel>=0){
            for(var i=0; i<deep+1; i++){
                sel = $("#addScheduleDialog .group:eq("+i+")").find("option:selected").data("index");
                curTree = curTree.children[sel];
            }
            if(curTree.children && curTree.children.length>0){
                $("#addScheduleDialog .scheduleGroup").append("<select class=\"form-control group\" data-deep=\""+i+"\"><option>请选择</option></select>");
                var j=0;
                $.each(curTree.children,function(){
                    $("#addScheduleDialog .group:eq("+(deep+1)+")").append("<option data-index=\""+j+"\" data-id=\""+this.gid+"\">"+this.name+"</option>");
                    j++;
                });
            }
        }
    });

    function clearschedule(){
        $(".content-wrapper tbody tr td").html("");
        $(".content-wrapper tbody tr td").css("background-color","");
        $(".content-wrapper tbody tr td").attr("data-id","");
    }

    function showschedule(data){
        scheduleList = data;
        $.each(scheduleList,function(){
        	var node = $(".content-wrapper tbody tr:eq("+this.lesson.index+") td:eq("+this.week+")");
            oldId = $(node).attr("data-id");
            if(oldId){
            	$(node).css("background-color","#f0ad4e");
            }
        	$(node).append("<div>"+this.subject.name+"</div><div>"+this.group.name+"</div>");
        	$(node).attr("data-id",this.id);
        });
    }
    $("#QueryTeacherBtn").on("click",function(){
    	clearschedule();
        $("#QueryTeacherDialog").modal("hide");
        var index = $("#QueryTeacherDialog input[type='radio']:checked").data("index");
        if(index>=0){
	        curTeacher.uid = queryTeacherList[index].uid;
	        curTeacher.fullname = queryTeacherList[index].username;
	        $("input[name='queryTeacher']").val(curTeacher.fullname);
	        getTeacherSchedule(curTeacher.uid,function(data){
	        	showschedule(data);
	        });
        }else{
            curTeacher.uid = 0;
            curTeacher.fullname = "";
            $("input[name='queryTeacher']").val(curTeacher.fullname);
        }
    });
    
    $("#addScheduleBtn").on("click",function(){
        clearschedule();
    	curSchedule.subject.id = $("#addScheduleDialog").find("[name='scheduleSubject'] option:selected").data("id");
        curSchedule.subject.name = $("#addScheduleDialog").find("[name='scheduleSubject'] option:selected").text();
    	curSchedule.group = chooseGroup;
    	//console.log(JSON.stringify(curSchedule));
    	if(curSchedule.id>0){
            editSchedule(curSchedule, function(data){
                $("#addScheduleDialog").modal("hide");
                getTeacherSchedule(curSchedule.teacher.uid,function(data){
                    showschedule(data);
                });
            });
    	}else{
    		addSchedule(curSchedule, function(data){
    	        $("#addScheduleDialog").modal("hide");
    	        getTeacherSchedule(curSchedule.teacher.uid,function(data){
    	            showschedule(data);
                });
            });
    	}
    });
    
    $("#ImportScheduleBtn").on("click",function(){
        console.log("ImportScheduleBtn");
    });
    
    $("#ExportScheduleBtn").on("click",function(){
        console.log("ExportScheduleBtn");
    });
    
    $("tbody td").on("click",function(){
    	if(curTeacher.uid<=0){
    		return;
    	}
    	schduleId = $(this).data("id");
    	if(schduleId > 0){
    		for(var i=0; i<scheduleList.length; i++){
    			if(schduleId==scheduleList[i].id)
    				curSchedule = scheduleList[i];
    		}
    		chooseGroup = curSchedule.group;
    		$("#addScheduleDialog").find("[name='scheduleSubject'] option[data-id="+curSchedule.subject.id+"]").attr("selected",true);
    	}else{
    		curSchedule = {id:"0",week:"",lesson:{id:"",name:""},subject:{id:"",name:""},group:{gid:"",name:""},teacher:{uid:"",fullname:""}};
            curSchedule.teacher = curTeacher;
            curSchedule.week = $(this).data("week");//week[$(this).data("week")];
            curSchedule.lesson.id = $(this).parent().data("lesson");
            curSchedule.lesson.name = $(this).parent().children("th").text();
    	}
        $("#addScheduleDialog").find("[name='scheduleTeacher']").val(curSchedule.teacher.fullname);
    	$("#addScheduleDialog").find("[name='scheduleWeek']").val(week[curSchedule.week]);
        $("#addScheduleDialog").find("[name='scheduleLesson']").val(curSchedule.lesson.name);
        $("#addScheduleDialog").modal("show");
    });
});
</script>
</body>
</html>