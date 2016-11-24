<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div id="dashboard-top">
        <nav role="navigation" class="navbar">
          <div style="float:left;">
            <a style="float: left;" href="${modularConfig.webHostUrl}" target="_blank">
                <img src="${contextPath}/assets/images/dashboard.png"/>
            </a>
          </div>
          <div style="line-height: 50px;padding-right:20px;float: right;">
            <a style="float: right;" href="${contextPath}/logout">Logout</a>
            <div style="float: right;">&nbsp;&nbsp;|&nbsp;&nbsp;</div>
            <a style="float: right;" href="${contextPath}/#">Welcome, ${loginUser.username}</a>
          </div>
        </nav>
    </div>