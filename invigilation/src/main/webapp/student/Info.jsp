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
<link href="<%=path %>/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link href="<%=path %>/css/inviManage.css" rel="stylesheet">
<script src="<%=path %>/js/jquery-3.3.1.min.js"></script>
<script src="<%=path %>/js/bootstrap.min.js"></script>
<script src="<%=path %>/js/bootstrap-table.js"></script>
<script src="<%=path %>/js/bootstrap-table-zh-CN.js"></script>
<script src="<%=path %>/js/bootstrap-datetimepicker.min.js"></script>
<script src="<%=path %>/js/bootstrap-datetimepicker.fr.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生管理</title>
<body>
<div class="header">
		<h4 class="header-page">修改个人信息</h4>
	</div>
	<div class="content">
		<form class="form-horizontal" role="form">
			<div class="form-group">
				<label for="teacher_id" class="col-sm-3 control-label">学号:</label>
				<div class="col-sm-4">
					<input type = "text" class = "form-control" id = "stu_no" disabled></input>
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">学生姓名:</label>
				<div class="col-sm-4">
					<input type = "text" class = "form-control" id = "stu_name"></input>
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">手机号码:</label>
				<div class="col-sm-4">
					<input type = "text" class = "form-control" id = "stu_phone"></input>
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">邮箱:</label>
				<div class="col-sm-4">
					<input type = "text" class = "form-control" id = "email"></input>
				</div>
			</div>
			<div class="form-group">
				<label for="department" class="col-sm-3 control-label">所属院系:</label>
				<div class="col-sm-4">
					<input type = "text" class = "form-control" id = "depart" disabled></input>
				</div>
			</div>
			<div class="form-group">
				<label for="department" class="col-sm-3 control-label">所属班级:</label>
				<div class="col-sm-4">
					<input type = "text" class = "form-control" id = "class" disabled></input>
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">宿舍号:</label>
				<div class="col-sm-4">
					<input type = "text" class = "form-control" id = "dom_name"></input>
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
		// InitDepartment();
	$(".IDError").hide();
	$("#stu_no").focus(function(){
		$(".IDError").hide();
		$("#button").removeAttr("disabled");
	});
	//课程id失去焦点 则执行查重方法 若已存在此ID 则有提示内容 并且按钮设为禁止
	$("#stu_no").blur(function () {  
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
		info.stu_no = $("#stu_no").val();
		info.stu_name = $("#stu_name").val();
		info.stu_phone = $("#stu_phone").val();
		info.email = $("#email").val();
	//	info.depart= $("#depart").val();
//		info.class_name= $("#class").val();
		info.dom_name = $("#dom_name").val();
		$.ajax({
			url: "service/student/modifyStudent",
			async: false ,
			method: 'POST',
			data:{'Info' : JSON.stringify(info)},
			success: function (data) {
					if(data == "ok"){
						alert("修改成功");
						location.href = "<%=path%>/student/Info.jsp";
					}
					else{
						alert("修改失败");
						location.href = "<%=path%>/student/Info.jsp";
					}
			         },
			error:  function(data){
			         	alert("修改失败！");
						location.href = "<%=path%>/student/Info.jsp";
			         }
		});
	});
	
	});
function InitDepartment(){
		$.ajax({
		 url: "service/dept/getDepartList",  
            method: 'POST',    
            data: "",
            dataType :"JSON",
            success: function (data) {
            	//data为[{"teacherID":"10001","teacherName":"彭焕峰"},{"teacherID":"10003","teacherName":"物理老师"}]
            	//这样的数组，用循环遍历之后拼接字符串生产对应<option>
            	var htmlText = "";
            	$("#depart").html(htmlText);
            	for(var i = 0; i <data.length; i++){
            		htmlText = htmlText + "<option value ='"+data[i].dept_id+"'>"+data[i].dept_name+"</option>";
            	}
            	$("#depart").html(htmlText);
            },
            error: function(data){
            	alert("初始化失败");
            }
		}) 
};
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
			url : "<%=path%>/service/student/getStudent",
			method : "POST",
			data : {
				stu_no :  getCookie('stu_no')
			},
			dataType : 'json',
			success : function(data){
					$("#stu_name").val(data.stu_name);
					$("#stu_no").val(data.stu_no);
					$("#stu_name").val(data.stu_name);
		     		$("#stu_phone").val(data.stu_phone);
	                $("#email").val(data.email);
			    	$("#dom_name").val(data.dom_name);
			    	$("#depart").val(data.depart.dept_name);
			    	$("#class").val(data.classes.class_name);
			},
			error :function(data){
				alert("获取学生信息失败");
			}
		});
}
</script>
</html>