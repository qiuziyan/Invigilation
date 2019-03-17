<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path %>/css/bootstrap-table.css" rel="stylesheet">
<script src="<%=path %>/js/jquery-3.3.1.min.js"></script>
<script src="<%=path %>/js/bootstrap.min.js"></script>
<script src="<%=path %>/js/bootstrap-table.js"></script>
<script src="<%=path %>/js/bootstrap-table-zh-CN.js"></script>
<script src="<%=path %>/js/bootstrap-datetimepicker.min.js"></script>
<script src="<%=path %>/js/bootstrap-datetimepicker.fr.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>重置密码</title>
<body>
<div class="header">
		<h4 class="header-page">重置密码</h4>
	</div>
	<div class="content">
		<form class="form-horizontal" role="form">
			<div class="form-group">
				<label for="teacher_id" class="col-sm-3 control-label">用户名:</label>
				<div class="col-sm-4">
					<input type = "text" class = "form-control" id = "user_name" disabled></input>
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">账户密码:</label>
				<div class="col-sm-4">
					<input type = "text" class = "form-control" id="password"></input>
				</div>
			</div>
			</form>
	<div class="col-sm-4"></div>
	<button type="button" class="btn btn-primary" id = "button">确认</button>
        <button type="button" class="btn btn-default" >取消</button>
    </div>    
</body>
<script>
	$(document).ready(function(){
		getStudent();
	$(".IDError").hide();
	$("#user_name").focus(function(){
		$(".IDError").hide();
		$("#button").removeAttr("disabled");
	});
	//课程id失去焦点 则执行查重方法 若已存在此ID 则有提示内容 并且按钮设为禁止
	$("#user_name").blur(function () {  
		$.ajax({
		 url: "service/student/UniquenessCheckForStudent",  
            method: 'POST',    
            data : {
				stu_no :  getCookie('stu_no')
			},
            success: function (data) {
            	if(data != "ok"){
            		$(".IDError").show();
            		$("#button").attr({"disabled":"disabled"});
            	}
            	else{
            		
            	}
            },
            error: function(data){
            	alert("学号唯一校验失败")
            	$("#button").attr({"disabled":"disabled"});
            }
		});
	});	
	$("#button").click(function(){
		var info = {};
		info.user_name = $("#user_name").val();
		info.password = $("#password").val();
		$.ajax({
			url: "service/user/modifyUser",
			async: false ,
			method: 'POST',
			data:{'Info' : JSON.stringify(info)},
			success: function (data) {
					if(data == "ok"){
						alert("修改成功");
						location.href = "<%=path%>/student/Reset.jsp";
					}
					else{
						alert("修改失败");
						location.href = "<%=path%>/student/Reset.jsp";
					}
			         },
			error:  function(data){
			         	alert("修改失败！");
						location.href = "<%=path%>/student/Reset.jsp";
			         }
		});
	});
	
	});
function getCookie(name){
	var strCookies = document.cookie;
	var cookies = strCookies.split(";")
	for(var i = 0; i<cookies.length;i++){
		var cookie = cookies[i].split("=");
		if(name == $.trim(cookie[0]))
			return cookie[1];
	} 
	return "";
}
function getStudent(){
	$.ajax({
			url : "<%=path%>/service/user/getUser",
			method : "POST",
			data : {
				user_name:getCookie('stu_no')
			},
			dataType : 'json',
			success : function(data){
					$("#user_name").val(data.user_name);
			    	$("#password").val(data.password);
			},
			error :function(data){
				alert("获取学生信息失败");
			}
		});
}
</script>
</html>