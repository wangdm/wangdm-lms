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
	var str = "<li role=\"presentation\"><a href=\"#menu"+id+"tab\" aria-controls=\"menu"+id+"tab\" role=\"tab\" data-toggle=\"tab\">"+title+"</a></li>";
	$("#dashboard-tab ul.nav").append(str);
	$("#dashboard-tab  a[href=\"#menu"+id+"tab\"]").tab("show");
}

function refreshTab(){}

function closeTab(){}

