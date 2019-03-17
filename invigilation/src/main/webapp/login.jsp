<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>	
<base href="<%=basePath%>">
<link rel="stylesheet" href="css/bootstrap.min.css"> 
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/adminlogin.css" type="text/css"> 
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<h1><font color=black>监考安排管理系统</font></h1>
	<div class="container w3layouts agileits">
		<div class="login w3layouts agileits">
			<h2>登 录</h2>
			<form class="form-horizontal" role="form">
				<input id ="name" type="text" name="ID" placeholder="用户名" required="">
			<div class = "nameError"></div>
				<input id ="pwd"  type="password" name="password" placeholder="密码" required="">
				<div class="pwdError"></div>
				<select id="type" name="type">
					<option value =0>管理员</option>
					<option value =2>学生</option>
					<option value =1>教师</option>
				</select>
			<div class="send-button w3layouts agileits">
				<input type="button" value="登 录" onclick= "check()">
			</div>
			</form>
			<div class="clear"></div>
		</div>
		<div class="clear"></div>
	</div>
	<div class="footer w3layouts agileits">
		<p>Copyright &copy;南京工程学院计算机工程学院 <a href="http://www.baidu.com/" target="_blank" ></a></p>
	</div>
</body>
	<script>
		$(document).ready(function(){
			$("#name").focus(function(){
				$(".nameError").hide();
			});
			$("#pwd").focus(function(){
				$(".pwdError").hide();
			});
		});
		
		function check(){
			var ID = $("#name").val();
			var pwd  = $("#pwd").val();
			var type = $("#type").val();
			var nameReg = /^[0-9]{1,10}$/;
			var pwdReg=/^.{6,16}$/
			if(!nameReg.test(ID)){
				$(".nameError").html("<p>用户账号为1到10个数字组成</p>");
				$(".nameError").show();
				return false;
			}
			if(!pwdReg.test(pwd)){
				$(".pwdError").text("密码应由6到16个字符组成");
				$(".pwdError").show();
				return false;
			}
			login(ID,pwd,type);
		}
		function login(ID,pwd,type){
			$.ajax({
				url : "service/login",
				method : "POST",
				data : {
					ID : ID,
					password : pwd,
					type : type
				},
				success : function(data){
					if(data == "admin"){
						document.cookie ="user_name="+ID;
						window.location.replace("http://localhost:8080/Invigilation/admin/AdminIndex.jsp");
					}
					if(data == "student"){
						document.cookie = "stu_no="+ID;
						window.location.replace("http://localhost:8080/Invigilation/student/StudentIndex.jsp");
					}
					if(data == "teacher"){
						document.cookie = "teacher_no="+ID;
						window.location.replace("http://localhost:8080/Invigilation/teacher/TeacherIndex.jsp");
					}
					else{
						alert("欢迎进入监考管理系统！");
					}
				},
				error :function(date){
					alert("浏览器出错");
				}
			});
		}
	</script>
</html>