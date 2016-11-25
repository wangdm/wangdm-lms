$(function(){
	resizeAdmin();
	$(window).resize(function(){
		resizeAdmin();
	});
	
	var menuType = $.cookie("menu-type");
	if(menuType=="menu-bar"){
		showFullMenu(false);
	}

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
	
	$("#dashboard-menu .hiddenmenu").on("click",function(){
		showFullMenu(false);
	});
	$("#dashboard-menu .showmenu").on("click",function(){
		showFullMenu(true);
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
	$("#dashboard-menu .menu-group .menu-list").css("height",menubodyHeight);
	$("#dashboard-menu .menu-group .menu-list").css("max-height",menubodyHeight);
	
	var bodyWidth = $(window).width()-$("#dashboard-menu").width();
	$("#dashboard-body").css("width",bodyWidth);
	$("#dashboard-body").css("max-width",bodyWidth);
    
    var contentHeight = $("#dashboard-body").height() - $("#dashboard-tab").height();
    $("#dashboard-content").css("height",contentHeight);
    $("#dashboard-content").css("max-height",contentHeight);
	
}

function showFullMenu(show){
	var width = 180;
	if(show){
		width = 180;
		$("#dashboard-menu .menu-bar").hide();
		$("#dashboard-menu .menu-group").show();
		$.cookie("menu-type", "menu-group");
	}else{
		width = 40;
		$("#dashboard-menu .menu-bar").show();
		$("#dashboard-menu .menu-group").hide();
		$.cookie("menu-type", "menu-bar");
	}
	var bodyWidth = $(window).width()-width;
	$("#dashboard-menu").width(width);
	$("#dashboard-body").css("width",bodyWidth);
	$("#dashboard-body").css("max-width",bodyWidth);
}

function addTab(id,title,url){
	var menu = "menu"+id+"tab";
	var tabStr = "<li role=\"presentation\" data-url=\""+url+"\"><a href=\"#"+menu+"\" aria-controls=\""+menu+"\" role=\"tab\" data-toggle=\"tab\">"+title+"</a></li>";
	var contentStr = "<div role=\"tabpanel\" class=\"tab-pane\" id=\""+menu+"\"><iframe src=\""+url+"\" frameborder=\"0\"></iframe></div>";
	$("#dashboard-tab ul.nav").append(tabStr);
	$("#dashboard-content").append(contentStr);
	$("#dashboard-tab  a[href=\"#"+menu+"\"]").tab("show");
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

