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
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/bootstrap-table.css" rel="stylesheet">
<link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link href="../css/adminindex.css" rel="stylesheet">
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/bootstrap-table.js"></script>
<script src="../js/bootstrap-table-zh-CN.js"></script>
<script src="../js/bootstrap-datetimepicker.min.js"></script>
<script src="../js/bootstrap-datetimepicker.fr.js"></script>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<div class = "top-bar">
		<p class = "title">监考管理系统</p>
		<div class = "top-bar-right">
			<img src="../image/user.png" class = "user">
			<a>你好,管理员</a>
			<a href="../login.jsp" class = "loginout">退出</a> 
		</div>
	</div>
	<div class = "cantainer">
		<div class = "nav-bar">
			<ul  class="nav nav-pills nav-stacked" >
			<li class="nav-li active">
				<a class = "frame-a" href="#" value = "../admin/Page.jsp">首页</a>
			</li>
			<li class="nav-li">
				<a class = "nav-a" href="#">监考管理</a>
				<ul class = "nav nav-pills nav-stacked memu-2">
					<li><a class = "frame-a" href="#" value = "../admin/baseInfo/InvigilateManage.jsp">监考管理</a></li>
				</ul>
			</li>
			<li class="nav-li">
				<a class = "nav-a" href="#">基础信息管理</a>
				<ul class = "nav nav-pills nav-stacked memu-2">
					<li><a class = "frame-a" href="#" value="../admin/baseInfo_course/CourseManage.jsp">课程管理</a></li>
					<li><a class = "frame-a" href="#" value="../admin/baseInfo_room/RoomManage.jsp">教室管理</a></li>
					<li><a class = "frame-a" href="#" value="../admin/baseInfo_class/ClassManage.jsp">班级管理</a></li>
					<li><a class = "frame-a" href="#" value="../admin/baseInfo_depart/DepartManage.jsp">院系管理</a></li>
					<li><a class = "frame-a" href="#"value="../admin/baseInfo_teacher/TeacherManage.jsp">教师信息管理</a></li>
				</ul>
			</li>
			<li class="nav-li">
				<a class = "nav-a" href="#">监考统计</a>
				<ul class = "nav nav-pills nav-stacked memu-2">
					<li><a class = "frame-a" href="#" value = "../admin/Statistics.jsp">教师出勤统计</a></li>
				</ul>
			</li>
			<li class="nav-li">
				<a class = "nav-a" href="#">通知</a>
				<ul class = "nav nav-pills nav-stacked memu-2">
					<li><a class = "frame-a" href="#" value = "../admin/Message.jsp">发布通知</a></li>
				</ul>
			</li>
			</ul>
		</div>
		<div class= "content">
			<iframe id = "frame" src="./Page.jsp"></iframe>
		</div>
	</div>
</body>
<script>
	$(document).ready(function(){
		$('#start_time').datetimepicker({
			format: 'yyyy-mm-dd hh:ii'      /*此属性是显示顺序，还有显示顺序是mm-dd-yyyy*/
			});
		$('#end_time').datetimepicker({
			format: 'yyyy-mm-dd hh:ii'      /*此属性是显示顺序，还有显示顺序是mm-dd-yyyy*/
			});
		$(".nav-a").click(function(){
		    $(".nav-li").removeClass("active");  
            $(this).parent().addClass("active");  
			var div = $(this).next()
			if(div.is(':visible')){
				div.hide();
			}else{
				div.show();
			}
			
		})
		$(".frame-a").click(function(){
			$('iframe').attr('src',$(this).attr("value"));
		})
	});
	function getCookie(name){
		var strCookies = document.cookie;
		var cookies = strCookies.split(";")
		for(var i = 0; i<cookies.length;i++){
			var cookie = cookies[i].split("=");
			if(cookie[0] == name)
				return cookie[1];
		} 
		return "";
	}
</script>
</html>