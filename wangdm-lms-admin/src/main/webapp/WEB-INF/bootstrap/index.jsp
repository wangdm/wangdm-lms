<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<#include "head.jsp">
<title>Wangdm LMS Admin Panel</title>
</head>
<body>

    <#include "top.jsp">
    
    <div id="dashboard-center">
    
        <div id="dashboard-menu">
            <div class="menu-bar">
                <div class="menu-btn showmenu"><i class="iconfont">&#xe624;</i></div>
                <#if menulist??>
                <#list menulist as menu >
                <div class="menu-item">
	                <div class="menu-btn"><i class="iconfont">${menu.icon}</i></div>
                    <#if menu.children??>
	                <div class="menu-body">
	                    <div class="bar-blank"></div>
	                    <ul class="menu-list">
	                        <#list menu.children as children >
	                        <li data-menu="${children.id}" data-action="${children.url}">${children.name}</li>
	                        </#list>
	                    </ul>
	                </div>
                    </#if>
	            </div>
                </#list>
                </#if>
            </div>
            <div class="menu-group" id="accordion">
                <div class="panel">
                    <div class="menu-head" data-toggle="collapse" data-parent="#accordion" data-target="" aria-expanded="false">
                        <span>
                            <i class="iconfont">&#xe605;</i> 导航菜单
                        </span>
                        <span class="arrow arrowright hiddenmenu"><i class="iconfont">&#xe625;</i></span>
                    </div>
                </div>
                <#if menulist??>
                <#list menulist as menu >
                <div class="panel">
                    <div class="menu-head" data-toggle="collapse" data-parent="#accordion" data-target="#menubody${menu?counter}" aria-expanded="false">
                        <span>
                            <i class="iconfont">${menu.icon}</i> ${menu.name}
                        </span>
                        <span class="arrow arrowup"><i class="iconfont">&#xe61e;</i></span>
                        <span class="arrow arrowbottom"><i class="iconfont">&#xe623;</i></span>
                    </div>
                    <div id="menubody${menu?counter}" class="menu-body collapse">
                        <ul class="menu-list">
                            <#if menu.children??>
                            <#list menu.children as children >
                            <li data-menu="${children.id}" data-action="${children.url}">${children.name}</li>
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
                <div class="tab-list">
					<ul class="nav nav-tabs" role="tablist">
					    <li role="presentation" class="active" data-url="home"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Home</a></li>
					</ul>
                </div>
				<div class="tab-action">
                    <span role="button" class="action-refresh"><i class="iconfont">&#xe60e;</i></span>
				    <span role="button" class="action-delete"><i class="iconfont">&#xe610;</i></span>
				</div>
            </div>
            
            <div id="dashboard-content" class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="home">
                    <iframe src="index" frameborder="0"></iframe>
                </div>
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