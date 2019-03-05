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
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap-table.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link href="<%=path%>/css/inviManage.css" rel="stylesheet">
<link href="<%=path%>/css/bootstrap-select.css" rel="stylesheet">
<script src="<%=path%>/js/jquery-3.3.1.min.js"></script>
<script src="<%=path%>/js/bootstrap.min.js"></script>
<script src="<%=path%>/js/bootstrap-table.js"></script>
<script src="<%=path%>/js/bootstrap-table-zh-CN.js"></script>
<script src="<%=path%>/js/bootstrap-datetimepicker.min.js"></script>
<script src="<%=path%>/js/bootstrap-datetimepicker.fr.js"></script>
<script src="<%=path%>/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="<%=path%>/js/bootstrap-select.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="content">
		<form class="form-horizontal" role="form">
			<div class="form-group">
				<div class="col-sm-4">
					<label  class=" control-label" style="font-size:25px" id = "msg_title"></label>
				</div>
			</div>	
			<div class="form-group">
				<div class="col-sm-4">
					<label  class=" control-label" id = "msg_content"></label>
				</div>
			</div>	
	
			</form>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		var message_id = getID();
		InitMessage(message_id);
	});//ready
	function InitMessage(message_id){
		$.ajax({
			 url:  "<%=path%>"+"/service/message/getMessage",  
	         method: 'POST',
	         data :{message_id: message_id},
	         dataType :"JSON",
	         success: function (data) {
	         	$("#msg_title").html(data.msg_title);
	         	$("#msg_content").html(data.msg_content);
	         },
	         error: function(data){
	         	alert("获取信息失败！");
	         }
		}) 
	}
	function getID(){
		var locationStr = location.href;
		var param = locationStr.split("?");
		var param1 = param[1].split("=");
		return param1[1];
	};
</script>
</html>