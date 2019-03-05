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
<script src="<%=path%>/js/jquery-3.3.1.min.js"></script>
<script src="<%=path%>/js/bootstrap.min.js"></script>
<script src="<%=path%>/js/bootstrap-table.js"></script>
<script src="<%=path%>/js/bootstrap-table-zh-CN.js"></script>
<script src="<%=path%>/js/bootstrap-datetimepicker.min.js"></script>
<script src="<%=path%>/js/bootstrap-datetimepicker.fr.js"></script>
<script src="<%=path%>/js/bootstrap-datetimepicker.zh-CN.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class = "table-tiele-nav">
				<ol class="breadcrumb">
					<li><a href="#">>监考管理</a></li>
				</ol>
			</div>
			<!-- 			 查询条件 -->
			<div class="panel-body" style="padding-bottom:0px;">
		        <div class="panel panel-default">
		            <div class="panel-heading">查询条件</div>
		            <div class="panel-body">
		                <form id="formSearch" class="form-horizontal">
		                    <div class="form-group" style="margin-top:15px">
		                        <label class="control-label select" for="txt_search_statu">班级名称</label>
		                        <div class="course-box">
		                            <input type="text" class="form-control" id="txt_search_name">
		                        </div>
		                        <div class="btn2" style="text-align:left;">
		                            <button type="button" style="width:100px" id="btn_query" class="btn btn-primary">查询</button>
		                        </div>
		                    </div>
		                </form>
		            </div>
		        </div>
		        <table id="tb_invigilation">
		        </table>  
			</div>
</body>
<script>
	$(document).ready(function(){
		InitTable();
		$("#btn_query").click(function(){
			$("#tb_invigilation").bootstrapTable("refresh");
		});
	})
	function queryParams(params) {  
		var teacher_id = getTeacher();
	      var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的  
         // limit: params.limit,   //页面大小    
          class_name : '',
		  teacher_id :  teacher_id,
		  course_name : $("#txt_search_name").val()
      };  
      return temp;  
  };  
	function InitTable(){
			$('#tb_invigilation').bootstrapTable({
	            url: "<%=path%>/service/invigilate/getInvigilationList",
	            contentType : "application/x-www-form-urlencoded",                              //请求后台的URL（*）
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
	            uniqueId: "exam_id",                     //每一行的唯一标识，一般为主键列
	//            showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
	            cardView: false,                    //是否显示详细视图
	            detailView: false,                   //是否显示父子表
	            columns: [{
	                checkbox: true
	            },{
	                field: 'exam_id',
	                title: '编号'
	            },{
	                field: 'exam_name',
	                title: '考试名称'
	             }, {
	            	 field: 'semester.semester_name',
		             title: '学期'
	            }, {
	            	 field: 'week',
		             title: '周次'
		        }, {
	                field: 'time',
	                title: '时间',
                	formatter : function (value, row, index) {
						return row.start_date+"~"+row.end_date;
			        }
	            }, {
	                field: 'room.room_name',
	                title: '地点'
	            }, {
	                field: 'teacher',
	                title: '监考老师',
                	formatter : function (value, row, index) {
						var tea = "";
						for(var i = 0; i < row.teachersName.length; i++){
							tea += row.teachersName[i];
							if(i != row.teachersName.length-1){
								tea += "," 
							}
						}
						return tea;
			        }
	            }, 
	            {
	                field: 'class',
	                title: '班级',
	                formatter : function (value, row, index) {
						var cla = "";
						for(var i = 0; i < row.className.length; i++){
							cla += row.className[i];
							if(i != row.className.length-1){
								cla += "," 
							}
						}
						return cla;
			        } 
	            }]
	        });
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
	function getTeacher(){
		var teacher_id ;
		$.ajax({
				url : "<%=path%>/service/teacher/getTeacher",
				async: false,
				method : "POST",
				data : {
					teacher_no :  getCookie('teacher_no')
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