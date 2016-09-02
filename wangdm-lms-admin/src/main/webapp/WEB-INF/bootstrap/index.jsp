<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<#include "head.jsp">
<title>Wangdm LMS Admin Panel</title>
</head>
<body>

    <div id="dashboard-top">
        <nav role="navigation" class="navbar">
            
        </nav>
    </div>
    
    <div id="dashboard-center">
    
        <div id="dashboard-menu">
            <div class="panel-group" id="accordion">
                <#if memulist??>
                <#list memulist as memu >
                <div class="panel">
                    <div class="menu-head" data-toggle="collapse" data-parent="#accordion" data-target="#menubody${memu?counter}">
                        <span>
                            <i class="iconfont">${memu.icon}</i> ${memu.name}
                        </span>
                    </div>
                    <div id="menubody${memu?counter}" class="menu-body collapse">
                        <ul class="menu-list">
                            <#if memu.children??>
                            <#list memu.children as children >
                            <li data-menu="${children.id}">${children.name}</li>
                            </#list>
                            </#if>
                        </ul>
                    </div>
                </div>
                </#list>
                </#if>
            </div>
        </div>
        
        <div id="dashboard-body">
        
            <div id="dashboard-tab">
				<ul class="nav nav-tabs" role="tablist">
				  <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Home</a></li>
				</ul>
            </div>
            
            <div id="dashboard-content">
            </div>
            
        </div>
        
    </div>
    
    <div id="dashboard-footer">
        <nav role="navigation" class="navbar">
            <div id="copyright">Copyright by Wangdm</div>
        </nav>
    </div>

</body>
</html>