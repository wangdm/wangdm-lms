
<!DOCTYPE html>
<html class="iframe-html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<#include "action-head.jsp">
<title></title>
</head>
<body>

<div class="lefttree">
    <#include "categorytree.jsp">
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
  
    <!-- 删除属性名对话框  start-->
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
    </div>  <!-- 删除属性名对话框  end-->
    
    
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
    

    <!-- 添加属性值对话框  start-->
    <div class="modal fade" id="addAttributevalueDialog" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">添加属性值</h4>
          </div>
          <div class="modal-body">
              <form  class="form-horizontal"  id="addAttributevalueForm"  name="addAttributevalueForm">
                  <div class="form-group">
                    <label for="catname" class="col-sm-3 control-label">属性名：</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" name="attributename" readonly>
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
            <button type="button" class="btn btn-primary btn-sm" id="addAttributevalueBtn">确定</button>
          </div>
        </div>
      </div>
    </div> <!-- 添加属性值对话框  end-->
    
        
    <!-- 删除属性值对话框  start-->
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
    </div>  <!-- 删除属性值对话框  end-->
        
<script>
var currentCategory = {id:"1"};
var parentId = 1;
$(function(){
    getCategoryChildren(currentCategory.id);
    $(".lefttree").on("click",".node",function(){
        parentId=$(this).attr("data-id");
        var parentname=$(this).text();
        currentCategory.id = $(this).data("id");
        currentCategory.name = $(this).text();
        $("#addCategoryForm").find("[name='parentname']").val(currentCategory.name);
        $("#addCategoryForm").find("[name='parentname']").data("parentId", currentCategory.id);
        $("#addAttributeForm").find("[name='catname']").val(currentCategory.name);
        $("#addAttributeForm").find("[name='catname']").data("parentId", currentCategory.id);
        getCategoryChildren(currentCategory.id);
        getCategoryAttribute(currentCategory.id);
    });
    
    
   /////////////////////////////////////////////////////////////
   /////////////////////////////////////////////////////////////

   //显示编辑分类模态窗
    $('#editCategoryDialog').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var tr = $(button).parentsUntil("tbody").filter("tr");
        var index = tr.data('index');
        var category = currentCategory.children[index];
        $(this).find("[name='catname']").val(category.name);
        $(this).find('#editCategoryBtn').data("id",category.id);
    })
    
    //删除分类模态框
    $('#delCategoryDialog').on('show.bs.modal', function (event) {
          var button = $(event.relatedTarget)
          var tr = $(button).parentsUntil("tbody").filter("tr");
          var index = tr.data('index');
          var category = currentCategory.children[index];
          $(this).find('.modal-body').text("是否删除  \""+category.name+"\" 分类?");
          $(this).find('#delCategoryBtn').data("id",category.id);
    });
    
    //编辑属性名模态窗
    $('#editAttributenameDialog').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var tr = $(button).parentsUntil("tbody").filter("tr");
        var index = tr.data('index');
        var attribute = currentCategory.attributes[index];
        $(this).find("[name='attributename']").val(attribute.name);
        $(this).find('#editAttributenameBtn').data("id",attribute.id);
    })
    
    //删除属性名模态窗 
    $('#delAttributenameDialog').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var tr = $(button).parentsUntil("tbody").filter("tr");
        var index = tr.data('index');
        var attribute = currentCategory.attributes[index];
        $(this).find('.modal-body').text("是否删除  \""+attribute.name+"\"属性?");
        $(this).find('#delAttributenameBtn').data("id",attribute.id);
    });

    //添加属性值模态窗 
    $('#addAttributevalueDialog').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var tr = $(button).parentsUntil("tbody").filter("tr");
        var index = tr.data('index');
        var attribute = currentCategory.attributes[index];
        $(this).find("[name='attributename']").val(attribute.name);
        $(this).find('#addAttributevalueBtn').data("id",attribute.id);
    });

    //删除属性值模态窗 
    $('#delAttributevalueDialog').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var tr = $(button).parentsUntil("tbody").filter("tr");
        var index = tr.data('index');
        var attribute = currentCategory.attributes[index];
        var attrs = $(tr).find(":checked");
        if(attrs.length==0){
            $(this).find('.modal-body').text("您没有勾选任何属性值!");
            $('#delAttributevalueBtn').prop("disabled",true);
            return;
        }else{
            $(this).find('.modal-body').text("确认删去所选的属性值");
            $('#delAttributevalueBtn').prop("disabled",false);
            $(this).find('#delAttributevalueBtn').data("id",attribute.id);
        }
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
    
    //////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////
    
    //添加分类操作
    $("#addCategoryBtn").on("click",function(){
        var category = {};
        category.name = $("#addCategoryForm").find("[name='catname']").val();
        category.parentId = currentCategory.id;
        addCategory(category);
    });
    
    //编辑分类操作
    $("#editCategoryBtn").on("click",function(){
        var category = {};
        category.id = $(this).data("id");
        category.name = $("#editCategoryForm").find("[name='catname']").val();
        editCategory(category);
    });
    
    //删除分类操作
    $("#delCategoryBtn").on("click",function(){
        var catId = $(this).data("id");
        delCategory(catId);
    });
    
    //添加属性操作
    $("#addAttributeBtn").on("click",function(){
        var valueStr = $("#addAttributeForm").find("[name='attributevalue']").val();
        var valueArray = valueStr.split(/,|，/);
        var attribute = {};
        attribute.name = $("#addAttributeForm").find("[name='attributename']").val();
        attribute.categoryId = currentCategory.id;
        attribute.values = [];
        for(var i=0; i<valueArray.length; i++){
            var str = $.trim(valueArray[i]);
            if(str.length>0){
                var value = {};
                value.value = str;
                attribute.values.push(value);
            }
        }
        addAttribute(attribute);
     });
   
    //编辑属性名操作
    $("#editAttributenameBtn").on("click",function(){
        var attribute = {};
        attribute.id = $(this).data("id");
        attribute.name = $("#editAttributenameForm").find("[name='attributename']").val();
        editAttribute(attribute);
    });
    
    //删除属性名操作
    $("#delAttributenameBtn").on("click",function(){
        var attriId = $(this).data("id");
        delAttribute(attriId);
    });
    
    //添加属性名操作
    $("#addAttributevalueBtn").on("click",function(){
        var attriId = $(this).data("id");
        
        var valueStr = $("#addAttributevalueForm").find("[name='attributevalue']").val();
        var valueArray = valueStr.split(/,|，/);
        var values = [];
        for(var i=0; i<valueArray.length; i++){
            var str = $.trim(valueArray[i]);
            if(str.length>0){
                values.push(str);
            }
        }
        if(values.length>0){
            addAttributeValue(attriId, values);
        }
        $("#addAttributevalueDialog").modal("hide");
    });
    
    //删除属性值操作
    $("#delAttributevalueBtn").on("click",function(){
        var id = $(this).data('id');
        var attrs = $("#attributeTable tr[data-id='"+id+"']").find(":checked");
        var valueIds = [];
        for(var i=0;i<attrs.length;i++){
            valueIds.push($(attrs[i]).data("id"));
        }
        delAttributeValue(id, valueIds);
    });
    
    //编辑属性值操作
    $("#editAttributevalueBtn").on("click",function(){
    });
    
});
</script>
</body>
</html>