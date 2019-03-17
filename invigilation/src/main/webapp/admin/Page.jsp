<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">
<link rel="stylesheet" href="<%=path %>/css/bootstrap.min.css">
<link href="<%=path%>/css/bootstrap-table.css" rel="stylesheet">
	<script src="<%=path %>/js/jquery-3.3.1.min.js"></script>
	<script src="<%=path %>/js/bootstrap.min.js"></script>
	<script src="<%=path%>/js/bootstrap-table.js"></script>
<script src="<%=path%>/js/bootstrap-table-zh-CN.js"></script>
<title>通知</title>
</head>
<body>
<div class="carousel slide" id="myCarousel">
		<ol class="carousel-indicators">
				<li class="active" data-slide-to="0" data-target="#myCarousel"></li>
				<li data-slide-to="1" data-target="#myCarousel" class=""></li>
				<li data-slide-to="2" data-target="#myCarousel" class=""></li>
		</ol>
	<div class="carousel-inner">
		<div class="item active">
			 <img alt="" src="./image/timg.jpg" width="1200" >
					<div class="carousel-caption">
					<h4>First Thumbnail label</h4>
					</div>
		</div>
		<div class="item">
				<img alt="" src="./image/timg13.jpg" width="1200">
					<div class="carousel-caption">
					<h4>Second Thumbnail label</h4>
					</div>
		</div>
		<div class="item">
				<img alt="" src="./image/timg2.jpg" width="1200" >
					<div class="carousel-caption">
					<h4>Third Thumbnail label</h4>
					</div>
		</div>
</div>

	<a class="left carousel-control" href="#myCarousel" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left"></span>
	</a>
	<a class="right carousel-control" href="#myCarousel" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right"></span>
	</a>
</div>
   <table id="tb_message">
       </table>
</body>
<script type="text/javascript">
$(document).ready(function(){
	InitTable();
	$("#tb_message").on('click','.look',function(e){
	    var message_id=$(this).attr("data-value");
	   	window.location.href = "<%=path%>/admin/messageLook.jsp?message_id="+message_id;
	});
});
function queryParams(params) { 
 var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的 
 };  
 return temp;  
}; 
function InitTable(){
			$('#tb_message').bootstrapTable({
	            url: "<%=path%>"+"/service/message/getTitleList", 
	            contentType : "application/x-www-form-urlencoded",                           //请求后台的URL（*）
	            method: 'post',                      //请求方式（*）
	//             toolbar: '#toolbar',                //工具按钮用哪个容器
	  //          striped: true,                      //是否显示行间隔色
	            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
	       //     pagination: true,                   //是否显示分页（*）
	            sortable: false,                     //是否启用排序
	            sortOrder: "asc",                   //排序方式
	            queryParams: queryParams,                   //传递参数（*）
	            sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
	            pageNumber:1,                       //初始化加载第一页，默认第一页
	            pageSize: 10,                       //每页的记录行数（*）
	            pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
	//            search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
	          border:0,
	//            strictSearch: true,
	//            showColumns: true,                  //是否显示所有的列
	//            showRefresh: true,                  //是否显示刷新按钮
	            minimumCountColumns: 2,             //最少允许的列数
	            clickToSelect: true,                //是否启用点击选中行
	//            height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
	            uniqueId: "message_id",                     //每一行的唯一标识，一般为主键列
	//            showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
	            cardView: false,                    //是否显示详细视图
	            detailView: false,                   //是否显示父子表
	            columns: [{
	                field: 'msg_title',
	                title: '通知',
	                formatter : function (value, row, index) {
		                return 	"<a data-value= '"+row.message_id+"' class = 'look'>"+row.msg_title+"</a>";                	
	                }
	            }]
	        });
	    };
	    </script>
</html>