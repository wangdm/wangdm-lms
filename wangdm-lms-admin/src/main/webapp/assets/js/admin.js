$(function(){
	resizeAdmin();
	$(window).resize(function(){
		resizeAdmin();
	});
	
	$("ul.menu-list").on("click","li", function(){
		var title = $(this).html();
		var url = $(this).data("action");
		var id = $(this).data("menu");
		var href = "#menu"+id+"tab";
		if($("#dashboard-tab  a[href=\""+href+"\"]").size()>=1){
			$("#dashboard-tab  a[href=\""+href+"\"]").tab("show");
		}else{
			addTab(id,title,url);
		}
	});
	
	$("#dashboard-tab span.action-refresh").on("click",function(){
		refreshTab();
	});
	$("#dashboard-tab span.action-delete").on("click",function(){
		closeTab();
	});
});

function resizeAdmin(){
	var centerHeight = $(window).height()-$("#dashboard-top").height()-$("#dashboard-footer").height();
	$("#dashboard-center").css("height",centerHeight);
	$("#dashboard-center").css("max-height",centerHeight);
	
	var menubodyHeight = centerHeight - ($("#dashboard-menu .menu-head").height()+1)*$("#dashboard-menu .menu-head").size()+1;
	$("#dashboard-menu .menu-list").css("height",menubodyHeight);
	$("#dashboard-menu .menu-list").css("max-height",menubodyHeight);
	
	var bodyWidth = $(window).width()-$("#dashboard-menu").width();
	$("#dashboard-body").css("width",bodyWidth);
	$("#dashboard-body").css("max-width",bodyWidth);
	
}

function addTab(id,title,url){
	var menu = "menu"+id+"tab";
	var tabStr = "<li role=\"presentation\" data-url=\""+url+"\"><a href=\"#"+menu+"\" aria-controls=\""+menu+"\" role=\"tab\" data-toggle=\"tab\">"+title+"</a></li>";
	var contentStr = "<div role=\"tabpanel\" class=\"tab-pane\" id=\""+menu+"\"></div>";
	$("#dashboard-tab ul.nav").append(tabStr);
	$("#dashboard-content").append(contentStr);
	$("#dashboard-tab  a[href=\"#"+menu+"\"]").tab("show");
	$.ajax({
		"url":url,
        "type": "get"
	}).success(function(data){
		$("#dashboard-content div[id='"+menu+"']").html(data);
	}).fail(function(data){
		console.log("connect "+this.url+" failed with "+data);
	});
}

function refreshTab(){
	var current = $("#dashboard-tab li.active");
	var href = $(current).children("a").attr("href").substr(1);
	var url = $("#dashboard-tab li.active").data("url");
	$.ajax({
		"url":url,
        "type": "get"
	}).success(function(data){
		$("#dashboard-content div[id='"+href+"']").html(data);
	}).fail(function(data){
		console.log("connect "+this.url+" failed with "+data);
	});
}

function closeTab(){
	var current = $("#dashboard-tab li.active");
	var href = $(current).children("a").attr("href").substr(1);
	if(href!="home"){
		$(current).remove();
		$("#dashboard-content div[id='"+href+"']").remove();
		$("#dashboard-tab a:last").tab("show");
	}
}

