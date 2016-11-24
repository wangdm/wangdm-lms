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
                <div class="operation"><a href="#addTextbookDialog" data-toggle="modal"><img src="${contextPath}/assets/images/add.png"/><span>&nbsp;添加课本</span></a></div>
                <div class="operation"><a href="#delTextbookDialog" data-toggle="modal"><img src="${contextPath}/assets/images/delete.png"/><span>&nbsp;删除所选课本</span></a></div>
            </div>
        </div>
    </div>
    <table class="table table-bordered table-hover">
        <thead>
             <tr>
               <th><input type="checkbox" name="textbook"></th>
               <th>ISBN</th>
               <th>标题</th>
               <th>学科</th>
               <th>年级</th>
               <th>出版社</th>
               <th>编辑</th>
               <th>删除</th>
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

<!-- 添加课本对话框 -->
<div class="modal fade" id="addTextbookDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加课本</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="addTextbookForm" name="addTextbookForm">
              <div class="form-group">
                <label for="textbookISBN" class="col-sm-3 control-label">ISBN：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="textbookISBN">
                </div>
              </div>
              <div class="form-group">
                <label for="textbookTitle" class="col-sm-3 control-label">标题：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="textbookTitle">
                </div>
              </div>
              <div class="form-group">
                <label for="textbookSubject" class="col-sm-3 control-label">学科：</label>
                <div class="col-sm-8">
                  <div class="input-group">
                    <input type="text" class="form-control" name="textbookSubject" placeholder="选择学科" readonly>
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button" data-toggle="modal" data-target="#ChooseSubjectDialog"><span class="glyphicon glyphicon-search"></span></button>
                    </span>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label for="textbookGrade" class="col-sm-3 control-label">年级：</label>
                <div class="col-sm-8">
                  <div class="input-group">
                    <input type="text" class="form-control" name="textbookGrade" placeholder="选择年级" readonly>
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button" data-toggle="modal" data-target="#ChooseGradeDialog"><span class="glyphicon glyphicon-search"></span></button>
                    </span>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label for="textbookPublisher" class="col-sm-3 control-label">出版社：</label>
                <div class="col-sm-8">
                  <div class="input-group">
                    <input type="text" class="form-control" name="textbookPublisher" placeholder="选择出版社" readonly>
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button" data-toggle="modal" data-target="#ChoosePublisherDialog"><span class="glyphicon glyphicon-search"></span></button>
                    </span>
                  </div>
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="addTextbookBtn">添加</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 编辑课本对话框 -->
<div class="modal fade" id="editTextbookDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">编辑</h4>
      </div>
      <div class="modal-body">
          <form  class="form-horizontal" id="editTextbookForm" name="editTextbookForm">
              <div class="form-group">
                <label for="textbookISBN" class="col-sm-3 control-label">ISBN：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="textbookISBN">
                </div>
              </div>
              <div class="form-group">
                <label for="textbookTitle" class="col-sm-3 control-label">标题：</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="textbookTitle">
                </div>
              </div>
              <div class="form-group">
                <label for="textbookSubject" class="col-sm-3 control-label">学科：</label>
                <div class="col-sm-8">
                  <div class="input-group">
                    <input type="text" class="form-control" name="textbookSubject" placeholder="选择学科" readonly>
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button" data-toggle="modal" data-target="#ChooseSubjectDialog"><span class="glyphicon glyphicon-search"></span></button>
                    </span>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label for="textbookGrade" class="col-sm-3 control-label">年级：</label>
                <div class="col-sm-8">
                  <div class="input-group">
                    <input type="text" class="form-control" name="textbookGrade" placeholder="选择年级" readonly>
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button" data-toggle="modal" data-target="#ChooseGradeDialog"><span class="glyphicon glyphicon-search"></span></button>
                    </span>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label for="textbookPublisher" class="col-sm-3 control-label">出版社：</label>
                <div class="col-sm-8">
                  <div class="input-group">
                    <input type="text" class="form-control" name="textbookPublisher" placeholder="选择出版社" readonly>
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button" data-toggle="modal" data-target="#ChoosePublisherDialog"><span class="glyphicon glyphicon-search"></span></button>
                    </span>
                  </div>
                </div>
              </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="editTextbookBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 选择学科对话框 -->
