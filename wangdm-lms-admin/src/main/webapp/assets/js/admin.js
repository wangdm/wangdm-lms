$(function(){
	resizeAdmin();
	$(window).resize(function(){
		resizeAdmin();
	});
	
	$("ul.menu-list").on("click","li", function(){
		var title = $(this).html();
		var url = $(this).data("action");
		console.log("click "+title);
		addTab(title,url);
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

function addTab(title,url){
	var str = "<li role=\"presentation\"><a href=\"#settings\" aria-controls=\"settings\" role=\"tab\" data-toggle=\"tab\">"+title+"</a></li>";
	$("#dashboard-tab ul.nav").append(str);
}

function refreshTab(){}

function closeTab(){}

