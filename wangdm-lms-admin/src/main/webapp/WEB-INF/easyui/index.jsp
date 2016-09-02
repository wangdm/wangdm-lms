<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Complex Layout - jQuery EasyUI Demo</title>
	<#include "head.jsp">
</head>
<body class="easyui-layout">
        <div data-options="region:'north'" style="height:50px"></div>
        <div data-options="region:'south',split:false" style="height:30px;"></div>
        <div data-options="region:'east',split:true" title="East" style="width:180px;">
            <ul class="easyui-tree" data-options="url:'tree_data1.json',method:'get',animate:true,dnd:true"></ul>
        </div>
        <div data-options="region:'west',split:true" title="West" style="width:180px;">
            <div class="easyui-accordion" data-options="fit:true,border:false">
                <#list memulist as memu >
                <div title="${memu.name}" style="padding:10px;">
                    content1
                </div>
                </#list>
            </div>
        </div>
        <div data-options="region:'center'">
            <div class="easyui-tabs" data-options="fit:true,border:false,plain:true">
                <div title="About" data-options="href:'_content.html'" style="padding:10px"></div>
                <div title="DataGrid" style="padding:5px">
                    <table class="easyui-datagrid"
                            data-options="url:'datagrid_data1.json',method:'get',singleSelect:true,fit:true,fitColumns:true">
                        <thead>
                            <tr>
                                <th data-options="field:'itemid'" width="80">Item ID</th>
                                <th data-options="field:'productid'" width="100">Product ID</th>
                                <th data-options="field:'listprice',align:'right'" width="80">List Price</th>
                                <th data-options="field:'unitcost',align:'right'" width="80">Unit Cost</th>
                                <th data-options="field:'attr1'" width="150">Attribute</th>
                                <th data-options="field:'status',align:'center'" width="50">Status</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
</body>
</html>