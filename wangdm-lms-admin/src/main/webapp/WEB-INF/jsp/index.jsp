<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="head.jsp"></c:import>
<title>Touch LMS Admin Panel</title>
</head>
<body>

    <c:import url="top.jsp"></c:import>
    
    <div id="dashboard-center">
        <div id="dashboard-menu">
            <div class="menu-bar">
                <div class="menu-btn showmenu"><i class="iconfont">&#xe624;</i></div>
            </div>
            <div class="menu-group" id="accordion">
                <div class="panel">
                    <div class="menu-head">
                        <span>
                            <a href="index" target="bodyFrame"><i class="iconfont">&#xe605;</i> 导航菜单</a>
                        </span>
                        <span class="arrow arrowright hiddenmenu"><i class="iconfont">&#xe625;</i></span>
                    </div>
                </div>
                <c:if test="${not empty menulist}">
                <c:forEach var="menu" items="${menulist}" varStatus="status">
                <div class="panel">
                    <div class="menu-head" data-toggle="collapse" data-parent="#accordion" data-target="#menubody${status.index}" aria-expanded="false">
                        <span>
                            <i class="iconfont">${menu.icon}</i> ${menu.name}
                        </span>
                        <span class="arrow arrowup"><i class="iconfont">&#xe61e;</i></span>
                        <span class="arrow arrowbottom"><i class="iconfont">&#xe623;</i></span>
                    </div>
                    <div id="menubody${status.index}" class="menu-body collapse">
                        <ul class="menu-list">
                            <c:if test="${not empty menu.children}">
                            <c:forEach var="children" items="${menu.children}">
                            <li data-menu="${children.id}" data-action="${children.url}"><a href="${children.url}" target="bodyFrame">${children.name}</a></li>
                            </c:forEach>
                            </c:if>
                        </ul>
                    </div>
                </div>
                </c:forEach>
                </c:if>
            </div>
        </div>
        
        <div id="dashboard-body">
                <div role="tabpanel" class="tab-pane active" id="home">
                       <iframe id="bodyFrame" name="bodyFrame" src="index"></iframe>
                </div>
        </div>
    </div>
    
    <div id="dashboard-footer">
        <nav role="navigation" class="navbar">
            <div id="copyright">Copyright by TouchR&#38;B</div>
        </nav>
    </div>
   
</body>
<script>
$(function(){
    var action = $.cookie("adminMenu");
    if(action){
        $("#"+action).collapse('show');
    }
    var href = $.cookie("adminAction");
    if(href){
        $("#bodyFrame").attr("src", href);
    }
});
</script>
</html>