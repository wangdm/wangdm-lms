
<!DOCTYPE html>
<html class="iframe-html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<#include "action-head.jsp">
<title></title>
</head>
<body>

<div class="lefttree">
    <c:import url="categorytree.jsp"></c:import>
</div>

  <div class="rightcontent"  >

         <!-- 分类列表-->
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="operationbar">
                    <div class="operation"><a href="#addCategoryDialog" data-toggle="modal"><img src="${contextPath}/assets/images/add.png"/><span>&nbsp;添加分类</span></a></div>
                </div>
            </div>
        </div>
            <table class="table table-bordered table-hover table-striped table-condensed"   id="categoryTable">
            <thead>
                 <tr >
                   <th class="text-center">分类名</th>
                   <th class="text-center">课程数目</th>
                   <th class="text-center">视频数目</th>
                   <th class="text-center">编辑</th>
                   <th class="text-center">删除</th>
                 </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <div id="NoDataWarning" class="alert alert-warning" role="alert" style="padding:5px 15px;text-align:center;display:none">
          <span>未查询到数据</span>
        </div><!-- 分类列表  end-->
        
         <!-- 属性列表-->
         <div class="panel panel-default" style="margin-top:50px">
            <div class="panel-body">
                <div class="operationbar">
                    <div class="operation"><a href="#addAttributeDialog" data-toggle="modal"><img src="${contextPath}/assets/images/add.png"/><span>&nbsp;添加属性</span></a></div>
                </div>
            </div>
        </div>
            <table class="table table-bordered table-hover table-striped table-condensed"  id="attributeTable">
            <thead>
                 <tr>
                   <th class="text-center">属性名</th>
                   <th class="text-center">属性值</th>
                   <th class="text-center" colspan="4">操作</th>
                
                 </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <div id="NoDataWarning" class="alert alert-warning" role="alert" style="padding:5px 15px;text-align:center;display:none">
          <span>未查询到数据</span>
        </div> <!-- 属性列表  end-->
    </div>

      <!-- 添加分类对话框 start-->
        <div class="modal fade" id="addCategoryDialog" tabindex="-1" role="dialog">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加分类</h4>
              </div>
              <div class="modal-body">
                  <form  class="form-horizontal" id="addCategoryForm" name="addCategoryForm">
                      <div class="form-group">
                        <label for="parentname" class="col-sm-3 control-label">父类目：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="parentname" readonly>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="catname" class="col-sm-3 control-label">分类名：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="catname">
                        </div>
                      </div>
                 </form>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary btn-sm" id="addCategoryBtn">确定</button>
              </div>
            </div>
          </div>
        </div> <!-- 添加分类对话框 end-->
    

    <!-- 添加属性对话框  start-->
    <div class="modal fade" id="addAttributeDialog" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">添加属性</h4>
          </div>
          <div class="modal-body">
              <form  class="form-horizontal"  id="addAttributeForm"  name="addAttributeForm">
                  <div class="form-group">
                    <label for="parentname" class="col-sm-3 control-label">所属类别：</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="catname" readonly>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="catname" class="col-sm-3 control-label">属性名：</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="attributename">
                    </div>
                  </div>
                   <div class="form-group">
                    <label for="catname" class="col-sm-3 control-label">属性值：</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="attributevalue">
                    </div>
                  </div>
             </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
            <button type="button" class="btn btn-primary btn-sm" id="addAttributeBtn">确定</button>
          </div>
        </div>
      </div>
    </div> <!-- 添加属性对话框  end-->
    

  <!-- 修改分类对话框 start-->
    <div class="modal fade" id="editCategoryDialog" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">重命名分类</h4>
          </div>
          <div class="modal-body">
              <form  class="form-horizontal" id="editCategoryForm" name="editCategoryForm">
                  <div class="form-group">
                    <label for="catname" class="col-sm-3 control-label">分类名：</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="catname">
                    </div>
                  </div>
             </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
            <button type="button" class="btn btn-primary btn-sm" id="editCategoryBtn">重命名</button>
          </div>
        </div>
      </div>
    </div>  <!-- 修改分类对话框end -->
    
    <!-- 修改属性名对话框 start-->
    <div class="modal fade" id="editAttributenameDialog" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">重命名属性名</h4>
          </div>
          <div class="modal-body">
              <form  class="form-horizontal" id="editAttributenameForm" name="editCategoryForm">
                  <div class="form-group">
                    <label for="catname" class="col-sm-3 control-label">属性名：</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="attributename">
                    </div>
                  </div>
             </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
            <button type="button" class="btn btn-primary btn-sm" id="editAttributenameBtn">重命名</button>
          </div>
        </div>
      </div>
    </div>  <!-- 修改属性名对话框end -->
    
    
      <!-- 修改属性值对话框 start-->
    <div class="modal fade" id="editAttributevalueDialog" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">修改属性值</h4>
          </div>
          <div class="modal-body">
              <form  class="form-horizontal" id="editAttributevalueForm" name="editAttributevalueForm">
                  
             </form>
               <div  id="addAttribute" style="width:120px;height:32px;background:#ccc;color:#000;margin:10px  auto;font-size:16px;text-align:center;line-height:32px;border-radius:5px;cursor:pointer">添加</div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
            <button type="button" class="btn btn-primary btn-sm" id="editAttributevalueBtn">修改</button>
          </div>
        </div>
      </div>
    </div>  <!-- 修改属性值对话框end -->
  
    
     <!-- 删除类别对话框  start-->
        <div class="modal fade" id="delCategoryDialog" tabindex="-1" role="dialog">
          <div class="modal-dialog modal-sm">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">删除分类</h4>
              </div>
              <div class="modal-body">
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary btn-sm" id="delCategoryBtn">删除</button>
              </div>
            </div>
          </div>
        </div>  <!-- 删除类别对话框  end-->
  
          <!-- 删除类别对话框  start-->
        <div class="modal fade" id="delAttributenameDialog" tabindex="-1" role="dialog">
          <div class="modal-dialog modal-sm">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">删除属性名</h4>
              </div>
              <div class="modal-body">
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary btn-sm" id="delAttributenameBtn">删除</button>
              </div>
            </div>
          </div>
        </div>  <!-- 删除类别对话框  end-->
        
            <!-- 删除类别对话框  start-->
        <div class="modal fade" id="delAttributevalueDialog" tabindex="-1" role="dialog">
          <div class="modal-dialog modal-sm">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">删除属性值</h4>
              </div>
              <div class="modal-body">
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary btn-sm" id="delAttributevalueBtn">删除</button>
              </div>
            </div>
          </div>
        </div>  <!-- 删除类别对话框  end-->
