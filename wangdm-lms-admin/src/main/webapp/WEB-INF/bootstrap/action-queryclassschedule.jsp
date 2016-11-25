
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
                <div class="operationleft col-sm-6">
                    <div class="input-group">
                      <span class="input-group-addon" id="inputHelpBlock"><strong>教室：</strong></span>
                      <input type="text" id="inputHelpBlock" class="form-control" placeholder="选择教室" readonly>
                      <span class="input-group-btn">
                        <button class="btn btn-default" type="button" data-toggle="modal" data-target="#ChooseClassDialog"><span class="glyphicon glyphicon-search"></span></button>
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
    <table class="table table-bordered table-hover table-striped">
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
            <tr>
                <th>${lesson.name}</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- 选择班级对话框 -->
<div class="modal fade" id="ChooseClassDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">选择教室</h4>
      </div>
      <div class="modal-body">
        <div class="grouptree">
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="ChooseClassBtn">确定</button>
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


<script>
//$('#ChooseClassDialog').on('show.bs.modal', function (e) {
$(function(){
    $.ajax({
        "url": contextPath+"/v1/allchildrencategorys/"+0,
        "type": "GET",
    }).success(function(data){
        createTree($(".grouptree"),data);
    }).fail(function(){
        console.log("connect "+this.url+" failed!");
        return null;
    });
    
    $("#ChooseClassBtn").on("click",function(){
        console.log("ChooseClassBtn");
    });
    
    $("#ImportScheduleBtn").on("click",function(){
        console.log("ImportScheduleBtn");
    });
    
    $("#ExportScheduleBtn").on("click",function(){
        console.log("ExportScheduleBtn");
    });
    
    $("tbody td").on("click",function(){
        console.log(this);
    });
});
</script>
</body>
</html>