<div class="modal fade" id="ChooseSubjectDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">选择学科</h4>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="ChooseSubjectBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 选择年级对话框 -->
<div class="modal fade" id="ChooseGradeDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">选择年级</h4>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="ChooseGradeBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 选择出版社对话框 -->
<div class="modal fade" id="ChoosePublisherDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">选择出版社</h4>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="ChoosePublisherBtn">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 删除课本对话框 -->
<div class="modal fade" id="delTextbookDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">删除课本</h4>
      </div>
      <div class="modal-body">
        <span>确认删除课本</span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-sm btn-primary" id="delTextbookBtn">删除</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
var textbookList = new Array();
var curSubject = {"id":0, "name":""};
var curGrade = {"id":0, "name":""};
var curPublisher = {"id":0, "name":""};
var curTextbook;
var curPage = 0;
var isEdit = 0;
$(function(){
    getAllTextbook(0);
    
    $('#ChooseSubjectDialog').on('show.bs.modal', function (event) {
        getSubjectList($(this).find('.modal-body'));
    });
    
    $('#ChooseGradeDialog').on('show.bs.modal', function (event) {
        getGradeList($(this).find('.modal-body'));
    });
    
    $('#ChoosePublisherDialog').on('show.bs.modal', function (event) {
        getPublisherList($(this).find('.modal-body'));
    });
    
    $('#addTextbookDialog').on('show.bs.modal', function (event) {
        isEdit = 0;
    });
    
    $('#editTextbookDialog').on('show.bs.modal', function (event) {
    	isEdit = 1;
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        curTextbook = textbookList[index];
        $(this).find("[name='textbookISBN']").val(textbookList[index].isbn);
        $(this).find("[name='textbookTitle']").val(textbookList[index].title);
        curSubject.id = curTextbook.subject.id;
        curSubject.name = curTextbook.subject.name;
        $(this).find("[name='textbookSubject']").val(textbookList[index].subject.name);
        curGrade.id = curTextbook.grade.id;
        curGrade.name = curTextbook.grade.name;
        $(this).find("[name='textbookGrade']").val(textbookList[index].grade.name);
        curPublisher.id = curTextbook.publisher.id
        curPublisher.name = curTextbook.publisher.name;
        $(this).find("[name='textbookPublisher']").val(textbookList[index].publisher.name);
        $(this).find('#editTextbookBtn').data("id",textbookList[index].id);
    });
    
    $('#delTextbookDialog').on('show.bs.modal', function (event) {
        var tr = $(event.relatedTarget).parentsUntil("tbody").filter("tr");
        var index = $(tr).data('index');
        if(index!=null){
            $(this).find('.modal-body').text("是否删除课本  \""+textbookList[index].title+"\"?");
            $(this).find('#delTextbookBtn').data("id",textbookList[index].id);
            $('#delTextbookBtn').prop("disabled",false);
        }else{
            if($("table input[type='checkbox']:checked").size()>0){
                $(this).find('.modal-body').text("是否删除所选课本 ?");
                $(this).find('#delTextbookBtn').data("id",-1);
                $('#delTextbookBtn').prop("disabled",false);
            }else{
                $(this).find('.modal-body').text("没有课本被选中");
                $('#delTextbookBtn').prop("disabled",true);
            }
        }
    });
    
    $("#addTextbookBtn").on("click",function(){
    	var textbook = {"id":0,"isbn":"","title":"","subject":{"id":0},"grade":{"id":0},"publisher":{"id":0}};
    	textbook.isbn = $("#addTextbookForm").find("[name='textbookISBN']").val();
    	textbook.title = $("#addTextbookForm").find("[name='textbookTitle']").val();
        textbook.subject.id = curSubject.id;
        textbook.grade.id = curGrade.id;
        textbook.publisher.id = curPublisher.id;
        addTextbook(textbook);
    });
    
    $("#editTextbookBtn").on("click",function(){
        curTextbook.isbn = $("#editTextbookForm").find("[name='textbookISBN']").val();
        curTextbook.title = $("#editTextbookForm").find("[name='textbookTitle']").val();
        curTextbook.subject.id = curSubject.id;
        curTextbook.subject.name = curSubject.name;
        curTextbook.grade.id = curGrade.id;
        curTextbook.grade.name = curGrade.name;
        curTextbook.publisher.id = curPublisher.id;
        curTextbook.publisher.name = curPublisher.name;
        curTextbook.id = $(this).data("id");
        editTextbook(curTextbook);
        //console.log(JSON.stringify(curTextbook));
    });
    
    $("thead input[name='textbook']").on("click",function(){
        if($(this).is(':checked')){
            $("tbody input[type='checkbox']").prop("checked",true);
        }else{
            $("tbody input[type='checkbox']").prop("checked",false);
        }
    });
    
    $("#delTextbookBtn").on("click",function(){
        textbookId = $(this).data("id");
        if(textbookId>0){
            delTextbook(textbookId);
        }else{
            $("tbody input[type='checkbox']:checked").each(function(){
                var tr = $(this).parentsUntil("tbody").filter("tr");
                var index = $(tr).data('index');
                delTextbook(textbookList[index].id);
            });
        }
    });
    
    $("#ChooseSubjectBtn").on("click",function(){
        $("#ChooseSubjectDialog").modal("hide");
        var tmp = $("#ChooseSubjectDialog").find("input[name='subject']:checked");
        if(tmp){
        	curSubject.id = $(tmp).data("id");
        	curSubject.name = $(tmp).parent().text();
            if(isEdit==0){
                $("#addTextbookDialog").find("[name='textbookSubject']").val(curSubject.name);
            }else{
                $("#editTextbookDialog").find("[name='textbookSubject']").val(curSubject.name);
            }
            //console.log("Subjectid:"+curSubject.id+", Subjectname:"+curSubject.name);
        }
    });
    
    $("#ChooseGradeBtn").on("click",function(){
        $("#ChooseGradeDialog").modal("hide");
        var tmp = $("#ChooseGradeDialog").find("input[name='grade']:checked");
        if(tmp){
            curGrade.id = $(tmp).data("id");
            curGrade.name = $(tmp).parent().text();
            if(isEdit==0){
                $("#addTextbookDialog").find("[name='textbookGrade']").val(curGrade.name);
            }else{
                $("#editTextbookDialog").find("[name='textbookGrade']").val(curGrade.name);
            }
            //console.log("Gradeid:"+curGrade.id+", Gradename:"+curGrade.name);
        }
    });
    
    $("#ChoosePublisherBtn").on("click",function(){
        $("#ChoosePublisherDialog").modal("hide");
        var tmp = $("#ChoosePublisherDialog").find("input[name='publisher']:checked");
        if(tmp){
        	curPublisher.id = $(tmp).data("id");
        	curPublisher.name = $(tmp).parent().text();
        	if(isEdit==0){
        	    $("#addTextbookDialog").find("[name='textbookPublisher']").val(curPublisher.name);
        	}else{
                $("#editTextbookDialog").find("[name='textbookPublisher']").val(curPublisher.name);
        	}
            //console.log("Publisherid:"+curPublisher.id+", Publishername:"+curPublisher.name);
        }
    });
    
    $("#content-page .pagination").on("click","li",function(){
        var page = $(this).data("page");
        if(page!=undefined)
        	getAllTextbook(page);
    });
});
</script>
</body>
</html>