<script>
var parentId = 1;
$(function(){
    getDirectChildrenCategory(parentId);
    $(".lefttree").on("click",".node",function(){
        parentId=$(this).attr("data-id");
        var parentname=$(this).text();
        $("#addCategoryForm").find("[name='parentname']").val(parentname);
        $("#addAttributeForm").find("[name='catname']").val(parentname);
        getDirectChildrenCategory(parentId);
        getAttributeByCategory(parentId);
    });
    
    //编辑属性值时动态添加输入框
    var attributeHtml="<div class=\"form-group\">"
    +"<label for=\"catname\" class=\"col-sm-3 control-label\">属性值：</label>"
    +"<div class=\"col-sm-7\">"
    +" <input type=\"text\" class=\"form-control\" name=\"attributevalue\"  id=\"uuid\">"
    +" </div><span class=\"delAttri\" id=\"uuid\" style=\"line-height:32px;color:red;cursor:pointer\">删除</span>"
    +"</div>"
    
    $("#addAttribute").on("click",function(){
        $(attributeHtml).appendTo($("#editAttributevalueForm"));
    });
    
    //动态绑定单击事件(click)
     $("form").on("click","span",function(){
         var attrId=$(this).attr("id");
         if(attrId!="uuid"){
             deleteAttrivalue(attrId);	 
         }
         $(this).parent().remove();
    });
    
    
    function getAttributeByCategory(id){
        $.ajax({
               "url": sdkPath+"/category/findAttrById",
               "type": "post",
               "data":{
                  "categoryId":id,
               },
               datatype:"json",
          }).success(function(data){
                  var categorys=data.categorys;
                  var items=data.itemlist;
                  var tablestr='';
                  for(var i=0;i<categorys.length;i++){
                      tablestr += "<tr data-id=\""
                            + categorys[i].attriId
                            + "\">"
                            + "  <td>"
                            + categorys[i].attriName
                            + "</td>"
                            + "  <td id=\""+categorys[i].attriId+"\"></td>"
                            + " <td><button style=\"margin-left:1%;padding:4px  6px;\"    type=\"button\" class=\"btn btn-default btn-sm\" data-toggle=\"modal\" data-target=\"#editAttributenameDialog\">编辑属性</button>"
                            + " <button style=\"margin-left:1%;padding:4px  6px;\"    type=\"button\" class=\"btn btn-danger btn-sm\" data-toggle=\"modal\" data-target=\"#delAttributenameDialog\">删除属性</button>"
                            + " <button style=\"margin-left:1%;padding:4px  4px;\"    type=\"button\" class=\"btn btn-default btn-sm\" data-toggle=\"modal\" data-target=\"#editAttributevalueDialog\">编辑属性值</button>"
                            + " <button style=\"margin-left:1%;padding:4px  4px;\"    type=\"button\" class=\"btn btn-danger btn-sm\" data-toggle=\"modal\" data-target=\"#delAttributevalueDialog\">删除属性值</button></td>"
                            + "</tr>";
                }
                  $("#attributeTable").find("tbody").html("");
                  $("#attributeTable").find("tbody").html(tablestr);  
                  for(var i=0;i<categorys.length;i++){
                      for(var j=0;j<items.length;j++){
                         if(items[j].attributenameId==categorys[i].attriId){
                            var id= $("#"+categorys[i].attriId+"").attr("id");
                             $("#attributeTable td#"+categorys[i].attriId+"").append("<input  name=\"attributevalue\"  type=\"checkbox\"  id=\""+items[j].id+"\"  value=\""+items[j].id+"\"><span style=\"margin-right:10px;line-height:20px;\">"+items[j].value+"</span>");
                         }
                     }
                 } 
        }).fail(function() {
            console.log("connect " + this.url + " failed!");
        });
    }
    
   /////////////////////////////////////////////////////////////
   /////////////////////////////////////////////////////////////

   //显示编辑分类模态窗
    $('#editCategoryDialog').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var tr = $(button).parentsUntil("tbody").filter("tr");
        var id = tr.data('id');
        var name = $(tr).children("td:first").text();
        $(this).find("[name='catname']").val(name);
        $(this).find('#editCategoryBtn').attr("data-id",id);
    })
    
    //删除分类模态框
    $('#delCategoryDialog').on('show.bs.modal', function (event) {
          var button = $(event.relatedTarget)
          var tr = $(button).parentsUntil("tbody").filter("tr");
          var id = tr.data('id');
          var name = $(tr).children("td:first").text();
          $(this).find('.modal-body').text("是否删除  \""+name+"\" 分类?");
          $(this).find('#delCategoryBtn').attr("data-id",id);
    });
    
    //编辑属性名模态窗
    $('#editAttributenameDialog').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var tr = $(button).parentsUntil("tbody").filter("tr");
        var id = tr.data('id');
        var name = $(tr).children("td:first").text();
        $(this).find("[name='attributename']").val(name);
        $(this).find('#editAttributenameBtn').attr("data-id",id);
    })
    
    //删除属性名模态窗 
    $('#delAttributenameDialog').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var tr = $(button).parentsUntil("tbody").filter("tr");
        var id = tr.data('id');
        var name = $(tr).children("td:first").text();
        $(this).find('.modal-body').text("是否删除  \""+name+"\"属性?");
        $(this).find('#delAttributenameBtn').attr("data-id",id);
    });
      
    //编辑属性值模态窗
    $('#editAttributevalueDialog').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var tr = $(button).parentsUntil("tbody").filter("tr");
        var targetTd = $(tr).children("td:nth-child(2)");
        $("#editAttributevalueBtn").attr("data-targetId",$(targetTd).attr("id"));;
        var checkboxLength=$(targetTd).find("input[name='attributevalue']").length;
        var   attrivalues=new Array();
        var   attrIds=new Array();
        for(var i=0;i<checkboxLength;i++){
            attrivalues.push($(targetTd).find("span").eq(i).text()); 
            attrIds.push($(targetTd).find("input[name='attributevalue']").eq(i).val());
        }
        var attributeHtml="";
        for(var i=0;i<checkboxLength;i++){
            attributeHtml+="<div class=\"form-group\">"
                       +"<label for=\"name\" class=\"col-sm-3 control-label\">属性值：</label>"
                       +"<div class=\"col-sm-7\">"
                       +" <input type=\"text\" id=\""+attrIds[i]+"\"   value=\""+attrivalues[i]+"\"   class=\"form-control\" name=\"attributevalue\">"
                       +" </div><span class=\"delAttri\"  id=\""+attrIds[i]+"\"  style=\"line-height:32px;color:red;cursor:pointer\">删除</span>"
                       +"</div>";
        }
        $("#editAttributevalueForm").html("");
        $(attributeHtml).appendTo($("#editAttributevalueForm")); 
    })

    //删除属性值模态窗 
    $('#delAttributevalueDialog').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var tr = $(button).parentsUntil("tbody").filter("tr");
        var id = tr.data('id');
        var attrs = $(tr).find("input[name='attributevalue']:checked");
        if(attrs.length==0){
            $(this).find('.modal-body').text("您没有勾选任何属性值!");
            $('#delAttributevalueBtn').prop("disabled",true);
            return;
        }else{
            $(this).find('.modal-body').text("确认删去所选的属性值");
            $('#delAttributevalueBtn').prop("disabled",false);
            $(this).find('#delAttributevalueBtn').attr("data-id",id);
        }
    });
    
    //////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////
    
    //添加分类操作
    $("#addCategoryBtn").on("click",function(){
        var name = $("#addCategoryForm").find("[name='catname']").val();
        $.ajax({
            "url": sdkPath+"/categorys",
            "type": "POST",
            "data": JSON.stringify({"catName":name,"parentId":parentId}),
            "dataType":"json",      
            "contentType":"application/json",
        }).success(function(data){
            $("#addCategoryDialog").modal("hide");
            $("#addCategoryForm").find("[name='catname']").val("");
            createCategoryTree($(".categorytree"));
            getDirectChildrenCategory(parentId);
        }).fail(function(){
            console.log("connect "+this.url+" failed!");
            return null;
        });
    });
    
    //编辑分类操作
    $("#editCategoryBtn").on("click",function(){
        name = $("#editCategoryForm").find("[name='catname']").val();
        var catId = $(this).attr("data-id");
        $.ajax({
            "url":sdkPath+"/categorys/"+catId,
            "type": "PUT",
            "data": JSON.stringify({"catId":catId,"catName":name}),
            "dataType":"json",      
            "contentType":"application/json",
        }).success(function(data){
            $("#editCategoryDialog").modal("hide");
            createCategoryTree($(".categorytree"));
            getDirectChildrenCategory(parentId);
        }).fail(function(){
            console.log("connect "+this.url+" failed!");
            return null;
        });
    });
    
    //删除分类操作
    $("#delCategoryBtn").on("click",function(){
        var catId = $(this).attr("data-id");
        $.ajax({
            "url": sdkPath+"/categorys/"+catId,
            "type": "DELETE",
            "dataType":"json",      
            "contentType":"application/json",    
        }).success(function(data){
            $("#delCategoryDialog").modal("hide");
            createCategoryTree($(".categorytree"));
            getDirectChildrenCategory(parentId);
        }).fail(function(){
            console.log("connect "+this.url+" failed!");
            return null;
        });
    });
    
    //添加属性操作
    $("#addAttributeBtn").on("click",function(){
        var  attributename=$("#addAttributeForm").find("[name='attributename']").val();
        var  attributevalues=$("#addAttributeForm").find("[name='attributevalue']").val();
         $.ajax({
             "url": sdkPath+"/attributes",
             "type": "POST",
             "data": JSON.stringify({"catId":parentId,"attributename":attributename,"attributevalues":attributevalues}),
             "dataType":"json",      
             "contentType":"application/json",
         }).success(function(data){
             $("#addAttributeDialog").modal("hide");
             $("#addAttributeForm").find("[name='catname']").val("")
             $("#addAttributeForm").find("[name='attributename']").val("")
             $("#addAttributeForm").find("[name='attributevalue']").val("");
             createCategoryTree($(".categorytree"));
             getAttributeByCategory(parentId);
         }).fail(function(){
             console.log("connect "+this.url+" failed!");
             return null;
         });
     });
   
    //编辑属性名操作
    $("#editAttributenameBtn").on("click",function(){
        name = $("#editAttributenameForm").find("[name='attributename']").val();
        var attriId = $(this).attr("data-id");
        $.ajax({
            "url":sdkPath+"/attributename",
            "type": "PUT",
            "data": JSON.stringify({"attriId":attriId,"attriName":name}),
            "dataType":"json",      
            "contentType":"application/json",
        }).success(function(data){
            $("#editAttributenameDialog").modal("hide");
            createCategoryTree($(".categorytree"));
            getAttributeByCategory(parentId);
        }).fail(function(){
            console.log("connect "+this.url+" failed!");
            return null;
        });
    });
    
    //删除属性名操作
    $("#delAttributenameBtn").on("click",function(){
        var attriId = $(this).attr("data-id");
        $.ajax({
            "url": sdkPath+"/attrcondition/"+attriId,
            "type": "GET",
            "dataType":"json",      
            "contentType":"application/json",    
        }).success(function(data){
                //这里应做出判断提示 data.listsize>0
                   $.ajax({
                   "url": sdkPath+"/attributename",
                   "type": "DELETE",
                   "data": JSON.stringify({"attriId":attriId}),
                   "dataType":"json",      
                   "contentType":"application/json",    
               }).success(function(data){
                   $("#delAttributenameDialog").modal("hide");
                   createCategoryTree($(".categorytree"));
                   getAttributeByCategory(parentId);
               }).fail(function(){
                   console.log("connect "+this.url+" failed!");
                   return null;
               }); 
        }).fail(function(){
            console.log("connect "+this.url+" failed!");
            return null;
        });
    });
    
    //编辑属性值操作
    $("#editAttributevalueBtn").on("click",function(){
        var  attributeNameId = $(this).attr("data-targetId");
        var attrbuteNodes=$("#editAttributevalueForm").find("[name='attributevalue']");
        var attrbute=new Object();
        attrbute.attrIds=new Array();
        attrbute.attributes=new Array();
        attrbute.attributenameId=attributeNameId;
        for(var i=0;i<attrbuteNodes.length;i++){
            attrbute.attrIds.push(attrbuteNodes[i].id);
            attrbute.attributes.push(attrbuteNodes[i].value);
        }
        $.ajax({
            "url": sdkPath+"/attributevalue",
            "type": "PUT",
            "data": JSON.stringify(attrbute),
            "dataType":"json",      
            "contentType":"application/json",    
        }).success(function(data){
            $("#editAttributevalueDialog").modal("hide");
            createCategoryTree($(".categorytree"));
            getAttributeByCategory(parentId);
        }).fail(function(){
            console.log("connect "+this.url+" failed!");
            return null;
        });
    });
    
    //编辑属性值操作
    $("#delAttributevalueBtn").on("click",function(){
        var id = $(this).data('id');
        var attrs = $("tr[data-id='"+id+"']").find("input[name='attributevalue']:checked");
        var attributeValue=new Object();
        attributeValue.attrvalues=new Array();
        for(var i=0;i<attrs.length;i++){
               if(attrs[i].checked==true){
                   attributeValue.attrvalues.push(attrs[i].value);
               }
            }
        $.ajax({
            "url": sdkPath+"/attributevalue",
            "type": "DELETE",
            "data": JSON.stringify(attributeValue),
            "dataType":"json",      
            "contentType":"application/json",
        }).success(function(data){
            $("#delAttributevalueDialog").modal("hide");
            $("#addAttributevalueForm").find("[name='catname']").val("")
            createCategoryTree($(".categorytree"));
            getAttributeByCategory(parentId);
        }).fail(function(){
            console.log("connect "+this.url+" failed!");
            return null;
        });
    });
    
     function deleteAttrivalue(id){
    	 var attributeValue=new Object();
         attributeValue.attrvalues=new Array();
         attributeValue.attrvalues.push(id);
    	   $.ajax({
               "url": sdkPath+"/attributevalue",
               "type": "DELETE",
               "data": JSON.stringify(attributeValue),
               "dataType":"json",      
               "contentType":"application/json",
           }).success(function(data){
               createCategoryTree($(".categorytree"));
           }).fail(function(){
               console.log("connect "+this.url+" failed!");
               return null;
           });
    }
    
});
</script>
</body>
</html>