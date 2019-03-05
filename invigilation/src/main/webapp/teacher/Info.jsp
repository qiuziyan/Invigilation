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
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap-table.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link href="<%=path%>/css/inviManage.css" rel="stylesheet">
<script src="<%=path%>/js/jquery-3.3.1.min.js"></script>
<script src="<%=path%>/js/bootstrap.min.js"></script>
<script src="<%=path%>/js/bootstrap-table.js"></script>
<script src="<%=path%>/js/bootstrap-table-zh-CN.js"></script>
<script src="<%=path%>/js/bootstrap-datetimepicker.min.js"></script>
<script src="<%=path%>/js/bootstrap-datetimepicker.fr.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师管理</title>
<body>
<div class="header">
		<h4 class="header-page">修改个人信息</h4>
	</div>
	<div class="content">
		<form class="form-horizontal" role="form">
			<div class="form-group">
				<label for="teacher_id" class="col-sm-3 control-label">教师工号:</label>
				<div class="col-sm-4">
					<input type = "text" class = "form-control" id="teacher_no" disabled></input>
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">教师姓名:</label>
				<div class="col-sm-4">
					<input type = "text" class = "form-control" id="teacher_name"></input>
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">所在部门:</label>
				<div class="col-sm-4">
					<input type = "text" class = "form-control" id="section" disabled></input>
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">联系方式:</label>
				<div class="col-sm-4">
					<input type = "text" class = "form-control" id="teacher_phone"></input>
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">邮箱:</label>
				<div class="col-sm-4">
					<input type = "text" class = "form-control" id="email"></input>
				</div>
			</div>
			</form>
			<div class = "col-sm-4"></div>
				<button type="button" class="btn btn-primary" id = "button">确认</button>
        <button type="button" class="btn btn-default" >取消</button>
	</div>
</body>
<script>
	$(document).ready(function(){
		getTeacher();
	$(".IDError").hide();
	$("#teacher_no").focus(function(){
		$(".IDError").hide();
		$("#button").removeAttr("disabled");
	});
	//课程id失去焦点 则执行查重方法 若已存在此ID 则有提示内容 并且按钮设为禁止
	$("#teacher_no").blur(function () {  
		$.ajax({
		 url: "service/teacher/UniquenessCheckForTeacher",  
            method: 'POST',    
            data : {
				teacher_no :  getCookie('teacher_no')
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
            	alert("工号唯一校验失败")
            	$("#button").attr({"disabled":"disabled"});
            }
		});
	});	
	$("#button").click(function(){
		var info = {};
		info.teacher_no = $("#teacher_no").val();
		info.teacher_name = $("#teacher_name").val();
		info.teacher_phone = $("#teacher_phone").val();
		info.email = $("#email").val();
	
		$.ajax({
			url: "service/teacher/modifyteacher",
			async: false ,
			method: 'POST',
			data:{'Info' : JSON.stringify(info)},
			success: function (data) {
					if(data == "ok"){
						alert("修改成功");
						location.href = "<%=path%>/teacher/Info.jsp";
					}
					else{
						alert("修改失败");
						location.href = "<%=path%>/teacher/Info.jsp";
					}
			         },
			error:  function(data){
			         	alert("修改失败！");
						location.href = "<%=path%>/teacher/Info.jsp";
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
function getTeacher(){
	$.ajax({
			url : "<%=path%>/service/teacher/getTeacher",
			method : "POST",
			data : {
				teacher_no :  getCookie('teacher_no')
			},
			dataType : 'json',
			success : function(data){
					$("#teacher_no").val(data.teacher_no);
					$("#teacher_name").val(data.teacher_name);
		     		$("#teacher_phone").val(data.teacher_phone);
	                $("#email").val(data.email);
	                $("#section").val(data.section.section_name);
			},
			error :function(data){
				alert("获取教师信息失败");
			}
		});
}
</script>
</html>