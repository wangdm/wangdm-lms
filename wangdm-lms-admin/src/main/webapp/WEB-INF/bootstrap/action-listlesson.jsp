
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
                <div class="operation"><a href="#addLessonDialog" data-toggle="modal"><img src="${contextPath}/assets/images/add.png"/><span>&nbsp;添加上课节次</span></a></div>
                <div class="operation"><a href="#delLessonDialog" data-toggle="modal"><img src="${contextPath}/assets/images/delete.png"/><span>&nbsp;删除所选上课节次</span></a></div>
            </div>
        </div>
    </div>
    <table class="table table-bordered table-hover">
        <thead>
             <tr>
               <th><input type="checkbox" name="lesson"></th>
               <th>序号</th>
               <th>节次名称</th>
               <th>开始时间</th>
               <th>结束时间</th>
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

<!-- 添加上课节次对话框 -->
<div class="modal fade" id="addLessonDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加上课节次</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="addLessonForm" name="addLessonForm">
              <div class="form-group">
                <label for="lessonname" class="col-sm-3 control-label">名称：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="lessonname">
                </div>
              </div>
              <div class="form-group">
                <label for="starttime" class="col-sm-3 control-label">开课时间：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="starttime">
                </div>
              </div>
              <div class="form-group">
                <label for="endtime" class="col-sm-3 control-label">结束时间：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="endtime">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="addLessonBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 修改上课节次对话框 -->
<div class="modal fade" id="editLessonDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">编辑上课节次</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="editLessonForm" name="editLessonForm">
              <div class="form-group">
                <label for="lessonname" class="col-sm-3 control-label">名称：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="lessonname">
                </div>
              </div>
              <div class="form-group">
                <label for="starttime" class="col-sm-3 control-label">开课时间：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="starttime">
                </div>
              </div>
              <div class="form-group">
                <label for="endtime" class="col-sm-3 control-label">结束时间：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="endtime">
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="editLessonBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 导出课表对话框 -->
<div class="modal fade" id="delLessonDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">删除上课节次</h4>
      </div>
      <div class="modal-body">
        <span>确认删除上课节次</span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="delLessonBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
var lessonList = new Array();
var curLesson;
var curPage = 0;
$(function(){
    getAllLesson(0);
    $('#editLessonDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curLesson = lessonList[index];
        $(this).find("[name='lessonname']").val(curLesson.name);
        $(this).find("[name='starttime']").val(curLesson.starttime);
        $(this).find("[name='endtime']").val(curLesson.endtime);
        $(this).find('#editLessonBtn').data("id",curLesson.id);
    });
    
    $('#delLessonDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        if(index!=null){
            $(this).find('.modal-body').text("是否删除上课节次  \""+lessonList[index].name+"\"?");
            $(this).find('#delLessonBtn').data("id",lessonList[index].id);
            $('#delLessonBtn').prop("disabled",false);
        }else{
            if($("table input[type='checkbox']:checked").size()>0){
                $(this).find('.modal-body').text("是否删除所选上课节次 ?");
                $(this).find('#delLessonBtn').data("id",-1);
                $('#delLessonBtn').prop("disabled",false);
            }else{
                $(this).find('.modal-body').text("没有上课节次被选中");
                $('#delLessonBtn').prop("disabled",true);
            }
        }
    });
    
    $("#addLessonBtn").on("click",function(){
        var lesson = {index:"",name:"",starttime:"",endtime:""};
        lesson.name = $("#addLessonForm").find("[name='lessonname']").val();
        lesson.starttime = $("#addLessonForm").find("[name='starttime']").val();
        lesson.endtime = $("#addLessonForm").find("[name='endtime']").val();
        addLesson(lesson);
    });
    
    $("#editLessonBtn").on("click",function(){
        curLesson.name = $("#editLessonForm").find("[name='lessonname']").val();
        curLesson.starttime = $("#editLessonForm").find("[name='starttime']").val();
        curLesson.endtime = $("#editLessonForm").find("[name='endtime']").val();
        editLesson(curLesson);
        //console.log(JSON.stringify(curLesson));
    });
    
    $("thead input[name='lesson']").on("click",function(){
        if($(this).is(':checked')){
            $("tbody input[type='checkbox']").prop("checked",true);
        }else{
            $("tbody input[type='checkbox']").prop("checked",false);
        }
    });
    
    $("#delLessonBtn").on("click",function(){
        lessonId = $(this).data("id");
        if(lessonId>0){
            delLesson(lessonId);
            $("tbody tr[data-id='"+lessonId+"']").remove();
        }else{
            $("tbody input[type='checkbox']:checked").each(function(){
                var tr = $(this).parentsUntil("tbody").filter("tr");
                var index = $(tr).data('index');
                delLesson(lessonList[index].id);
                $(tr).remove();
            });
        }
    });
    
    $("#content-page .pagination").on("click","li",function(){
        var page = $(this).data("page");
        if(page!=undefined)
        	getAllLesson(page);
    });
});
</script>
</body>
</html>