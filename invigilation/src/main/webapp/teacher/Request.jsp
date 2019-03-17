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
	<div class = "table-tiele-nav">
		<ol class="breadcrumb">
			<li><a href="#">我的申请</a></li>
		</ol>
	</div>
	<!-- 			 查询条件 -->
	<div class="panel-body" style="padding-bottom:0px;">
        <div class="panel panel-default">
            <div class="panel-heading">查询条件</div>
            <div class="panel-body">
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                       <label class="control-label select" for="txt_search_statu">课程名称</label>
		                        <div class="course-box">
		                            <input type="text" class="form-control" id="txt_search_name">
		                        </div>
                        <div class="btn2" style="text-align:left;">
                            <button type="button" style="width:100px" id="btn_query" class="btn btn-primary">查询</button>
                       		<button type="button" style="width:100px" id="btn_add" class="btn btn-primary">考试申请</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <table id="tb_test">
        </table>  
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">考试申请</h4>
	      </div>
	      <div class="modal-body">
	        <div class="content">
			<form class="form-horizontal" role="form">
			<div class="form-group">
					<label for="name" class="col-sm-3 control-label">申请者编号:</label>
					<div class="col-sm-4">
						<input type="text" class = "form-control" id="teacher" disabled> 
					</div>
				</div>
				<div class="form-group">
					<label for="name" class="col-sm-3 control-label">申请日期:</label>
					<div class="col-sm-4">
					 <%
				  java.text.SimpleDateFormat simpleDateFormat=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				    java.util.Date currentTime=new java.util.Date();
				    String time=simpleDateFormat.format(currentTime).toString();
				    %>
						<input type="text" class = "form-control" id="date" value=<%=time %> disabled> 
					</div>
				</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">学期:</label>
				<div class="col-sm-4">
				<select class="form-control" id="semester">
			
				</select>
				</div>
			</div>
				<div class="form-group">
					<label for="teacher_id" class="col-sm-3 control-label">课程名:</label>
					<div class="col-sm-4">
						<select class="form-control" id="course">
			
				</select>
					</div>
				</div>
				<div class="form-group">
					<label for="name" class="col-sm-3 control-label">考试类型:</label>
					<div class="col-sm-4">
						<select class = "form-control" id="type">
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="department"  class="col-sm-3 control-label">考试班级:</label>
					<div class="col-sm-4">
						<select class="selectpicker form-control" multiple id="classes">
						
						</select>
					</div>
				</div>
			</form>	
			</div>
	      </div>
	      <div class="modal-footer">
	       <button type="button" class="btn btn-primary" id ="buttonAdd">确认</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	       
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
</body>
<script>
	$(document).ready(function(){
		InitTable();
		//查询点击事件
		$("#btn_query").click(function(){
			$('#tb_test').bootstrapTable('refresh')
		});
		//显示新增模态框
		$("#btn_add").on('click',function(e){
		    $("#myModal").modal();
		    $('#myModal').on('shown.bs.modal', function (e) {
		    });
		});
		InitSemester();
		InitType();
		var teacher_id = getTeacher();
		$("#teacher").val(teacher_id);
		$("#semester").change(function(){
			var semester_id = $("#semester").val();
			var teacher_id = getTeacher();
			$.ajax({
				url: "<%=path%>/service/course/getcourseList",
				async: false ,
				method: 'POST',
				data : { semester_id : semester_id,
					     teacher_id :teacher_id
					},
				dataType : 'json',
				success: function (data) {
							var html = "";
							for(var i = 0; i < data.length; i++){
								html += '<option value = "'+data[i].course_id+'">'+data[i].course_name+'</option>';
							}
							$("#course").html(html);
				         },
				error:  function(data){
				         	alert("课程加载错误!")
				         }
			});
		});
		$("#course").change(function(){
			var semester_id = $("#semester").val();
			var course_id = $("#course").val();
			$.ajax({
				url: "<%=path%>/service/course/getclassList",
				async: false ,
				method: 'POST',
				data : { semester_id : semester_id,
					     course_id :course_id
					},
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
		//新增空闲时间事件
		$("#buttonAdd").click(function(){
			var info = {};
			info.course_id = $("#course").val();
			info.exam_type_id = $("#type").val();
			info.req_date = $("#date").val();
			info.teacher_id = getTeacher();
			info.classes = $("#classes").val();
			$.ajax({
				url : "<%=path%>/service/teacher/addRequest",
				method : "POST",
				async: true,
				data : {'Info' : JSON.stringify(info)},
				success : function(data){
					if(data == "ok"){
						alert("申请成功");
						window.location.reload(true);
					}
					else{
						alert("申请失败");
						window.location.reload(true);
					}
				},
				error :function(data){
					alert("申请失败");
					window.location.reload(true);
				}
			}); 
		});
	})
	function queryParams(params) { 
	var teacher_id = getTeacher(); 
      var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的  
         teacher_id : teacher_id,
         course_name : $("#txt_search_name").val()
      };  
      return temp;  
  };  
	function InitTable(){
			$('#tb_test').bootstrapTable({
	            url: "<%=path%>"+"/service/teacher/getRequestList", 
	            contentType : "application/x-www-form-urlencoded",                           //请求后台的URL（*）
	            method: 'post',                      //请求方式（*）
	//             toolbar: '#toolbar',                //工具按钮用哪个容器
	            striped: true,                      //是否显示行间隔色
	            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
	            pagination: true,                   //是否显示分页（*）
	            sortable: false,                     //是否启用排序
	            sortOrder: "asc",                   //排序方式
	            queryParams: queryParams,                   //传递参数（*）
	            sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
	            pageNumber:1,                       //初始化加载第一页，默认第一页
	            pageSize: 10,                       //每页的记录行数（*）
	            pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
	//            search: true,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
	//            strictSearch: true,
	//            showColumns: true,                  //是否显示所有的列
	//            showRefresh: true,                  //是否显示刷新按钮
	            minimumCountColumns: 2,             //最少允许的列数
	            clickToSelect: true,                //是否启用点击选中行
	//            height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
	            uniqueId: "req_id",                     //每一行的唯一标识，一般为主键列
	//            showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
	            cardView: false,                    //是否显示详细视图
	            detailView: false,                   //是否显示父子表
	            columns: [{
	                checkbox: true
	            }, {
	                field: 'req_id',
	                title: '编号'
	            }, {
	                field: 'course.course_name',
	                title: '课程'
	            }, {
	                field: 'type.exam_type',
	                title: '考试类型'
	            }, {
	                field: 'teacher.teacher_name',
	                title: '申请者'
	            }, {
	                field: 'req_date',
	                title: '申请日期'
	            }, 
	            {
	                field: 'class',
	                title: '班级',
	                formatter : function (value, row, index) {
						var cla = "";
						for(var i = 0; i < row.classnames.length; i++){
							cla += row.classnames[i];
							if(i != row.classnames.length-1){
								cla += "," 
							}
						}
						return cla;
			        } 
	    	    }, 
	            {
	                field: 'status',
	                title: '状态',
	                formatter : function (value, row, index) {
						var status = "";
						if(row.status==1)
							status="已处理"; 
						if(row.status==0)
							status="未处理";
						return status;
			        } 
	            }]
	        });
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
 function getCookie(name){
			var strCookies = document.cookie;
			var cookies = strCookies.split(";")
			for(var i = 0; i<cookies.length;i++){
				var cookie = cookies[i].split("=");
				if($.trim(cookie[0]) == name)
					return cookie[1];
			} 
			return "";
		}
function getTeacher(){
		var teacher_id ;
		$.ajax({
				url : "<%=path%>/service/teacher/getTeacher",
				async: false,
				method : "POST",
				data : {
					teacher_no : getCookie('teacher_no')
				},
				dataType : 'json',
				success : function(data){
					teacher_id=data.teacher_id;
				},
				error :function(data){
					alert("加载信息失败");
				}
		});
		return teacher_id;
}
</script>
</html>