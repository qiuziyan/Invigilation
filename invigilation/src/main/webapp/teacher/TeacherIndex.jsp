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
<title>Insert title here</title>
</head>
<body>
	<div class = "top-bar">
		<p class = "title">监考管理系统</p>
		<div class = "top-bar-right">
			<img src="../image/user.png" class = "user">
			<a >你好,<span id = "teacher_name"></span></a>
			<a href="../login.jsp" class = "loginout">退出</a> 
		</div>
	</div>
	<div class = "cantainer">
		<div class = "nav-bar">
			<ul class="nav nav-pills nav-stacked">
			<li class="nav-li active">
				<a class = "frame-a" href="#" value = "../admin/Page.jsp">首页</a>
			</li>
			<li class="nav-li">
				<a class = "nav-a" href="#">我的监考</a>
				<ul class = "nav nav-pills nav-stacked memu-2">
				<li><a class = "frame-a" href="#" value = "Request.jsp">我的申请</a></li>
					<li><a class = "frame-a" href="#" value = "Myinvilation.jsp">监考信息</a></li>
				</ul>
			</li>
			<li class="nav-li">
				<a class = "nav-a" href="#">录入忙碌时间</a>
				<ul class = "nav nav-pills nav-stacked memu-2">
					<li><a class = "frame-a" href="#" value="TimeManage.jsp">时间管理</a></li>
				</ul>
			</li>
			<li class="nav-li">
				<a class = "nav-a" href="#">个人信息</a>
				<ul class = "nav nav-pills nav-stacked memu-2">
					<li><a class = "frame-a" href="#" value = "Info.jsp">个人信息修改</a></li>
					<li><a class = "frame-a" href="#" value = "Reset.jsp">重置密码</a></li>
				</ul>
			</li>
			</ul>
		</div>
		<div class= "content">
			<iframe id = "frame" src="../admin/Page.jsp"></iframe>
			
		</div>
	</div>
</body>
<script>
	$(document).ready(function(){
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
		
		getTeacher();
	});//ready
	function getCookie(name){
		var strCookies = document.cookie;
		var cookies = strCookies.split(";")
		for(var i = 0; i<cookies.length;i++){
			var cookie = cookies[i].split("=");
			if($.trim(cookie[0]) == name)
				return cookie[1];
		} 
		return "";
	};
	
	function getTeacher(){
		$.ajax({
				url : "<%=path%>/service/teacher/getTeacher",
				method : "POST",
				data : {
					teacher_no :  getCookie('teacher_no')
				},
				dataType : 'json',
				success : function(data){
						
						$("#teacher_name").html(data.teacher_name)
				},
				error :function(data){
					alert("获取老师信息失败");
					window.location.reload(true);
				}
			});
	}
</script>
</html>