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
	<div class="header">
		<h4 class="header-page">修改监考信息</h4>
	</div>
	<div class="content">
		<form class="form-horizontal" role="form">
			<div class="form-group">
				<label for="department" class="col-sm-4 control-label">学期:</label>
				<div class="col-sm-4">
					<select id = "semester" class = "form-control">
					</select>
				</div>
			</div>	
			<div class="form-group">
				<label for="department" class="col-sm-4 control-label">考试名称:</label>
				<div class="col-sm-4">
				<input type="text" class="form-control" id = "exam_name">
				</div>
			</div>	
			<div class="form-group">
				<label for="department" class="col-sm-4 control-label">考试类型:</label>
				<div class="col-sm-4">
					<select class = "form-control" id = "type">
					</select>
				</div>
			</div>	
			<div class="form-group">
				<label for="department" class="col-sm-4 control-label">考试地点:</label>
				<div class="col-sm-4">
				<select class="form-control" id = "room" disabled>
						
				</select>
				</div>
			</div>	
			<div class="form-group">
				<label for="name" class="col-sm-4 control-label">周次:</label>
				<div class="col-sm-4">
				<select class="form-control" id="week">
					<option value =1>第一周</option><option value =2>第二周</option>
					<option value =3>第三周</option><option value =4>第四周</option>
					<option value =5>第五周</option><option value =6>第六周</option>
					<option value =7>第七周</option><option value =8>第八周</option>
					<option value =9>第九周</option><option value =10>第十周</option>
					<option value =11>第十一周</option><option value =12>第十二周</option>
					<option value =13>第十三周</option><option value =14>第十四周</option>
					<option value =15>第十五周</option><option value =16>第十六周</option>
					<option value =17>第十七周</option><option value =18>第十八周</option>
					<option value =19>第十九周</option>
				</select>
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-4 control-label">考试时间</label>
				<div class="col-sm-4">
					<input type="text" class="form-control Time" id="start_date">~
					<input type="text" class="form-control Time"id="end_date">
				</div>
			</div>
			<div class="form-group">
				<label for="department" class="col-sm-4 control-label">监考老师:</label>
				<div class="col-sm-4" id = "teacherDiv">
					<select class="form-control selectpicker" multiple id = "teachers">
				</select>
				</div>
			</div>
			<div class="form-group">
				<label for="department" class="col-sm-4 control-label">院系:</label>
				<div class="col-sm-4">
					<select class="form-control"  id = "depart">
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="department" class="col-sm-4 control-label">考试班级:</label>
				<div class="col-sm-4" id="classDiv">
				<select class="form-control selectpicker" multiple id = "classes">
				</select>
				</div>
			</div>
			<div class="form-group">
				<label for="teacher_id" class="col-sm-4 control-label">创建日期:</label>
				<div class="col-sm-4">
				 <%
				  java.text.SimpleDateFormat simpleDateFormat=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				    java.util.Date currentTime=new java.util.Date();
				    String time=simpleDateFormat.format(currentTime).toString();
				    %>
					<input type = "text" class = "form-control" id = "create_date" value=<%=time %> disabled></input>
				</div>
			</div>
				<div class = "col-sm-4"></div>
				<button type="button" class="btn btn-primary" id = "button">确定</button>
				    <button type="reset" class="btn btn-default active" onclick="location.href='javascript:history.go(-1);'" >取消</button>
			</form>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		$('#start_date').datetimepicker({    
			format: 'yyyy-mm-dd hh:ii'      
		}); 
		$('#end_date').datetimepicker({    
			format: 'yyyy-mm-dd hh:ii'       
		});
		InitSemester();
		InitType();
	//	InitRoom();
		InitDeparment();
		InitInvi();
		$('#button').click(function(){
			var info = {};
			info.exam_id= getID();
	        info.semester_id= $("#semester").val();
	        info.exam_type_id= $("#type").val();
	        info.exam_name = $("#exam_name").val();
	        info.create_date = $("#create_date").val();
			info.start_date = $("#start_date").val();
			info.week=$("#week").val();
			info.end_date= $("#end_date").val();
			info.teachers =	$("#teachers").val();
			info.room_id= $("#room").val();
			info.classes = $("#classes").val();
			$.ajax({
				url: "<%=path%>/service/invigilate/modifyInvigilate",
				async: false ,
				method: 'POST',
				data:{'Info' : JSON.stringify(info)},
				success: function (data) {
							alert("修改成功");
							location.href = "<%=path%>/admin/baseInfo/InvigilationInfo.jsp";
				         },
				error:  function(data){
				         	alert("修改失败！");
				         	location.href = "<%=path%>/admin/baseInfo/InvigilationInfo.jsp";
				         }
			});
		});
		$("#depart").change(function(){
			var depart = $("#depart").val();
			$.ajax({
				url: "<%=path%>/service/dept/getClassList",
				async: false ,
				method: 'POST',
				data : { dept_id : depart},
				dataType : 'json',
				success: function (data) {
							var html = "";
							for(var i = 0; i < data.length; i++){
								html += '<option value = "'+data[i].class_id+'">'+data[i].class_name+'</option>';
							}
							$('#classes').html(html);
							$('#classes').selectpicker('refresh')
				         },
				error:  function(data){
				         	alert("班级加载错误!")
				         }
			});
		});
		$("#teacherDiv").on('click','.dropdown-toggle',function(e){
			InitTeachers();
		})
	});//ready
	function InitRoom(){
		$.ajax({
			 url:  "<%=path%>"+"/service/room/getRoomList",  
	         method: 'POST',
	         contentType : "application/x-www-form-urlencoded",  
	         data: {
	        	 pageSize:0,  
	             pageNumber:0,  
	             room_name : ""
		         },
	         dataType :"JSON",
	         success: function (data) {
	         	var htmlText = "";
	         	$("#room").html(htmlText);
	         	for(var i = 0; i <data.length; i++){
	         		htmlText = htmlText + "<option value ="+data[i].room_id+">"+data[i].room_name+" 可容纳"+data[i].acc_number+"人</option>";
	         	}
	         	$("#room").html(htmlText);
	         },
	         error: function(data){
	         	alert("初始化教室失败");
	         }
		}) 
	}
	function InitSemester(){
		$.ajax({
		 url:  "<%=path%>"+"/service/semester/getSemesterList",  
            method: 'POST',    
            data: "",
            dataType :"JSON",
            success: function (data) {
            	var htmlText = "";
            	$("#semester").html(htmlText);
            	for(var i = 0; i <data.length; i++){
            		htmlText = htmlText + "<option value ='"+data[i].semester_id+"'>"+data[i].semester_name+"</option>";
            	}
            	$("#semester").html(htmlText);
            },
            error: function(data){
            	alert("初始化失败");
            }
		});
}
	function InitTeachers(){
		var start_date = $("#start_date").val();
		var end_date = $("#end_date").val();
		if(end_date == "" || start_date == ""){
			alert("监考时间未选择");
			return;
		}
		$.ajax({
			 url:  "<%=path%>"+"/service/teacher/getInviTecherList",  
	         method: 'POST', 
	         data: {
	        	 start_date: start_date,  
	        	 end_date: end_date
		     },
	         dataType :"JSON",
	         success: function (data) {
	         	var htmlText = "";
	         	$("#teachers").html(htmlText);
	         	for(var i = 0; i <data.length; i++){
	         		htmlText = htmlText + "<option value ='"+data[i].teacher_id+"'>"+data[i].teacher_name+"<span class = 'number'>"+data[i].number+"次</span></option>";
	         	}
	         	$("#teachers").html(htmlText);
	         	$("#teachers").selectpicker('refresh');
	         },
	         error: function(data){
	         	alert("初始化教师失败");
	         }
		});
	};
	function InitInvi(){
		$.ajax({
			 url:  "<%=path%>"+"/service/invigilate/getInvigilate",  
	         method: 'POST',
	         data :{exam_id : getID()},
	         dataType :"JSON",
	         success: function (data) {
	        	 $("#exam_name").val(data.exam_name);
	        	 $("#week").val(data.week);
	        //	 $("#classes").val(data.className);
	        	 $("#start_date").val(data.start_date);
	        	 $("#end_date").val(data.end_date);
	       //  	$("#teachers").val(data.teachersName);
	         	$("#semester").html("<option value ='"+data.semester.semester_id+"'>"+data.semester.semester_name+"</option>");
	         	$("#type").html("<option value ="+data.type.exam_type_id+">"+data.type.exam_type+"</option>");	
	         	$("#room").html("<option value ="+data.room.room_id+">"+data.room.room_name+"</option>");
	         
	         },
	         error: function(data){
	         	alert("获取信息失败！");
	         }
		}) 
	}
	   function InitType(){
			$.ajax({
			 url: "<%=path%>"+"/service/semester/getTypeList",  
	            method: 'POST',    
	            data: "",
	            dataType :"JSON",
	            success: function (data) {
	            	//data为[{"teacherID":"10001","teacherName":"彭焕峰"},{"teacherID":"10003","teacherName":"物理老师"}]
	            	//这样的数组，用循环遍历之后拼接字符串生产对应<option>
	            	var htmlText = "";
	            	$("#type").html(htmlText);
	            	for(var i = 0; i <data.length; i++){
	            		htmlText = htmlText + "<option value ='"+data[i].exam_type_id+"'>"+data[i].exam_type+"</option>";
	            	}
	            	$("#type").html(htmlText);
	            },
	            error: function(data){
	            	alert("初始化失败");
	            }
			}) ;
	}
	   function InitDeparment(){
			$.ajax({
			 url: "<%=path%>/service/dept/getDepartList",  
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
	function getID(){
		var locationStr = location.href;
		var param = locationStr.split("?");
		var param1 = param[1].split("=");
		return param1[1];
	};
</script>
</html>