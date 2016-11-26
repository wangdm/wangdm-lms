$(function()
{
    resizeContent();
    $(window).resize(function()
    {
        resizeContent();
    });
});

function resizeContent()
{

    var bodyWidth = $(window).width() - parseInt($(".lefttree").css("width"));

    $(".rightcontent").css("width", bodyWidth);
    $(".rightcontent").css("max-width", bodyWidth);

}
// ////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////

function showMessageBox(message, timeout, level)
{
    $("#MessageBox").find('.modal-body').html("<span>" + message + "</span>");
    $("#MessageBox").modal("show");
    setTimeout(function()
    {
        $("#MessageBox").modal("hide");
    }, timeout);
}

function createPagination(currentPage, totalPage)
{
    if (totalPage < 1)
        return;
    if (currentPage == 1)
    {
        var pageStr = "<li class=\"disabled\"><a><span>首页</span></a></li>";
        pageStr += "<li class=\"disabled\"><a><span>上一页</span></a></li>";
    } else
    {
        var pageStr = "<li data-page=\"1\"><a><span>首页</span></a></li>";
        pageStr += "<li data-page=\"" + (currentPage - 1)
                + "\"><a><span>上一页</span></a></li>";
    }
    for (var i = 1; i < totalPage+1; i++)
    {
        if (currentPage == i)
        {
            pageStr += "<li data-page=\"" + i + "\" class=\"active\"><a><span>"
                    + i + "</span></a></li>";
        } else
        {
            pageStr += "<li data-page=\"" + i + "\"><a><span>" + i
                    + "</span></a></li>";
        }
    }
    if (currentPage == (totalPage))
    {
        pageStr += "<li class=\"disabled\"><a><span>下一页</span></a></li>";
        pageStr += "<li class=\"disabled\"><a><span>尾页</span></a></li>";
    } else
    {
        pageStr += "<li data-page=\"" + (currentPage + 1)
                + "\"><a><span>下一页</span></a></li>"
        pageStr += "<li data-page=\"" + (totalPage)
                + "\"><a><span>尾页</span></a></li>";
    }
    $("#content-page .pagination").html(pageStr);
}


///////////////////////////////////////////////////////////////////////////////
/// 导航菜单
///////////////////////////////////////////////////////////////////////////////

function addMenu(menu)
{
 $.ajax({
     "url" : sdkPath + "/menus",
     "type" : "POST",
     "data" : JSON.stringify(menu),
     "dataType" : "json",
     "contentType" : "application/json",
 }).success(function(data)
 {
     $("#addMenuDialog").modal("hide");
     getAllMenu(0);
 }).fail(function()
 {
     console.log("connect " + this.url + " failed!");
 });
}

function editMenu(menu)
{
 $.ajax({
     "url" : sdkPath + "/menus/" + menu.id,
     "type" : "PUT",
     "data" : JSON.stringify(menu),
     "dataType" : "json",
     "contentType" : "application/json",
 }).success(function(data)
 {
     $("#editMenuDialog").modal("hide");
     getAllMenu(0);
 }).fail(function()
 {
     console.log("connect " + this.url + " failed!");
 });
}

function delMenu(menuId)
{
 $.ajax({
     "url" : sdkPath + "/menus/" + menuId,
     "type" : "DELETE",
     "dataType" : "json",
     "contentType" : "application/json",
 }).success(function(data)
 {
     $("#delMenuDialog").modal("hide");
     // getAllMenu(0);
 }).fail(function()
 {
     console.log("connect " + this.url + " failed!");
 });
}

function getAllMenu(page)
{
 $.ajax({
     "url" : sdkPath + "/menus/?page=" + page,
     "type" : "GET",
     "dataType" : "json",
     "contentType" : "application/json",
 }).success(function(data)
 {
     if (data.data && data.data.length)
         $("#NoDataWarning").hide();
     else
         $("#NoDataWarning").show();
     menuList = data.data;
     createMenuTable(menuList);
     curPage = data.currentPage;
     createPagination(data.currentPage, data.totalPage);
 }).fail(function(data)
 {
     if (data.status == 200)
     {
         $("#NoDataWarning").show();
         if (data.responseText != "")
         {
             console.log(data.responseText);
         }
     } else
     {
         console.log(data);
         console.log("connect " + this.url + " failed!");
     }
 });
}

function createMenuTable(data)
{
 tablestr = "";
 if (data && data.length)
 {
     for (var i = 0; i < data.length; i++)
     {
         tablestr += "<tr data-index=\"" + i + "\" data-id=\"" + data[i].id
                 + "\">"
                 + "  <td><input type=\"checkbox\" name=\"menu\"></td>"
                 + "  <td>" + data[i].name + "</td>"
                 + "  <td>" + data[i].idx + "</td>"
                 + "  <td>" + data[i].icon + "</td>"
                 + "  <td>" + data[i].url + "</td>";
         if (data[i].display == "true")
         {
             tablestr += "  <td><input type=\"checkbox\" name=\"show\" data-index=\"" + i + "\" checked></td>";
         } else
         {
             tablestr += "  <td><input type=\"checkbox\" name=\"show\" data-index=\"" + i + "\"></td>";
         }
         tablestr += "  <td style=\"width:120px\">"
                 + "    <div class=\"btn-group dropup\">"
                 + "      <button type=\"button\" class=\"btn btn-default btn-sm\" data-toggle=\"modal\" data-target=\"#editMenuDialog\">编辑</button>"
                 + "      <button type=\"button\" class=\"btn btn-default btn-sm dropdown-toggle\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">"
                 + "        <span class=\"caret\"></span>"
                 + "      </button>"
                 + "      <ul class=\"dropdown-menu\" style=\"min-width:0px\">"
                 + "        <li><a href=\"#delMenuDialog\" data-toggle=\"modal\">删除</a></li>"
                 + "      </ul>" + "    </div>" + "  </td>" + "</tr>";
     }
 }
 $(".table tbody").html(tablestr);
}

///////////////////////////////////////////////////////////////////////////////
/// 友情链接
///////////////////////////////////////////////////////////////////////////////

function addBlogRoll(blogroll)
{
 $.ajax({
     "url" : sdkPath + "/blogrolls",
     "type" : "POST",
     "data" : JSON.stringify(blogroll),
     "dataType" : "json",
     "contentType" : "application/json",
 }).success(function(data)
 {
     $("#addBlogRollDialog").modal("hide");
     getAllBlogRoll(0);
 }).fail(function()
 {
     console.log("connect " + this.url + " failed!");
 });
}

function editBlogRoll(blogroll)
{
 $.ajax({
     "url" : sdkPath + "/blogrolls/" + blogroll.id,
     "type" : "PUT",
     "data" : JSON.stringify(blogroll),
     "dataType" : "json",
     "contentType" : "application/json",
 }).success(function(data)
 {
     $("#editBlogRollDialog").modal("hide");
     getAllBlogRoll(0);
 }).fail(function()
 {
     console.log("connect " + this.url + " failed!");
 });
}

function delBlogRoll(blogrollId)
{
 $.ajax({
     "url" : sdkPath + "/blogrolls/" + blogrollId,
     "type" : "DELETE",
     "dataType" : "json",
     "contentType" : "application/json",
 }).success(function(data)
 {
     $("#delBlogRollDialog").modal("hide");
     // getAllBlogRoll(0);
 }).fail(function()
 {
     console.log("connect " + this.url + " failed!");
 });
}

function getAllBlogRoll(page)
{
 $.ajax({
     "url" : sdkPath + "/blogrolls/?page=" + page,
     "type" : "GET",
     "dataType" : "json",
     "contentType" : "application/json",
 }).success(function(data)
 {
     if (data.data && data.data.length)
         $("#NoDataWarning").hide();
     else
         $("#NoDataWarning").show();
     blogrollList = data.data;
     createBlogRollTable(blogrollList);
     curPage = data.currentPage;
     createPagination(data.currentPage, data.totalPage);
 }).fail(function(data)
 {
     if (data.status == 200)
     {
         $("#NoDataWarning").show();
         if (data.responseText != "")
         {
             console.log(data.responseText);
         }
     } else
     {
         console.log(data);
         console.log("connect " + this.url + " failed!");
     }
 });
}

function createBlogRollTable(data)
{
 tablestr = "";
 if (data && data.length)
 {
     for (var i = 0; i < data.length; i++)
     {
         tablestr += "<tr data-index=\"" + i + "\" data-id=\"" + data[i].id
                 + "\">"
                 + "  <td><input type=\"checkbox\" name=\"blogroll\"></td>"
                 + "  <td>" + data[i].title + "</td>"
                 + "  <td>" + data[i].idx + "</td>"
                 + "  <td>" + data[i].image + "</td>"
                 + "  <td>" + data[i].url + "</td>";
         if (data[i].display == "true")
         {
             tablestr += "  <td><input type=\"checkbox\" name=\"show\" data-index=\"" + i + "\" checked></td>";
         } else
         {
             tablestr += "  <td><input type=\"checkbox\" name=\"show\" data-index=\"" + i + "\"></td>";
         }
         tablestr += "  <td style=\"width:120px\">"
                 + "    <div class=\"btn-group dropup\">"
                 + "      <button type=\"button\" class=\"btn btn-default btn-sm\" data-toggle=\"modal\" data-target=\"#editBlogRollDialog\">编辑</button>"
                 + "      <button type=\"button\" class=\"btn btn-default btn-sm dropdown-toggle\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">"
                 + "        <span class=\"caret\"></span>"
                 + "      </button>"
                 + "      <ul class=\"dropdown-menu\" style=\"min-width:0px\">"
                 + "        <li><a href=\"#delBlogRollDialog\" data-toggle=\"modal\">删除</a></li>"
                 + "      </ul>" + "    </div>" + "  </td>" + "</tr>";
     }
 }
 $(".table tbody").html(tablestr);
}

// /////////////////////////////////////////////////////////////////////////////
// / 热点
// /////////////////////////////////////////////////////////////////////////////

