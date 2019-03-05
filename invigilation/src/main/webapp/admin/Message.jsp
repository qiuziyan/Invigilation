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
<title>通知</title>
<body>
<div class="header">
		<h4 class="header-page">发布通知</h4>
	</div>
	<div class="content">
		<form class="form-horizontal" role="form">
			<div class="form-group">
				<label for="teacher_id" class="col-sm-3 control-label"><h4>标题:</h4></label>
				<div class="col-sm-4">
					<input type = "text" class = "form-control" style="height:60px;font-size:15px" id = "msg_title"></input>
				</div>
			</div>
			<div class="form-group">
				<label for="teacher_id" class="col-sm-3 control-label"><h4>内容:</h4></label>
				<div class="col-sm-4">
					<textarea class="form-control" rows="5" style="height:200px;font-size:15px" id="msg_content"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label for="teacher_id" class="col-sm-3 control-label"><h4>发布日期:</h4></label>
				<div class="col-sm-4">
				 <%
				  java.text.SimpleDateFormat simpleDateFormat=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				    java.util.Date currentTime=new java.util.Date();
				    String time=simpleDateFormat.format(currentTime).toString();
				    %>
					<input type = "text" class = "form-control" style="height:60px;font-size:15px" id = "create_date" value=<%=time %>></input>
				</div>
			</div>
		<!--	<div class="form-group">
		     <label for="inputfile" class="col-sm-3 control-label">文件输入:</label>
		     <input type="file" id="inputfile">
	         </div>-->
			</form>
	
	<div class="col-sm-4"></div>
	<button type="button" class="btn btn-primary" id = "button">发布</button>
        <button type="button" class="btn btn-default" >取消</button>
    </div>    
</body>
<script>
	$(document).ready(function(){
	$(".IDError").hide();
	$("#stu_no").focus(function(){
		$(".IDError").hide();
		$("#button").removeAttr("disabled");
	});
	$("#button").click(function(){
		var info = {};
		info.msg_title = $("#msg_title").val();
		info.msg_content = $("#msg_content").val();
		info.user_name=getCookie('user_name');
		info.create_date=$("#create_date").val();;
		$.ajax({
			url: "service/message/addMessage",
			async: false ,
			method: 'POST',
			data:{'Info' : JSON.stringify(info)},
			success: function (data) {
						alert("添加成功");
						location.href = "<%=path%>/admin/Message.jsp";
			         },
			error:  function(data){
			         	alert("添加失败！");
						location.href = "<%=path%>/admin/Message.jsp";
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
</script>
</html>