function addHotspot(hotspot)
{
    $.ajax({
        "url" : sdkPath + "/hotspots",
        "type" : "POST",
        "data" : JSON.stringify(hotspot),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#addHotspotDialog").modal("hide");
        getAllHotspot(0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function editHotspot(hotspot)
{
    $.ajax({
        "url" : sdkPath + "/hotspots/" + hotspot.id,
        "type" : "PUT",
        "data" : JSON.stringify(hotspot),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#editHotspotDialog").modal("hide");
        getAllHotspot(0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function delHotspot(hotspotId)
{
    $.ajax({
        "url" : sdkPath + "/hotspots/" + hotspotId,
        "type" : "DELETE",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#delHotspotDialog").modal("hide");
        // getAllHotspot(0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function getAllHotspot(page)
{
    $.ajax({
        "url" : sdkPath + "/hotspots/?page=" + page,
        "type" : "GET",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        if (data.data && data.data.length)
            $("#NoDataWarning").hide();
        else
            $("#NoDataWarning").show();
        hotspotList = data.data;
        createHotspotTable(hotspotList);
        curPage = data.currentPage;
        createPagination(data.currentPage, data.totalPage);
    }).fail(function(data)
    {
        if (data.status == 200)
        {
            $("#NoDataWarning").show();
            if (data.responseText != "")
            {
                console.log(data.responseText);
            }
        } else
        {
            console.log(data);
            console.log("connect " + this.url + " failed!");
        }
    });
}

function createHotspotTable(data)
{
    tablestr = "";
    if (data && data.length)
    {
        for (var i = 0; i < data.length; i++)
        {
            tablestr += "<tr data-index=\"" + i + "\" data-id=\"" + data[i].id
                    + "\">"
                    + "  <td><input type=\"checkbox\" name=\"hotspot\"></td>"
                    + "  <td>" + data[i].idx + "</td>"
                    + "  <td>" + data[i].title + "</td>"
                    + "  <td>" + data[i].image + "</td>"
                    + "  <td>" + data[i].url + "</td>"
                    + "  <td>" + data[i].createTime + "</td>"
                    + "  <td>" + data[i].expireTime + "</td>";
            if (data[i].display == "true")
            {
                tablestr += "  <td><input type=\"checkbox\" name=\"show\" data-index=\"" + i + "\" checked></td>";
            } else
            {
                tablestr += "  <td><input type=\"checkbox\" name=\"show\" data-index=\"" + i + "\"></td>";
            }
            tablestr += "  <td>" + data[i].status + "</td>"
                    + "  <td style=\"width:120px\">"
                    + "    <div class=\"btn-group dropup\">"
                    + "      <button type=\"button\" class=\"btn btn-default btn-sm\" data-toggle=\"modal\" data-target=\"#editHotspotDialog\">编辑</button>"
                    + "      <button type=\"button\" class=\"btn btn-default btn-sm dropdown-toggle\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">"
                    + "        <span class=\"caret\"></span>"
                    + "      </button>"
                    + "      <ul class=\"dropdown-menu\" style=\"min-width:0px\">"
                    + "        <li><a href=\"#delHotspotDialog\" data-toggle=\"modal\">删除</a></li>"
                    + "      </ul>" + "    </div>" + "  </td>" + "</tr>";
        }
    }
    $(".table tbody").html(tablestr);
}

// /////////////////////////////////////////////////////////////////////////////
// / Group
// /////////////////////////////////////////////////////////////////////////////

function addGroup(name, parentId)
{
    $.ajax({
        "url" : sdkPath + "/groups",
        "type" : "POST",
        "data" : JSON.stringify({
            "parentId" : parentId,
            "name" : name,
            "desc" : ""
        }),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#addGroupDialog").modal("hide");
        createGroupTree($(".grouptree"));
        getDirectChildrenGroup(parentId);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
        return null;
    });
}

function editGroup(name, groupId)
{
    $.ajax({
        "url" : sdkPath + "/groups/" + groupId,
        "type" : "PUT",
        "data" : JSON.stringify({
            "id" : groupId,
            "name" : name
        }),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(
            function(data)
            {
                $("#editGroupDialog").modal("hide");
                createGroupTree($(".grouptree"));
                parentId = $("#addGroupForm").find("[name='parentname']").attr(
                        "data-parentid");
                getDirectChildrenGroup(parentId);
            }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
        return null;
    });
}

function delGroup(groupId)
{
    $.ajax({
        "url" : sdkPath + "/groups/" + groupId,
        "type" : "DELETE",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(
            function(data)
            {
                $("#delGroupDialog").modal("hide");
                createGroupTree($(".grouptree"));
                parentId = $("#addGroupForm").find("[name='parentname']").attr(
                        "data-parentid");
                getDirectChildrenGroup(parentId);
            }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
        return null;
    });
}

function getAllChildrenGroup(id, fn)
{
    $.ajax({
        "url" : sdkPath + "/allchildrengroups/" + id,
        "type" : "GET",
    }).success(function(data)
    {
        fn(data);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function createGroupTable(data)
{
    var tablestr = "";
    if (data)
    {
        for (var i = 0; i < data.length; i++)
        {
            tablestr += "<tr data-id=\""
                    + data[i].id
                    + "\">"
                    + "  <td>"
                    + data[i].name
                    + "</td>"
                    + "  <td></td>"
                    + "  <td></td>"
                    + "  <td><button type=\"button\" class=\"btn btn-default btn-sm\" data-toggle=\"modal\" data-target=\"#editGroupDialog\">编辑</button></td>"
                    + "  <td><button type=\"button\" class=\"btn btn-danger btn-sm\" data-toggle=\"modal\" data-target=\"#delGroupDialog\">删除</button></td>"
                    + "</tr>";
        }
    }
    $(".table tbody").html(tablestr);
}

function getDirectChildrenGroup(id)
{
    $.ajax({
        "url" : sdkPath + "/directchildrengroups/" + id,
        "type" : "GET",
    }).success(function(data)
    {
        createGroupTable(data);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
        return null;
    });
}

function recursiveGroupTree(tree, pid, data)
{
    tree.add(data.id, pid, data.name);
    if (data.children && data.children.length > 0)
    {
        for (var i = 0; i < data.children.length; i++)
        {
            recursiveGroupTree(tree, data.id, data.children[i]);
        }
    }
}

function createGroupTree(node)
{

    $.ajax({
        "url" : sdkPath + "/allchildrengroups/" + 0,
        "type" : "GET",
    }).success(function(data)
    {
        d = new dTree('d');
        recursiveGroupTree(d, -1, data);
        node.html(d.toString());
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
        return null;
    });
}


// /////////////////////////////////////////////////////////////////////////////
// / Role
// /////////////////////////////////////////////////////////////////////////////

function addRole(role)
{
    $.ajax({
        "url" : sdkPath + "/roles",
        "type" : "POST",
        "data" : JSON.stringify(role),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#addRoleDialog").modal("hide");
        getAllRole(0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function editRole(role)
{
    $.ajax({
        "url" : sdkPath + "/roles/" + role.id,
        "type" : "PUT",
        "data" : JSON.stringify(role),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#editRoleDialog").modal("hide");
        getAllRole(0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function delRole(roleId)
{
    $.ajax({
        "url" : sdkPath + "/roles/" + roleId,
        "type" : "DELETE",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#delRoleDialog").modal("hide");
        getAllRole(0);
        console.log(roleId);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function getAllRole(page)
{
    $.ajax({
        "url" : sdkPath + "/roles/?page=" + page,
        "type" : "GET",
    }).success(function(data)
    {
        if (data.data && data.data.length)
            $("#NoDataWarning").hide();
        else
            $("#NoDataWarning").show();
        rolelist = data.data;
        createRoleTable(rolelist);
        curPage = data.currentPage;
        createPagination(data.currentPage, data.totalPage);
    }).fail(function(data)
    {
        if (data.status == 200)
        {
            $("#NoDataWarning").show();
            if (data.responseText != "")
            {
                console.log(data.responseText);
            }
        } else
        {
            console.log(data);
            console.log("connect " + this.url + " failed!");
        }
    });
}

function createRoleTable(data)
{
    tablestr = "";
    if (data && data.length)
    {
        for (var i = 0; i < data.length; i++)
        {
            tablestr += "<tr data-id=\""
                    + data[i].id
                    + "\" data-index=\""+i+"\">"
                    + "  <td>"
                    + data[i].title
                    + "</td>"
                    + "  <td>"
                    + data[i].name
                    + "</td>"
                    + "  <td>"
                    + data[i].desc
                    + "</td>"
                    + "  <td>"
                    + data[i].status
                    + "</td>"
                    + "  <td></td>"
                    + "  <td></td>"
                    + "  <td style=\"width:120px\">"
                    + "    <div class=\"btn-group dropup\">"
                    + "      <button type=\"button\" class=\"btn btn-default btn-sm\" data-toggle=\"modal\" data-target=\"#editRoleAuthorityDialog\">权限设置</button>"
                    + "      <button type=\"button\" class=\"btn btn-default btn-sm dropdown-toggle\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">"
                    + "        <span class=\"caret\"></span>"
                    + "      </button>"
                    + "      <ul class=\"dropdown-menu\" style=\"min-width:0px\">"
                    + "        <li><a href=\"#editRoleDialog\" data-toggle=\"modal\">重命名</a></li>";
            if (data[i].type == "USER")
            {
                tablestr += "   <li><a href=\"#delRoleDialog\" data-toggle=\"modal\">删除</a></li>"
            }
            tablestr += "      </ul>" + "    </div>" + "  </td>" + "</tr>";
        }
    }
    $(".table tbody").html(tablestr);
}

function getRolePermission(roleId)
{
    $.ajax({
        "url" : sdkPath + "/roles/" + roleId + "/permissions",
        "type" : "GET",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        permlist = data;
        for(perm in permlist){
            $("#editRoleAuthorityDialog input:checkbox[data-id="+permlist[perm].id+"]").attr("checked", true).prop("checked",true);
        }
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function setRolePermission(roleId, perms)
{
    $.ajax({
        "url" : sdkPath + "/roles/" + roleId + "/permissions",
        "type" : "PUT",
        "data" : JSON.stringify(perms),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#editRoleAuthorityDialog").modal("hide");
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}


///////////////////////////////////////////////////////////////////////////////
/// PermissionGroup
///////////////////////////////////////////////////////////////////////////////

function addPermissionGroup(permissiongroup)
{
 $.ajax({
     "url" : sdkPath + "/permissiongroups",
     "type" : "POST",
     "data" : JSON.stringify(permissiongroup),
     "dataType" : "json",
     "contentType" : "application/json",
 }).success(function(data)
 {
     $("#addPermissionGroupDialog").modal("hide");
     getAllPermissionGroup(0);
 }).fail(function()
 {
     console.log("connect " + this.url + " failed!");
 });
}

function editPermissionGroup(permissiongroup)
{
 $.ajax({
     "url" : sdkPath + "/permissiongroups/" + permissiongroup.id,
     "type" : "PUT",
     "data" : JSON.stringify(permissiongroup),
     "dataType" : "json",
     "contentType" : "application/json",
 }).success(function(data)
 {
     $("#editPermissionGroupDialog").modal("hide");
     getAllPermissionGroup(0);
 }).fail(function()
 {
     console.log("connect " + this.url + " failed!");
 });
}

function delPermissionGroup(permissiongroupId)
{
 $.ajax({
     "url" : sdkPath + "/permissiongroups/" + permissiongroupId,
     "type" : "DELETE",
     "dataType" : "json",
     "contentType" : "application/json",
 }).success(function(data)
 {
     $("#delPermissionGroupDialog").modal("hide");
     getAllPermissionGroup(0);
 }).fail(function()
 {
     console.log("connect " + this.url + " failed!");
 });
}

function getAllPermissionGroup(page)
{
 $.ajax({
     "url" : sdkPath + "/permissiongroups/?page=" + page,
     "type" : "GET",
 }).success(function(data)
 {
     if (data.data && data.data.length)
         $("#NoDataWarning").hide();
     else
         $("#NoDataWarning").show();
     permissiongrouplist = data.data;
     createPermissionGroupTable(permissiongrouplist);
     curPage = data.currentPage;
     createPagination(data.currentPage, data.totalPage);
 }).fail(function(data)
 {
     if (data.status == 200)
     {
         $("#NoDataWarning").show();
         if (data.responseText != "")
         {
             console.log(data.responseText);
         }
     } else
     {
         console.log(data);
         console.log("connect " + this.url + " failed!");
     }
 });
}

function createPermissionGroupTable(data)
{
 tablestr = "";
 if (data && data.length)
 {
     for (var i = 0; i < data.length; i++)
     {
         tablestr += "<tr data-id=\""
                 + data[i].id
                 + "\" data-index=\""+i+"\">"
                 + "  <td>"
                 + data[i].name
                 + "</td>"
                 + "  <td>"
                 + "      <button type=\"button\" class=\"btn btn-warning btn-xs\" data-toggle=\"modal\" data-target=\"#editPermissionGroupDialog\">修改</button>"
                 + "</td>"
                 + "  <td>"
                 + "      <button type=\"button\" class=\"btn btn-danger btn-xs\" data-toggle=\"modal\" data-target=\"#delPermissionGroupDialog\">删除</button>"
                 + "</td>"
                 + "</tr>";
     }
 }
 $("#grouptable.table tbody").html(tablestr);
}


///////////////////////////////////////////////////////////////////////////////
/// Permission
///////////////////////////////////////////////////////////////////////////////

function addPermission(permission)
{
    $.ajax({
        "url" : sdkPath + "/permissions",
        "type" : "POST",
        "data" : JSON.stringify(permission),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#addPermissionDialog").modal("hide");
        getAllPermission(curPermissionGroup.id);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function editPermission(permission)
{
 $.ajax({
     "url" : sdkPath + "/permissions/" + permission.id,
     "type" : "PUT",
     "data" : JSON.stringify(permission),
     "dataType" : "json",
     "contentType" : "application/json",
 }).success(function(data)
 {
     $("#editPermissionDialog").modal("hide");
     getAllPermission(curPermissionGroup.id);
 }).fail(function()
 {
     console.log("connect " + this.url + " failed!");
 });
}

function delPermission(permissionId)
{
 $.ajax({
     "url" : sdkPath + "/permissions/" + permissionId,
     "type" : "DELETE",
     "dataType" : "json",
     "contentType" : "application/json",
 }).success(function(data)
 {
     $("#delPermissionDialog").modal("hide");
     getAllPermission(curPermissionGroup.id);
 }).fail(function()
 {
     console.log("connect " + this.url + " failed!");
 });
}

function getAllPermission(groupId)
{
 $.ajax({
     "url" : sdkPath + "/permissions/?groupId=" + groupId,
     "type" : "GET",
 }).success(function(data)
 {
     if (data.data && data.data.length)
         $("#NoDataWarning").hide();
     else
         $("#NoDataWarning").show();
     permissionlist = data.data;
     createPermissionTable(permissionlist);
     curPage = data.currentPage;
     createPagination(data.currentPage, data.totalPage);
 }).fail(function(data)
 {
     if (data.status == 200)
     {
         $("#NoDataWarning").show();
         if (data.responseText != "")
         {
             console.log(data.responseText);
         }
     } else
     {
         console.log(data);
         console.log("connect " + this.url + " failed!");
     }
 });
}

function createPermissionTable(data)
{
 tablestr = "";
 if (data && data.length)
 {
     for (var i = 0; i < data.length; i++)
     {
         tablestr += "<tr data-id=\""
                 + data[i].id
                 + "\" data-index=\""+i+"\">"
                 + "  <td>"
                 + data[i].title
                 + "</td>"
                 + "  <td>"
                 + data[i].name
                 + "</td>"
                 + "  <td>"
                 + data[i].groupName
                 + "</td>"
                 + "  <td>"
                 + data[i].desc
                 + "</td>"
                 + "  <td>"
                 + "      <button type=\"button\" class=\"btn btn-warning btn-xs\" data-toggle=\"modal\" data-target=\"#editPermissionDialog\">修改</button>"
                 + "</td>"
                 + "  <td>"
                 + "      <button type=\"button\" class=\"btn btn-danger btn-xs\" data-toggle=\"modal\" data-target=\"#delPermissionDialog\">删除</button>"
                 + "</td>"
                 + "</tr>";
     }
 }
 $("#permissiontable.table tbody").html(tablestr);
}

// /////////////////////////////////////////////////////////////////////////////
// / User
// /////////////////////////////////////////////////////////////////////////////

function addUser(user)
{
    $.ajax({
        "url" : sdkPath + "/users",
        "type" : "POST",
        "data" : JSON.stringify(user),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#AddUserDialog").modal("hide");
        getAllUser(curGroup.id, queryRole, queryType, queryValue, 0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function editUserAccount(user)
{
    $.ajax({
        "url" : sdkPath + "/users/account/" + user.id,
        "type" : "PUT",
        "data" : JSON.stringify(user),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#EditUserAccountDialog").modal("hide");
        getAllUser(curGroup.id, queryRole, queryType, queryValue, 0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function editUserPassword(user)
{
    $.ajax({
        "url" : sdkPath + "/users/password/" + user.id,
        "type" : "PUT",
        "data" : JSON.stringify(user),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#EditUserPasswordDialog").modal("hide");
        getAllUser(curGroup.id, queryRole, queryType, queryValue, 0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function editUserProfile(user)
{
    $.ajax({
        "url" : sdkPath + "/users/profile/" + user.id,
        "type" : "PUT",
        "data" : JSON.stringify(user),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#EditUserProfileDialog").modal("hide");
        getAllUser(curGroup.id, queryRole, queryType, queryValue, 0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function editUserCredit(user)
{
    $.ajax({
        "url" : sdkPath + "/users/certification/" + user.id,
        "type" : "PUT",
        "data" : JSON.stringify(user),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#EditUserCreditDialog").modal("hide");
        getAllUser(curGroup.id, queryRole, queryType, queryValue, 0);
        console.log(data);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function delUser(id)
{
    $.ajax({
        "url" : sdkPath + "/users/" + id,
        "type" : "DELETE",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#DelUserDialog").modal("hide");
        getAllUser(curGroup.id, queryRole, queryType, queryValue, 0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function eraseUser(id)
{
    $.ajax({
        "url" : sdkPath + "/users/" + id +"/erase",
        "type" : "DELETE",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#EraseUserDialog").modal("hide");
        getAllUser(curGroup.id, queryRole, queryType, queryValue, 0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function restoreUser(id)
{
    $.ajax({
        "url" : sdkPath + "/users/" + id + "/restore",
        "type" : "PUT",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#RestoreUserDialog").modal("hide");
        getAllUser(curGroup.id, queryRole, queryType, queryValue, 0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function verifyUser(id)
{
    $.ajax({
        "url" : sdkPath + "/users/" + id + "/verify",
        "type" : "PUT",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#VerifyUserDialog").modal("hide");
        getAllUser(curGroup.id, queryRole, queryType, queryValue, 0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function forbiddenUser(id)
{
    $.ajax({
        "url" : sdkPath + "/users/" + id + "/forbidden",
        "type" : "PUT",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#ForbiddenUserDialog").modal("hide");
        getAllUser(curGroup.id, queryRole, queryType, queryValue, 0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function queryUser(querystr, fn)
{
    $.ajax({
        "url" : sdkPath + "/users/?query=" + querystr,
        "type" : "GET",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        fn(data);
    }).fail(function(data)
    {
        console.log(data);
        console.log("connect " + this.url + " failed!");
        $("tbody tr").remove();
    });
}

function queryTeacher(querystr, fn)
{
    $.ajax({
        "url" : sdkPath + "/teachers/?query=" + querystr,
        "type" : "GET",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        fn(data);
    }).fail(function(data)
    {
        console.log(data);
        console.log("connect " + this.url + " failed!");
        $("tbody tr").remove();
    });
}

function getAllUser(groupId, roleId, queryType, queryValue, page)
{
    rolestr = roleId.join("_");
    $.ajax({
                "url" : sdkPath + "/users/?gid=" + groupId + "&rid=" + rolestr
                        + "&" + queryType + "=" + queryValue + "&page=" + page,
                "type" : "GET",
                "dataType" : "json",
                "contentType" : "application/json",
    }).success(function(data)
    {
        if (data.data && data.data.length)
            $("#NoDataWarning").hide();
        else
            $("#NoDataWarning").show();
        userlist = data.data;
        createUserTable(userlist);
        curPage = data.currentPage;
        createPagination(data.currentPage, data.totalPage);
    }).fail(function(data)
    {
        if (data.status == 200)
        {
            $("#NoDataWarning").show();
            if (data.responseText != "")
            {
                console.log(data.responseText);
            }
        } else
        {
            console.log(data);
            console.log("connect " + this.url + " failed!");
        }
        $("tbody tr").remove();
    });
}

function getUserRoles(id)
{

    $.ajax({
                "url" : sdkPath + "/users/"+id+"/roles",
                "type" : "GET",
            }).success(function(data){
                for(role in data){
                    $("#EditUserRoleDialog input:checkbox[data-id="+data[role].id+"]").attr("checked", true).prop("checked",true);
                }
            }).fail(function(data){
                console.log("connect " + this.url + " failed!");
            });
}

function setUserRoles(id, roles)
{

    $.ajax({
                "url" : sdkPath + "/users/"+id+"/roles",
                "type" : "PUT",
                "data" : JSON.stringify(roles),
                "dataType" : "json",
                "contentType" : "application/json",
            }).success(function(data){
                getAllUser(curGroup.id, queryRole, queryType, queryValue, 0);
            }).fail(function(data){
                console.log("connect " + this.url + " failed!");
            });
}

function createUserTable(data)
{
    tablestr = "";
    if (data && data.length)
    {
        for (var i = 0; i < data.length; i++)
        {
            tablestr += "<tr data-index=\""
                    + i
                    + "\" data-id=\""
                    + data[i].uid
                    + "\">"
                    + "  <td>"
                    + data[i].username
                    + "</td>"
                    + "  <td>"
                    + data[i].nickname
                    + "</td>"
                    + "  <td>"
                    + data[i].email
                    + "</td>"
                    + "  <td>"
                    + data[i].phone
                    + "</td>"
                    + "  <td>"
                    + data[i].groupname
                    + "</td>"
                    + "  <td>"
                    + data[i].rolename
                    + "</td>"
                    + "  <td>"
                    + data[i].status
                    + "</td>"
                    + "  <td style=\"width:140px\">"
                    + "    <div class=\"btn-group dropup\">"
                    + "      <button type=\"button\" class=\"btn btn-default btn-sm\" data-toggle=\"modal\" data-target=\"#EditUserAccountDialog\">修改账户资料</button>"
                    + "      <button type=\"button\" class=\"btn btn-default btn-sm dropdown-toggle\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">"
                    + "        <span class=\"caret\"></span>"
                    + "      </button>"
                    + "      <ul class=\"dropdown-menu\" style=\"min-width:0px\">";
        if(data[i].status=="NORMAL"){
            tablestr += "        <li><a href=\"#EditUserPasswordDialog\" data-toggle=\"modal\">修改密码</a></li>"
                    + "        <li><a href=\"#EditUserProfileDialog\" data-toggle=\"modal\">修改详细资料</a></li>"
                    + "        <li><a href=\"#EditUserCreditDialog\" data-toggle=\"modal\">查看实名资料</a></li>"
                    + "        <li><a href=\"#EditUserRoleDialog\" data-toggle=\"modal\">分派角色</a></li>"
                    + "        <li><a href=\"#EditUserGroupDialog\" data-toggle=\"modal\">更改分组</a></li>"
                    + "        <li><a href=\"#ForbiddenUserDialog\" data-toggle=\"modal\">禁用</a></li>"
                    + "        <li><a href=\"#DelUserDialog\" data-toggle=\"modal\">删除</a></li>";
        }else if(data[i].status=="UNAURHORIZED"){
            tablestr += "        <li><a href=\"#VerifyUserDialog\" data-toggle=\"modal\">审核</a></li>"
                    + "        <li><a href=\"#DelUserDialog\" data-toggle=\"modal\">删除</a></li>";
            
        }else{
            tablestr += "        <li><a href=\"#RestoreUserDialog\" data-toggle=\"modal\">恢复</a></li>"
                    + "        <li><a href=\"#EraseUserDialog\" data-toggle=\"modal\">永久删除</a></li>";
            
        }
            tablestr +=  "      </ul>" + "    </div>" + "  </td>" + "</tr>";
        }
    }
    $(".table tbody").html(tablestr);
}


///////////////////////////////////////////////////////////////////////////////
/// 课程分类
///////////////////////////////////////////////////////////////////////////////

function addCategory(name)
{
  var cat = {
      "name" : name
  };
  $.ajax({
      "url" : sdkPath + "/categorys",
      "type" : "POST",
      "data" : JSON.stringify(cat),
      "dataType" : "json",
      "contentType" : "application/json",
  }).success(function(data)
  {
      console.log(data);
  }).fail(function()
  {
      console.log("connect " + this.url + " failed!");
  });
}

function editCategory(id, name)
{
  var cat = {
      "name" : name,
      "id" : id
  };
  $.ajax({
      "url" : sdkPath + "/categorys/" + id,
      "type" : "PUT",
      "data" : JSON.stringify(cat),
      "dataType" : "json",
      "contentType" : "application/json",
  }).success(function(data)
  {
      console.log(data);
  }).fail(function()
  {
      console.log("connect " + this.url + " failed!");
  });
}

function delCategory(id)
{
  $.ajax({
      "url" : sdkPath + "/categorys/" + id,
      "type" : "DELETE",
      "contentType" : "application/json",
  }).success(function(data)
  {
      console.log(data);
  }).fail(function()
  {
      console.log("connect " + this.url + " failed!");
  });
}

function createCategoryTable(data)
{
  if (!data)
  {
      return;
  }
  var tablestr = "";
  for (var i = 0; i < data.length; i++)
  {
      tablestr += "<tr data-id=\""
              + data[i].id
              + "\">"
              + "  <td>"
              + data[i].name
              + "</td>"
              + "  <td></td>"
              + "  <td></td>"
              + "  <td><button type=\"button\" class=\"btn btn-default btn-sm\" data-toggle=\"modal\" data-target=\"#editCategoryDialog\">编辑</button></td>"
              + "  <td><button type=\"button\" class=\"btn btn-danger btn-sm\" data-toggle=\"modal\" data-target=\"#delCategoryDialog\">删除</button></td>"
              + "</tr>";
  }
  $("#categoryTable tbody").html(tablestr);
}

function getCategoryChildren(id)
{
  $.ajax({
      "url" : sdkPath + "/category/" + id + "/children",
      "type" : "GET",
  }).success(function(data)
  {
      createCategoryTable(data);
  }).fail(function()
  {
      console.log("connect " + this.url + " failed!");
      return null;
  });
}

function recursiveCategoryTree(tree, pid, data)
{
  tree.add(data.id, pid, data.name);
  if (data.children && data.children.length > 0)
  {
      for (var i = 0; i < data.children.length; i++)
      {
          recursiveCategoryTree(tree, data.id, data.children[i]);
      }
  }
}

function createCategoryTree(node)
{

  $.ajax({
      "url" : sdkPath + "/category/1/tree",
      "type" : "GET",
  }).success(function(data)
  {
      categoryTree = data;
      d = new dTree('d');
      recursiveCategoryTree(d, -1, data);
      console.log(categoryTree);
      node.html(d.toString());
  }).fail(function()
  {
      console.log("connect " + this.url + " failed!");
      return null;
  });
}


///////////////////////////////////////////////////////////////////////////////
/// 课程属性
///////////////////////////////////////////////////////////////////////////////

function addAttribute(attribute)
{
  $.ajax({
      "url" : sdkPath + "/attribute",
      "type" : "POST",
      "data" : JSON.stringify(attribute),
      "dataType" : "json",
      "contentType" : "application/json",
  }).success(function(data)
  {
      console.log(data);
  }).fail(function()
  {
      console.log("connect " + this.url + " failed!");
  });
}

function editAttribute(attribute)
{
  $.ajax({
      "url" : sdkPath + "/attribute/" + attribute.id,
      "type" : "PUT",
      "data" : JSON.stringify(attribute),
      "dataType" : "json",
      "contentType" : "application/json",
  }).success(function(data)
  {
      console.log(data);
  }).fail(function()
  {
      console.log("connect " + this.url + " failed!");
  });
}

function delAttribute(id)
{
  $.ajax({
      "url" : sdkPath + "/attribute/" + id,
      "type" : "DELETE",
      "contentType" : "application/json",
  }).success(function(data)
  {
      console.log(data);
  }).fail(function()
  {
      console.log("connect " + this.url + " failed!");
  });
}

function addAttributeValue(id,strArray)
{
  $.ajax({
      "url" : sdkPath + "/attribute/" + id + "/value",
      "type" : "POST",
      "data" : JSON.stringify(strArray),
      "dataType" : "json",
      "contentType" : "application/json",
  }).success(function(data)
  {
      console.log(data);
  }).fail(function()
  {
      console.log("connect " + this.url + " failed!");
  });
}

function editAttributeValue(attribute)
{
  $.ajax({
      "url" : sdkPath + "/attribute/" + attribute.id + "/value",
      "type" : "PUT",
      "data" : JSON.stringify(attribute.values),
      "dataType" : "json",
      "contentType" : "application/json",
  }).success(function(data)
  {
      console.log(data);
  }).fail(function()
  {
      console.log("connect " + this.url + " failed!");
  });
}

function delAttributeValue(id, idArray)
{
  $.ajax({
      "url" : sdkPath + "/attribute/" + id + "/value",
      "type" : "DELETE",
      "data" : JSON.stringify(idArray),
      "dataType" : "json",
      "contentType" : "application/json",
  }).success(function(data)
  {
      console.log(data);
  }).fail(function()
  {
      console.log("connect " + this.url + " failed!");
  });
}

function createAttributeTable(data)
{
  if (!data)
  {
      return;
  }
  var tablestr = "";
  for (var i = 0; i < data.length; i++)
  {
      tablestr += "<tr data-id=\""
              + data[i].id
              + "\">"
              + "  <td>"
              + data[i].name
              + "  </td>"
              + "  <td>";
      var values = data[i].values;
      for(var j = 0; j< values.leagth; j++)
      {
          tablestr += "<label><input type=\"checkbox\">"+values[j].value+"</label>";
      }
      tablestr += "  </td>"
              + "  <td><div class=\"btn-group\" role=\"group\">"
              + "    <button type=\"button\" class=\"btn btn-default\">Left</button>"
              + "    <button type=\"button\" class=\"btn btn-default\">Middle</button>"
              + "    <button type=\"button\" class=\"btn btn-default\">Right</button>"
              + "  </div></td>"
              + "</tr>";
  }
  $("#categoryTable tbody").html(tablestr);
}

function getCategoryAttribute(id)
{
  $.ajax({
      "url" : sdkPath + "/category/" + id + "/attributes",
      "type" : "GET",
  }).success(function(data)
  {
      createAttributeTable(data);
  }).fail(function()
  {
      console.log("connect " + this.url + " failed!");
      return null;
  });
}


// /////////////////////////////////////////////////////////////////////////////
// / 课程
// /////////////////////////////////////////////////////////////////////////////
function addCourse(course)
{
    $.ajax({
        "url" : sdkPath + "/courses",
        "type" : "POST",
        "data" : JSON.stringify(course),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(
            function(data)
            {
                $("#AddCourseDialog").modal("hide");
                if (data.result == "success")
                {
                    getAllCourse(queryCat.id, queryOwner, queryString, 0);
                } else
                {
                    console.log("add course " + course.title + " failed with "
                            + data.desc);
                }
            }).fail(function(data)
    {
        console.log(JSON.stringify(data));
        console.log("connect " + this.url + " failed!");
    });
}

function editCourse(course)
{
    $.ajax({
        "url" : sdkPath + "/courses/" + course.id,
        "type" : "PUT",
        "data" : JSON.stringify(course),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#EditCourseDialog").modal("hide");
        getAllCourse(queryCat.id, queryOwner, queryString, 0);
    }).fail(function(data)
    {
        console.log("connect " + this.url + " failed!");
    });
}

function editCourseCategory(course)
{
    $.ajax({
        "url" : sdkPath + "/courses/" + course.cid + "/category",
        "type" : "PUT",
        "data" : JSON.stringify(course),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#EditCategoryDialog").modal("hide");
        getAllCourse(queryCat.id, queryOwner, queryString, 0);
    }).fail(function(data)
    {
        console.log("connect " + this.url + " failed!");
    });
}

function editCourseDetail(course)
{
    $.ajax({
        "url" : sdkPath + "/courses/" + course.id + "/detail",
        "type" : "PUT",
        "data" : JSON.stringify(course),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#EditCourseDetailDialog").modal("hide");
    }).fail(function(data)
    {
        console.log("connect " + this.url + " failed!");
    });
}

function editCourseStatus(course)
{
    $.ajax({
        "url" : sdkPath + "/courses/status/" + course.id,
        "type" : "PUT",
        "data" : JSON.stringify(course),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        getAllCourse(queryCat.id, queryOwner, queryString, 0);
    }).fail(function(data)
    {
        console.log("connect " + this.url + " failed!");
    });
}

function delCourse(courseId)
{
    $.ajax({
        "url" : sdkPath + "/courses/" + courseId,
        "type" : "DELETE",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#DelCourseDialog").modal("hide");
        // getAllCourse(0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function getAllCourse(catId, uid, query, page)
{
    $.ajax(
            {
                "url" : sdkPath + "/courses/?catId=" + catId + "&uid=" + uid
                        + "&query=" + query + "&page=" + page,
                "type" : "GET",
                "dataType" : "json",
                "contentType" : "application/json",
            }).success(function(data)
    {
        if (data.data && data.data.length)
            $("#NoDataWarning").hide();
        else
            $("#NoDataWarning").show();
        courseList = data.data;
        createCourseTable(courseList);
        curPage = data.currentPage;
        createPagination(data.currentPage, data.totalPage);
    }).fail(function(data)
    {
        if (data.status == 200)
        {
            $("#NoDataWarning").show();
            if (data.responseText != "")
            {
                console.log(data.responseText);
            }
        } else
        {
            console.log(data);
            console.log("connect " + this.url + " failed!");
        }
        $("tbody tr").remove();
    });
}

function createCourseTable(data)
{
    tablestr = "";
    if (data && data.length)
    {
        for (var i = 0; i < data.length; i++)
        {
            tablestr += "<tr data-index=\""
                    + i
                    + "\" data-id=\""
                    + data[i].id
                    + "\">"
                    + "  <td><input type=\"checkbox\" name=\"subject"
                    + data[i].id
                    + "\"></td>"
                    + "  <td>"
                    + data[i].sn
                    + "</td>"
                    + "  <td>"
                    + data[i].title
                    + "</td>"
                    + "  <td>"
                    + data[i].userName
                    + "</td>"
                    + "  <td>"
                    + data[i].categoryName
                    + "</td>"
                    + "  <td>"
                    + data[i].startTime
                    + "</td>"
                    + "  <td>"
                    + data[i].favtimes
                    + "</td>"
                    + "  <td>"
                    + data[i].mark
                    + "</td>"
                    + "  <td>" ;
            if(data[i].status=="NORMAL"){
            	tablestr += data[i].courseStatus;
            }else{
            	tablestr += data[i].status
            }
            tablestr +=" " 
                    + "</td>"
                    + "  <td style=\"width:120px\">"
                    + "    <div class=\"btn-group dropup\">"
                    + "      <a type=\"button\" class=\"btn btn-default btn-sm\" href=\""
                    + webPath
                    + "/course/"
                    + data[i].id
                    + "\" target=\"_blank\">查看</a>"
                    + "      <button type=\"button\" class=\"btn btn-default btn-sm dropdown-toggle\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">"
                    + "        <span class=\"caret\"></span>"
                    + "      </button>"
                    + "      <ul class=\"dropdown-menu\" style=\"min-width:0px\">";
            if(data[i].status == "NORMAL"){
            	 if (data[i].courseStatus == "Draft")
                 {
                     tablestr += "   <li><a href=\"#\" id=\"PublishBtn\" data-id=\""
                             + data[i].id + "\">发布</a></li>";
                 } else if (data[i].courseStatus == "Verifying")
                 {
                     tablestr += "   <li><a href=\"#\" id=\"VerifyBtn\" data-id=\""
                             + data[i].id + "\">审核</a></li>";
                 } else if (data[i].courseStatus == "Verified")
                 {
                     tablestr += "   <li><a href=\"#\" id=\"StartBtn\" data-id=\""
                             + data[i].id + "\">开课</a></li>"
                             + "   <li><a href=\"#\" id=\"UnVerifyBtn\" data-id=\""
                             + data[i].id + "\">取消审核</a></li>";
                 } else if (data[i].courseStatus == "Ongoing")
                 {
                     tablestr += "   <li><a href=\"#\" id=\"StopBtn\" data-id=\""
                             + data[i].id + "\">停课</a></li>"
                             + "    <li><a href=\"#\" id=\"UnVerifyBtn\" data-id=\""
                             + data[i].id + "\">取消审核</a></li>";
                 } else if (data[i].courseStatus == "Finish")
                 {
                     tablestr += "   <li><a href=\"#\" id=\"StartBtn\" data-id=\""
                             + data[i].id + "\">重新开课</a></li>"
                 }
            }else if(data[i].status == "UNAURHORIZED"){
            	tablestr += "   <li><a href=\"#\" id=\"StatusVerifyBtn\" data-id=\""
                    + data[i].id + "\">审核</a></li>"
            }
           
            tablestr += "        <li><a href=\"#EditCategoryDialog\" data-toggle=\"modal\">修改分类</a></li>"
                    + "      <li><a href=\"#EditCourseChapterDialog\" data-toggle=\"modal\">编辑章节</a></li>"
                    + "        <li><a href=\"#EditCourseDetailDialog\" data-toggle=\"modal\">编辑详情</a></li>"
                    + "        <li><a href=\"#DelCourseDialog\" data-toggle=\"modal\">删除</a></li>"
                    + "        <li><a href=\"#EditCourseDialog\" data-toggle=\"modal\">编辑</a></li>"
                    + "      </ul>" + "    </div>" + "  </td>" + "</tr>";
        }
    }
    $(".rightcontent .table tbody").html(tablestr);
}

// /////////////////////////////////////////////////////////////////////////////
// / 视频
// /////////////////////////////////////////////////////////////////////////////

function addVideo(video)
{
    $.ajax({
        "url" : sdkPath + "/videos",
        "type" : "POST",
        "data" : JSON.stringify(video),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(
            function(data)
            {
                $("#AddVideoDialog").modal("hide");
                if (data.result == "success")
                {
                    getAllVideo(queryCat.id, queryOwner, queryString, 0);
                } else
                {
                    console.log("add video " + video.title + " failed with "
                            + data.desc);
                }
            }).fail(function(data)
    {
        console.log(JSON.stringify(data));
        console.log("connect " + this.url + " failed!");
    });
}

function editVideo(video)
{
    $.ajax({
        "url" : sdkPath + "/videos/" + video.id,
        "type" : "PUT",
        "data" : JSON.stringify(video),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#EditVideoDialog").modal("hide");
        getAllVideo(queryCat.id, queryOwner, queryString, 0);
    }).fail(function(data)
    {
        console.log("connect " + this.url + " failed!");
    });
}

function editVideoCategory(video)
{
    $.ajax({
        "url" : sdkPath + "/videos/" + video.id + "/category",
        "type" : "PUT",
        "data" : JSON.stringify(video),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#EditCategoryDialog").modal("hide");
        getAllVideo(queryCat.id, queryOwner, queryString, 0);
    }).fail(function(data)
    {
        console.log("connect " + this.url + " failed!");
    });
}

function editVideoStatus(video)
{
	// alert(sdkPath + "/videos/status/" + video.id+">>>>>>>>>>"+JSON.stringify(video));
    $.ajax({
        "url" : sdkPath + "/videos/status/" + video.id,
        "type" : "PUT",
        "data" : JSON.stringify(video),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        getAllVideo(queryCat.id, queryOwner, queryString, 0);
    }).fail(function(data)
    {
        console.log("connect " + this.url + " failed!");
    });
}

function delVideo(videoId)
{
    $.ajax({
        "url" : sdkPath + "/videos/" + videoId,
        "type" : "DELETE",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#DelVideoDialog").modal("hide");
        // getAllVideo(0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function getAllVideo(catId, uid, query, page)
{
    $.ajax(
            {
                "url" : sdkPath + "/videos/?catId=" + catId + "&uid=" + uid
                        + "&query=" + query + "&page=" + page,
                "type" : "GET",
                "dataType" : "json",
                "contentType" : "application/json",
            }).success(function(data)
    {
        if (data.data && data.data.length)
            $("#NoDataWarning").hide();
        else
            $("#NoDataWarning").show();
        videoList = data.data;
        createVideoTable(videoList);
        curPage = data.currentPage;
        createPagination(data.currentPage, data.totalPage);
    }).fail(function(data)
    {
        if (data.status == 200)
        {
            $("#NoDataWarning").show();
            if (data.responseText != "")
            {
                console.log(data.responseText);
            }
        } else
        {
            console.log(data);
            console.log("connect " + this.url + " failed!");
        }
        $("tbody tr").remove();
    });
}

function createVideoTable(data)
{
    tablestr = "";
    if (data && data.length)
    {
        for (var i = 0; i < data.length; i++)
        {
            tablestr += "<tr data-index=\"" + i + "\" data-id=\"" + data[i].id
                    + "\">" + "  <td><input type=\"checkbox\" name=\"video"
                    + data[i].id + "\"></td>" + "  <td>" + data[i].title
                    + "</td>" + "  <td>" + data[i].username + "</td>";
            if (data[i].categoryName)
            {
                tablestr += "  <td>" + data[i].categoryName + "</td>";
            } else
            {
                tablestr += "  <td>未分类</td>";
            }
            tablestr += "  <td>"
                    + data[i].playCnt
                    + "</td>"
                    + "  <td>"
                    + data[i].greatCnt
                    + "</td>"
                    + "  <td>" ;
            
            tablestr += data[i].status
            
            tablestr +=" " 
                    + "</td>"
                    + "  <td style=\"width:120px\">"
                    + "    <div class=\"btn-group dropup\">"
                    + "      <a type=\"button\" class=\"btn btn-default btn-sm\" href=\""
                    + webPath
                    + "/video/"
                    + data[i].id
                    + "\" target=\"_blank\">查看</a>"
                    + "      <button type=\"button\" class=\"btn btn-default btn-sm dropdown-toggle\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">"
                    + "        <span class=\"caret\"></span>"
                    + "      </button>"
                    + "      <ul class=\"dropdown-menu\" style=\"min-width:0px\">";
           // alert("data[i].videoStatus>>>>"+data[i].videoStatus);
            if(data[i].status == "NORMAL"){
            
                tablestr += "   <li><a href=\"#\" id=\"UnVerifyBtn\" data-id=\""
                    + data[i].id + "\">取消审核</a></li>";
              
            }else if(data[i].status == "UNAURHORIZED"){
            	tablestr += "   <li><a href=\"#\" id=\"StatusVerifyBtn\" data-id=\""
                    + data[i].id + "\">审核</a></li>"
            }
            
            tablestr += "        <li><a href=\"#EditCategoryDialog\" data-toggle=\"modal\">修改分类</a></li>"
                    + "        <li><a href=\"#ShowVideoAddrDialog\" data-toggle=\"modal\">播放地址</a></li>"
                    + "        <li><a href=\"#DelVideoDialog\" data-toggle=\"modal\">删除</a></li>"
                    + "        <li><a href=\"#EditVideoDialog\" data-toggle=\"modal\">编辑</a></li>"
                    + "      </ul>" + "    </div>" + "  </td>" + "</tr>";
        }
    }
    $(".rightcontent .table tbody").html(tablestr);
}

// /////////////////////////////////////////////////////////////////////////////
// / 直播
// /////////////////////////////////////////////////////////////////////////////

function addLive(live)
{
    $.ajax({
        "url" : sdkPath + "/lives",
        "type" : "POST",
        "data" : JSON.stringify(live),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(
            function(data)
            {
                $("#AddLiveDialog").modal("hide");
                if (data.result == "success")
                {
                    getAllLive(queryCat, queryOwner, "", 0);
                } else
                {
                    console.log("add live " + live.title + " failed with "
                            + data.desc);
                }
            }).fail(function(data)
    {
        console.log(JSON.stringify(data));
        console.log("connect " + this.url + " failed!");
    });
}

function editLive(live)
{
    $.ajax({
        "url" : sdkPath + "/lives/" + live.id,
        "type" : "PUT",
        "data" : JSON.stringify(live),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#").modal("hide");
        getAllLive(queryCat, queryOwner, "", 0);
    }).fail(function(data)
    {
        console.log("connect " + this.url + " failed!");
    });
}

function editLiveCategory(live)
{
    $.ajax({
        "url" : sdkPath + "/lives/" + live.id + "/category",
        "type" : "PUT",
        "data" : JSON.stringify(live),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#EditCategoryDialog").modal("hide");
        getAllLive(queryCat, queryOwner, "", 0);
    }).fail(function(data)
    {
        console.log("connect " + this.url + " failed!");
    });
}


/**function getAllLive()
{
    $.ajax(
            {
                "url" : sdkPath + "/lives/?catId=" + catId + "&uid=" + uid
                        + "&query=" + query + "&page=" + page,
                "type" : "GET",
                "dataType" : "json",
                "contentType" : "application/json",
            }).success(function(data)
    {
        liveList = data.data;
        createLiveTable(liveList);
        curPage = data.currentPage;
        createPagination(data.currentPage, data.totalPage);
    }).fail(function(data)
    {
        if (data.status == 200)
        {
            $("#NoDataWarning").show();
            if (data.responseText != "")
            {
                console.log(data.responseText);
            }
        } else
        {
            console.log(data);
            console.log("connect " + this.url + " failed!");
        }
        $("tbody tr").remove();
    });
} **/

  function createLiveTable(data)
  {
    tablestr = "";
    if (data && data.length)
    {
        for (var i = 0; i < data.length; i++)
        {   
        	var status="";
        	if(data[i].status!= "NORMAL"){
        	  status=data[i].status;
        	}else{
        	  status=data[i].liveStatus;
        	}
            tablestr += "<tr data-index=\""+i+ "\" data-id=\""+ data[i].id+"\" categoryId=\""+ data[i].categoryId+"\">"
	                     +"<td><input type=\"checkbox\" name=\"subject"+data[i].id+"\"></td>"
	                     +"<td>"+ data[i].sn+"</td>"
	                     +"<td>"+ data[i].title+"</td>"
                         +"<td>"+ data[i].userName+"</td>"
                         +"<td>"+ data[i].startTime.substr(0,19)+"</td>"
                         +"<td>"+status+"</td>"
                         +"<td style=\"width:120px\">"
                             +"<div class=\"btn-group dropup\">"
                                 + "<a type=\"button\" class=\"btn btn-default btn-sm\" href=\""+webPath+"/live/"+data[i].id+ "\" target=\"_blank\">查看</a>"
                          + "<button type=\"button\" class=\"btn btn-default btn-sm dropdown-toggle\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">"
                          + " <span class=\"caret\"></span></button>"
                          + " <ul class=\"dropdown-menu\" style=\"min-width:10px\">"
                          if((data[i].status == "UNAURHORIZED")){
                        	  //审核，删除，编辑，取消
                        	  tablestr += "<li><a href=\"#\" id=\"VerifyBtn\" data-id=\""+ data[i].id + "\">审核</a></li>";
                          }else if(data[i].status == "FORBIDDEN"){
                        	  //删除，恢复，彻底删除
                          }else if(data[i].status == "BLOCKED"){
                        	//删除，恢复，彻底删除
                          }else if(data[i].status == "DELETE"){
                        	  tablestr += "<li><a href=\"#\" id=\"RecoverBtn\" data-id=\""+ data[i].id + "\">恢复</a></li>";
                        	//恢复，彻底删除
                          }else if(data[i].status == "NORMAL"){
                        	  
                        	  if(data[i].liveStatus=="Upcoming"){
                        		  tablestr += "<li><a href=\"#\" id=\"UnVerifyBtn\" data-id=\""+ data[i].id + "\">取消审核</a></li>"
                   	                       +"<li><a href=\"#\"  id=\"StartBtn\" data-id=\""+ data[i].id + "\">开始直播</a></li>";
                        		  //取消审核，编辑，删除，开始直播，推流地址，取消
                        	  }else if(data[i].liveStatus=="Living"){
                        		  //停止直播，暂停直播，直播地址
                        		  tablestr += "<li><a href=\"#\" id=\"PauseBtn\" data-id=\""+ data[i].id + "\">暂停直播</a></li>"
          	                               +"<li><a href=\"#\"  id=\"StopBtn\" data-id=\""+ data[i].id + "\">停止直播</a></li>";
                        	  }else if(data[i].liveStatus=="Pause"){
                        		//停止直播，继续直播，直播地址
                        		  tablestr += "<li><a href=\"#\" id=\"StartBtn\" data-id=\""+ data[i].id + "\">继续直播</a></li>"
         	                       +"<li><a href=\"#\"  id=\"StopBtn\" data-id=\""+ data[i].id + "\">停止直播</a></li>";
                       		       
                        	  }else if(data[i].liveStatus=="Stop"){
                        		//编辑，删除，开始直播，推流地址
                        		  tablestr +="<li><a href=\"#\" id=\"RestartBtn\" data-id=\""+ data[i].id + "\">开始直播</a></li>";
                        	  }else if(data[i].liveStatus=="End"){
                        		//编辑，删除，开始直播，推流地址
                        		  tablestr += "<li><a href=\"#\" id=\"RestartBtn\" data-id=\""+ data[i].id + "\">开始直播</a></li>"
        	                               +"<li><a href=\"#\"  id=\"StopBtn\" data-id=\""+ data[i].id + "\">停止直播</a></li>"
                        	  }else if(data[i].liveStatus=="Cancel"){
                        		//删除
                        		
                        	   }
                        	  
                             }
						     tablestr += "<li><a href=\"#ShowLiveAddrDialog\" data-toggle=\"modal\">直播地址</a></li>"
						    	            +"<li><a href=\"#\" id=\"RemoveBtn\" data-id=\""+ data[i].id + "\">彻底删除</a></li>"
						                    + " <li><a href=\"#DelLiveDialog\" data-toggle=\"modal\">删除</a></li>"
						                    + " <li><a href=\"#editLiveDialog\" data-toggle=\"modal\">编辑</a></li>"
						                    + " </ul>" + "</div>" + "</td>" + "</tr>";
						     }
                          }
                    $(".rightcontent .table tbody").html(tablestr);
             }

// /////////////////////////////////////////////////////////////////////////////
// / 课表节次
// /////////////////////////////////////////////////////////////////////////////

function addSchedule(schedule, fn)
{
    $.ajax({
        "url" : sdkPath + "/schedules",
        "type" : "POST",
        "data" : JSON.stringify(schedule),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        fn(data);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function editSchedule(schedule, fn)
{
    $.ajax({
        "url" : sdkPath + "/schedules/" + schedule.id,
        "type" : "PUT",
        "data" : JSON.stringify(schedule),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        fn(data);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function delSchedule(scheduleId)
{
    $.ajax({
        "url" : sdkPath + "/schedules/" + scheduleId,
        "type" : "DELETE",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#delScheduleDialog").modal("hide");
        // getAllSchedule(0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function getTeacherSchedule(teacherId, fn)
{
    $.ajax({
        "url" : sdkPath + "/schedules/teacher/" + teacherId,
        "type" : "GET",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        fn(data);
    }).fail(function(data)
    {
        if (data.status == 200)
        {
            if (data.responseText != "")
            {
                console.log(data.responseText);
            }
        } else
        {
            console.log(data);
            console.log("connect " + this.url + " failed!");
        }
    });
}

function getGroupSchedule(groupId, fn)
{
    $.ajax({
        "url" : sdkPath + "/schedules/group/" + groupId,
        "type" : "GET",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        fn(data);
    }).fail(function(data)
    {
        if (data.status == 200)
        {
            if (data.responseText != "")
            {
                console.log(data.responseText);
            }
        } else
        {
            console.log(data);
            console.log("connect " + this.url + " failed!");
        }
    });
}

function getRoomSchedule(roomId, fn)
{
    $.ajax({
        "url" : sdkPath + "/schedules/room/" + roomId,
        "type" : "GET",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        fn(data);
    }).fail(function(data)
    {
        if (data.status == 200)
        {
            if (data.responseText != "")
            {
                console.log(data.responseText);
            }
        } else
        {
            console.log(data);
            console.log("connect " + this.url + " failed!");
        }
    });
}

// /////////////////////////////////////////////////////////////////////////////
// / 课程节次
// /////////////////////////////////////////////////////////////////////////////

function addLesson(lesson)
{
    $.ajax({
        "url" : sdkPath + "/lessons",
        "type" : "POST",
        "data" : JSON.stringify(lesson),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#addLessonDialog").modal("hide");
        console.log(JSON.stringify(data));
        getAllLesson(0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function editLesson(lesson)
{
    $.ajax({
        "url" : sdkPath + "/lessons/" + lesson.id,
        "type" : "PUT",
        "data" : JSON.stringify(lesson),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#editLessonDialog").modal("hide");
        getAllLesson(0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function delLesson(lessonId)
{
    $.ajax({
        "url" : sdkPath + "/lessons/" + lessonId,
        "type" : "DELETE",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#delLessonDialog").modal("hide");
        // getAllLesson(0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function getAllLesson(page)
{
    $.ajax({
        "url" : sdkPath + "/lessons/?page=" + page,
        "type" : "GET",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        if (data.data && data.data.length)
            $("#NoDataWarning").hide();
        else
            $("#NoDataWarning").show();
        lessonList = data.data;
        createLessonTable(lessonList);
        curPage = data.currentPage;
        createPagination(data.currentPage, data.totalPage);
    }).fail(function(data)
    {
        if (data.status == 200)
        {
            $("#NoDataWarning").show();
            if (data.responseText != "")
            {
                console.log(data.responseText);
            }
        } else
        {
            console.log(data);
            console.log("connect " + this.url + " failed!");
        }
    });
}

function createLessonTable(data)
{
    tablestr = "";
    if (data && data.length)
    {
        for (var i = 0; i < data.length; i++)
        {
            tablestr += "<tr data-index=\""
                    + i
                    + "\" data-id=\""
                    + data[i].id
                    + "\">"
                    + "  <td><input type=\"checkbox\" name=\"subject"
                    + data[i].id
                    + "\"></td>"
                    + "  <td>"
                    + data[i].index
                    + "</td>"
                    + "  <td>"
                    + data[i].name
                    + "</td>"
                    + "  <td>"
                    + data[i].starttime
                    + "</td>"
                    + "  <td>"
                    + data[i].endtime
                    + "</td>"
                    + "  <td style=\"width:120px\">"
                    + "    <div class=\"btn-group dropup\">"
                    + "      <button type=\"button\" class=\"btn btn-default btn-sm\" data-toggle=\"modal\" data-target=\"#editLessonDialog\">编辑</button>"
                    + "      <button type=\"button\" class=\"btn btn-default btn-sm dropdown-toggle\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">"
                    + "        <span class=\"caret\"></span>"
                    + "      </button>"
                    + "      <ul class=\"dropdown-menu\" style=\"min-width:0px\">"
                    + "        <li><a href=\"#delLessonDialog\" data-toggle=\"modal\">删除</a></li>"
                    + "      </ul>" + "    </div>" + "  </td>" + "</tr>";
        }
    }
    $(".table tbody").html(tablestr);
}

// /////////////////////////////////////////////////////////////////////////////
// / 学科
// /////////////////////////////////////////////////////////////////////////////

function addSubject(name, sn)
{
    $.ajax({
        "url" : sdkPath + "/subjects",
        "type" : "POST",
        "data" : JSON.stringify({
            "name" : name,
            "sn" : sn
        }),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#addSubjectDialog").modal("hide");
        getAllSubject(0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function editSubject(subject)
{
    $.ajax({
        "url" : sdkPath + "/subjects/" + subject.id,
        "type" : "PUT",
        "data" : JSON.stringify(subject),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#editSubjectDialog").modal("hide");
        getAllSubject(0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function delSubject(subjectId)
{
    $.ajax({
        "url" : sdkPath + "/subjects/" + subjectId,
        "type" : "DELETE",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#delSubjectDialog").modal("hide");
        getAllSubject(0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function getAllSubject(page)
{
    $.ajax({
        "url" : sdkPath + "/subjects/?page=" + page,
        "type" : "GET",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        if (data.data && data.data.length)
            $("#NoDataWarning").hide();
        else
            $("#NoDataWarning").show();
        subjectList = data.data;
        createSubjectTable(subjectList);
        curPage = data.currentPage;
        createPagination(data.currentPage, data.totalPage);
    }).fail(function(data)
    {
        if (data.status == 200)
        {
            $("#NoDataWarning").show();
            if (data.responseText != "")
            {
                console.log(data.responseText);
            }
        } else
        {
            console.log(data);
            console.log("connect " + this.url + " failed!");
        }
    });
}

function createSubjectTable(data)
{
    tablestr = "";
    if (data && data.length)
    {
        for (var i = 0; i < data.length; i++)
        {
            tablestr += "<tr data-index=\""
                    + i
                    + "\">"
                    + "  <td><input type=\"checkbox\" name=\"subject"
                    + data[i].id
                    + "\"></td>"
                    + "  <td>"
                    + data[i].sn
                    + "</td>"
                    + "  <td>"
                    + data[i].name
                    + "</td>"
                    + "  <td><button type=\"button\" class=\"btn btn-default btn-sm\" data-toggle=\"modal\" data-target=\"#editSubjectDialog\">编辑</button></td>"
                    + "  <td><button type=\"button\" class=\"btn btn-danger btn-sm\" data-toggle=\"modal\" data-target=\"#delSubjectDialog\">删除</button></td>"
                    + "</tr>";
        }
    }
    $(".table tbody").html(tablestr);
}

// /////////////////////////////////////////////////////////////////////////////
// / 年级
// /////////////////////////////////////////////////////////////////////////////

function addGrade(name)
{
    $.ajax({
        "url" : sdkPath + "/grades",
        "type" : "POST",
        "data" : JSON.stringify({
            "name" : name
        }),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#addGradeDialog").modal("hide");
        getAllGrade(0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function editGrade(name, gradeId)
{
    $.ajax({
        "url" : sdkPath + "/grades/" + gradeId,
        "type" : "PUT",
        "data" : JSON.stringify({
            "id" : gradeId,
            "name" : name
        }),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#editGradeDialog").modal("hide");
        getAllGrade(0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function delGrade(gradeId)
{
    $.ajax({
        "url" : sdkPath + "/grades/" + gradeId,
        "type" : "DELETE",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#delGradeDialog").modal("hide");
        getAllGrade(0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function getAllGrade(page)
{
    $.ajax({
        "url" : sdkPath + "/grades/?page=" + page,
        "type" : "GET",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        if (data.data && data.data.length)
            $("#NoDataWarning").hide();
        else
            $("#NoDataWarning").show();
        gradeList = data.data;
        createGradeTable(gradeList);
        curPage = data.currentPage;
        createPagination(data.currentPage, data.totalPage);
    }).fail(function(data)
    {
        if (data.status == 200)
        {
            $("#NoDataWarning").show();
            if (data.responseText != "")
            {
                console.log(data.responseText);
            }
        } else
        {
            console.log(data);
            console.log("connect " + this.url + " failed!");
        }
    });
}

function createGradeTable(data)
{
    tablestr = "";
    if (data && data.length)
    {
        for (var i = 0; i < data.length; i++)
        {
            tablestr += "<tr data-index=\""
                    + i
                    + "\">"
                    + "  <td><input type=\"checkbox\" name=\"subject"
                    + data[i].id
                    + "\"></td>"
                    + "  <td>"
                    + data[i].name
                    + "</td>"
                    + "  <td><button type=\"button\" class=\"btn btn-default btn-sm\" data-toggle=\"modal\" data-target=\"#editGradeDialog\">重命名</button></td>"
                    + "  <td><button type=\"button\" class=\"btn btn-danger btn-sm\" data-toggle=\"modal\" data-target=\"#delGradeDialog\">删除</button></td>"
                    + "</tr>";
        }
    }
    $(".table tbody").html(tablestr);
}

// /////////////////////////////////////////////////////////////////////////////
// / 出版社
// /////////////////////////////////////////////////////////////////////////////

function addPublisher(name, sn)
{
    $.ajax({
        "url" : sdkPath + "/publishers",
        "type" : "POST",
        "data" : JSON.stringify({
            "name" : name,
            "sn" : sn
        }),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#addPublisherDialog").modal("hide");
        getAllPublisher(0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function editPublisher(publisher)
{
    $.ajax({
        "url" : sdkPath + "/publishers/" + publisher.id,
        "type" : "PUT",
        "data" : JSON.stringify(publisher),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#editPublisherDialog").modal("hide");
        getAllPublisher(0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function delPublisher(publisherId)
{
    $.ajax({
        "url" : sdkPath + "/publishers/" + publisherId,
        "type" : "DELETE",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#delPublisherDialog").modal("hide");
        getAllPublisher(0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function getAllPublisher(page)
{
    $.ajax({
        "url" : sdkPath + "/publishers/?page=" + page,
        "type" : "GET",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        if (data.data && data.data.length)
            $("#NoDataWarning").hide();
        else
            $("#NoDataWarning").show();
        publisherList = data.data;
        createPublisherTable(publisherList);
        curPage = data.currentPage;
        createPagination(data.currentPage, data.totalPage);
    }).fail(function(data)
    {
        if (data.status == 200)
        {
            $("#NoDataWarning").show();
            if (data.responseText != "")
            {
                console.log(data.responseText);
            }
        } else
        {
            console.log(data);
            console.log("connect " + this.url + " failed!");
        }
    });
}

function createPublisherTable(data)
{
    tablestr = "";
    if (data && data.length)
    {
        for (var i = 0; i < data.length; i++)
        {
            tablestr += "<tr data-index=\""
                    + i
                    + "\">"
                    + "  <td><input type=\"checkbox\" name=\"subject"
                    + data[i].id
                    + "\"></td>"
                    + "  <td>"
                    + data[i].sn
                    + "</td>"
                    + "  <td>"
                    + data[i].name
                    + "</td>"
                    + "  <td><button type=\"button\" class=\"btn btn-default btn-sm\" data-toggle=\"modal\" data-target=\"#editPublisherDialog\">编辑</button></td>"
                    + "  <td><button type=\"button\" class=\"btn btn-danger btn-sm\" data-toggle=\"modal\" data-target=\"#delPublisherDialog\">删除</button></td>"
                    + "</tr>";
        }
    }
    $(".table tbody").html(tablestr);
}

// /////////////////////////////////////////////////////////////////////////////
// / 课本
// /////////////////////////////////////////////////////////////////////////////

function addTextbook(textbook)
{
    $.ajax({
        "url" : sdkPath + "/textbooks",
        "type" : "POST",
        "data" : JSON.stringify(textbook),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#addTextbookDialog").modal("hide");
        getAllTextbook(0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
        console.log(JSON.stringify(textbook));
    });
}

function editTextbook(textbook)
{
    $.ajax({
        "url" : sdkPath + "/textbooks/" + textbook.id,
        "type" : "PUT",
        "data" : JSON.stringify(textbook),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#editTextbookDialog").modal("hide");
        getAllTextbook(0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function delTextbook(textbookId)
{
    $.ajax({
        "url" : sdkPath + "/textbooks/" + textbookId,
        "type" : "DELETE",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#delTextbookDialog").modal("hide");
        getAllTextbook(0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function getAllTextbook(page)
{
    $.ajax({
        "url" : sdkPath + "/textbooks/?page=" + page,
        "type" : "GET",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        if (data.data && data.data.length)
            $("#NoDataWarning").hide();
        else
            $("#NoDataWarning").show();

        textbookList = data.data;
        createTextbookTable(textbookList);
        curPage = data.currentPage;
        createPagination(data.currentPage, data.totalPage);
    }).fail(function(data)
    {
        if (data.status == 200)
        {
            $("#NoDataWarning").show();
            if (data.responseText != "")
            {
                console.log(data.responseText);
            }
        } else
        {
            console.log(data);
            console.log("connect " + this.url + " failed!");
        }
    });
}

function createTextbookTable(data)
{
    tablestr = "";
    if (data && data.length)
    {
        for (var i = 0; i < data.length; i++)
        {
            tablestr += "<tr data-index=\""
                    + i
                    + "\">"
                    + "  <td><input type=\"checkbox\" name=\"subject"
                    + data[i].id
                    + "\"></td>"
                    + "  <td>"
                    + data[i].isbn
                    + "</td>"
                    + "  <td>"
                    + data[i].title
                    + "</td>"
                    + "  <td>"
                    + data[i].subject.name
                    + "</td>"
                    + "  <td>"
                    + data[i].grade.name
                    + "</td>"
                    + "  <td>"
                    + data[i].publisher.name
                    + "</td>"
                    + "  <td><button type=\"button\" class=\"btn btn-default btn-sm\" data-toggle=\"modal\" data-target=\"#editTextbookDialog\">编辑</button></td>"
                    + "  <td><button type=\"button\" class=\"btn btn-danger btn-sm\" data-toggle=\"modal\" data-target=\"#delTextbookDialog\">删除</button></td>"
                    + "</tr>";
        }
    }
    $(".table tbody").html(tablestr);
}

function getSubjectList(node)
{

    $
            .ajax({
                "url" : sdkPath + "/subjects/?page=" + 0,
                "type" : "GET",
            })
            .success(
                    function(data)
                    {
                        var liststr = "";
                        if (data.length)
                        {
                            liststr = "<form class=\"form-inline\" role=\"form\" name=\"subjectform\">";
                            for (var i = 0; i < data.length; i++)
                            {
                                liststr += "<div class=\"form-group\" style=\"padding-right:20px\"><div class=\"\"><label><input type=\"radio\" name=\"subject\" data-id=\""
                                        + data[i].id
                                        + "\" />"
                                        + data[i].name
                                        + "</label></div></div>";
                            }
                            liststr += "</form>";
                        }
                        node.html(liststr);
                    }).fail(function(data)
            {
                console.log(data);
                console.log("connect " + this.url + " failed!");
            });
}

function getGradeList(node)
{

    $
            .ajax({
                "url" : sdkPath + "/grades/?page=" + 0,
                "type" : "GET",
            })
            .success(
                    function(data)
                    {
                        var liststr = "";
                        if (data.length)
                        {
                            liststr = "<form class=\"form-inline\" role=\"form\" name=\"gradeform\">";
                            for (var i = 0; i < data.length; i++)
                            {
                                liststr += "<div class=\"form-group\" style=\"padding-right:20px\"><div class=\"\"><label><input type=\"radio\" name=\"grade\" data-id=\""
                                        + data[i].id
                                        + "\" />"
                                        + data[i].name
                                        + "</label></div></div>";
                            }
                            liststr += "</form>";
                        }
                        node.html(liststr);
                    }).fail(function(data)
            {
                console.log(data);
                console.log("connect " + this.url + " failed!");
            });
}

function getPublisherList(node)
{

    $.ajax({
                "url" : sdkPath + "/publishers/?page=" + 0,
                "type" : "GET",
            })
            .success(
                    function(data)
                    {
                        var liststr = "";
                        if (data.length)
                        {
                            liststr = "<form class=\"form-horizontal\" role=\"form\" name=\"roleform\">";
                            for (var i = 0; i < data.length; i++)
                            {
                                liststr += "<div class=\"form-group\"><div class=\"col-sm-offset-2 col-sm-10\"><label><input type=\"radio\" name=\"publisher\" data-id=\""
                                        + data[i].id
                                        + "\" />"
                                        + data[i].name
                                        + "</label></div></div>";
                            }
                            liststr += "</form>";
                        }
                        node.html(liststr);
                    }).fail(function(data)
            {
                console.log(data);
                console.log("connect " + this.url + " failed!");
            });
}

// /////////////////////////////////////////////////////////////////////////////
// / 录播室
// /////////////////////////////////////////////////////////////////////////////

function addRoom(room)
{
    $.ajax({
        "url" : sdkPath + "/rooms",
        "type" : "POST",
        "data" : JSON.stringify(room),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#addRoomDialog").modal("hide");
        getAllRoom(0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function editRoom(room)
{
    $.ajax({
        "url" : sdkPath + "/rooms/" + room.id,
        "type" : "PUT",
        "data" : JSON.stringify(room),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#editRoomDialog").modal("hide");
        getAllRoom(0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function delRoom(roomId)
{
    $.ajax({
        "url" : sdkPath + "/rooms/" + roomId,
        "type" : "DELETE",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#delRoomDialog").modal("hide");
        getAllRoom(0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function getRoomList(querystr, fn)
{
    $.ajax({
        "url" : sdkPath + "/v1/rooms",
        "type" : "get",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        fn(data);
    }).fail(function(data)
    {
        console.log(data);
        console.log("connect " + this.url + " failed!");
        $("tbody tr").remove();
    });
}

function getAllRoom(page)
{
    $.ajax({
        "url" : sdkPath + "/rooms/?page=" + page,
        "type" : "GET",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        if (data.data && data.data.length)
            $("#NoDataWarning").hide();
        else
            $("#NoDataWarning").show();
        roomList = data.data;
        createRoomTable(roomList);
        curPage = data.currentPage;
        createPagination(data.currentPage, data.totalPage);
    }).fail(function(data)
    {
        if (data.status == 200)
        {
            $("#NoDataWarning").show();
            if (data.responseText != "")
            {
                console.log(data.responseText);
            }
        } else
        {
            console.log(data);
            console.log("connect " + this.url + " failed!");
        }
    });
}

function createRoomTable(data)
{
    tablestr = "";
    if (data && data.length)
    {
        for (var i = 0; i < data.length; i++)
        {
            tablestr += "<tr data-index=\""
                    + i
                    + "\">"
                    + "  <td><input type=\"checkbox\" name=\"subject"
                    + data[i].id
                    + "\"></td>"
                    + "  <td>"
                    + data[i].sn
                    + "</td>"
                    + "  <td>"
                    + data[i].name
                    + "</td>"
                    + "  <td>"
                    + data[i].address
                    + "</td>"
                    + "  <td style=\"width:120px\">"
                    + "    <div class=\"btn-group dropup\">"
                    + "      <button type=\"button\" class=\"btn btn-default btn-sm\" data-toggle=\"modal\" data-target=\"#editRoomDialog\">编辑</button>"
                    + "      <button type=\"button\" class=\"btn btn-default btn-sm dropdown-toggle\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">"
                    + "        <span class=\"caret\"></span>"
                    + "      </button>"
                    + "      <ul class=\"dropdown-menu\" style=\"min-width:0px\">"
                    + "        <li><a href=\"#delRoomDialog\" data-toggle=\"modal\">删除</a></li>"
                    + "      </ul>" + "    </div>" + "  </td>" + "</tr>";
        }
    }
    $(".table tbody").html(tablestr);
}

// /////////////////////////////////////////////////////////////////////////////
// / 录播设备
// /////////////////////////////////////////////////////////////////////////////

function addDevice(device)
{
    $.ajax({
        "url" : sdkPath + "/devices",
        "type" : "POST",
        "data" : JSON.stringify(device),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#addDeviceDialog").modal("hide");
        getAllDevice(0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function editDevice(device)
{
    $.ajax({
        "url" : sdkPath + "/devices/" + device.id,
        "type" : "PUT",
        "data" : JSON.stringify(device),
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#editDeviceDialog").modal("hide");
        getAllDevice(0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function delDevice(deviceId)
{
    $.ajax({
        "url" : sdkPath + "/devices/" + deviceId,
        "type" : "DELETE",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        $("#delDeviceDialog").modal("hide");
        // getAllDevice(0);
    }).fail(function()
    {
        console.log("connect " + this.url + " failed!");
    });
}

function getAllDevice(page)
{
    $.ajax({
        "url" : sdkPath + "/devices/?page=" + page,
        "type" : "GET",
        "dataType" : "json",
        "contentType" : "application/json",
    }).success(function(data)
    {
        if (data.data && data.data.length)
            $("#NoDataWarning").hide();
        else
            $("#NoDataWarning").show();
        deviceList = data.data;
        createDeviceTable(deviceList);
        curPage = data.currentPage;
        createPagination(data.currentPage, data.totalPage);
    }).fail(function(data)
    {
        if (data.status == 200)
        {
            $("#NoDataWarning").show();
            if (data.responseText != "")
            {
                console.log(data.responseText);
            }
        } else
        {
            console.log(data);
            console.log("connect " + this.url + " failed!");
        }
    });
}

function createDeviceTable(data)
{
    tablestr = "";
    if (data && data.length)
    {
        for (var i = 0; i < data.length; i++)
        {
            tablestr += "<tr data-index=\""
                    + i
                    + "\" data-id=\""
                    + data[i].id
                    + "\">"
                    + "  <td><input type=\"checkbox\" name=\"subject"
                    + data[i].id
                    + "\"></td>"
                    + "  <td>"
                    + data[i].sn
                    + "</td>"
                    + "  <td>"
                    + data[i].name
                    + "</td>"
                    + "  <td>"
                    + data[i].pushUri
                    + "</td>"
                    + "  <td>"
                    + data[i].playUri
                    + "</td>"
                    + "  <td>"
                    + data[i].rtmpStatus
                    + "</td>"
                    + "  <td>"
                    + data[i].recorderStatus
                    + "</td>"
                    + "  <td style=\"width:120px\">"
                    + "    <div class=\"btn-group dropup\">"
                    + "      <button type=\"button\" class=\"btn btn-default btn-sm\" data-toggle=\"modal\" data-target=\"#editDeviceDialog\">编辑</button>"
                    + "      <button type=\"button\" class=\"btn btn-default btn-sm dropdown-toggle\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">"
                    + "        <span class=\"caret\"></span>"
                    + "      </button>"
                    + "      <ul class=\"dropdown-menu\" style=\"min-width:0px\">"
                    + "        <li><a href=\"#delDeviceDialog\" data-toggle=\"modal\">删除</a></li>"
                    + "      </ul>" + "    </div>" + "  </td>" + "</tr>";
        }
    }
    $(".table tbody").html(tablestr);
    
    
  
}
