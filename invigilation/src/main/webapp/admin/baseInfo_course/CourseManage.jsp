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
<title>课程管理</title>
</head>
<body>
	<div class = "table-tiele-nav">
				<ol class="breadcrumb">
					<li><a href="#">>课程管理</a></li>
				</ol>
			</div>
			<!-- 查询条件 -->
			<div class="panel-body" style="padding-bottom:0px;">
		        <div class="panel panel-default">
		            <div class="panel-heading">查询条件</div>
		            <div class="panel-body">
		                <form id="formSearch" class="form-horizontal">
		                    <div class="form-group" style="margin-top:15px">
		                        <label class="control-label select" for="txt_search_name">课程名</label>
		                        <div class="course-box">
		                            <input type="text" class="form-control" id="txt_search_name">
		                        </div>
		                        <div class="btn2" style="text-align:left;">
		                            <button type="button" style="width:100px" id="btn_query" class="btn btn-primary">查询</button>
		                       		<button type="button" style="width:100px" id="btn_add" data-toggle="modal" data-target="#myModal" class="btn btn-primary">新增课程</button>
		                        </div>
		                    </div>
		                </form>
		            </div>
		        </div>
		        <table id="tb_course">
		        </table>  
			</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">新增课程</h4>
      </div>
      <div class="modal-body">
        	<div class="content">
		<form class="form-horizontal" role="form">
		<!--	<div class="form-group">
				<label for="teacher_id" class="col-sm-3 control-label">课程编号</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="course_id">
				</div>
				<label for="teacher_id" class="IDError control-label">此编号已存在</label>
			</div>-->
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">课程名称:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="course_name">
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">是否完成考试:</label>
				<div class="col-sm-4">
					 <select class="form-control" id="is_examed">
					 <option value=0>否</option>
					 <option value=1>是</option>
					 </select>
				</div>
			</div>
			</form>
	</div>
      </div>
      <div class="modal-footer">
       <button type="button" class="btn btn-primary" id = "button">确认</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 修改 -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">修改课程</h4>
      </div>
      <div class="modal-body">
        	<div class="content">
		<form class="form-horizontal" role="form">
			<div class="form-group">
				<label for="teacher_id" class="col-sm-3 control-label">课程编号</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="course_idM" disabled>
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">课程名称:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="course_nameM">
				</div>
			</div>
				<div class="form-group">
				<label for="name" class="col-sm-3 control-label">是否完成考试:</label>
				<div class="col-sm-4">
						<select class="form-control" id="is_examedM">
					 <option value=0>否</option>
					 <option value=1>是</option>
					 </select>
				</div>
			</div>
			</form>
		
	</div>
      </div>
      <div class="modal-footer">
       <button type="button" class="btn btn-primary" id = "buttonM">确认</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>       
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
<script type="text/javascript">
function deleteT(course_id){
	var status=confirm("确认删除？");
	console.log(status);
	if(status==true){
			console.log("sure");
			$.ajax({
				url : "service/course/delete",
				method : "POST",
				data : {
					course_id : course_id
				},
				success : function(data){
					if(data == "ok"){
						alert("删除成功");
						window.location.reload(true);
					}
					else{
						alert("删除失败");
						window.location.reload(true);
					}
				},
				error :function(data){
					alert("删除失败");
					window.location.reload(true);
				}
			});
		}
};
</script>

<script>
	$(document).ready(function(){
		InitTable();
		$("#btn_query").click(function(){
			$('#tb_course').bootstrapTable('refresh')
		});
		$("#tb_course").on('click','.modify',function(e){
		    //获取id
		    var course_id=$(this).attr("course_id");
		    $("#myModal2").modal();
		    $('#myModal2').on('shown.bs.modal', function (e) {
		    	InitModify(course_id);
		    });
		});
		$(".IDError").hide();
		$("#course_id").focus(function(){
			$(".IDError").hide();
			$("#button").removeAttr("disabled");
		});
		
		//课程id失去焦点 则执行查重方法 若已存在此ID 则有提示内容 并且按钮设为禁止
		$("#course_id").blur(function () {  
		    var course_id = $("#course_id").val();
			$.ajax({
			 url: "service/course/UniquenessCheckForCourse",  
	            method: 'POST',    
	            data: {"course_id":course_id},
	            success: function (data) {
	            	if(data != "ok"){
	            		$(".IDError").show();
	            		$("#button").attr({"disabled":"disabled"});
	            	}
	            	else{
	            		
	            	}
	            },
	            error: function(data){
	            	alert("课程号唯一校验失败")
	            	$("#button").attr({"disabled":"disabled"});
	            }
			});
			
		});

		//添加新增教室点击事件，成功失败都返回到展示页面
		$("#button").click(function(){
			var info={};
		//	info.course_id =$("#course_id").val();
			info.course_name =$("#course_name").val();
			info.is_examed =$("#is_examed").val();
			$.ajax({
				url: "service/course/addCourse",
				async: false ,
				method: 'POST',
				data:{'Info' : JSON.stringify(info)},
				success: function (data) {
							alert("添加成功");
							location.href = "<%=path%>/admin/baseInfo_course/CourseManage.jsp";
				         },
				error:  function(data){
				         	alert("添加失败！");
							location.href = "<%=path%>/admin/baseInfo_course/CourseManage.jsp";
				         }
			});
			
		});
		$("#buttonM").click(function(){
			var info = {};
			info.course_id =$("#course_idM").val();
			info.course_name =$("#course_nameM").val();
			info.is_examed =$("#is_examedM").val();
			$.ajax({
				url: "service/course/modifyCourse",
				async: false ,
				method: 'POST',
				data:{'Info' : JSON.stringify(info)},
				success: function (data) {
						if(data == "ok"){
							alert("修改成功");
							location.href = "<%=path%>/admin/baseInfo_course/CourseManage.jsp";
						}
						else{
							alert("修改失败");
							location.href = "<%=path%>/admin/baseInfo_course/CourseManage.jsp";
						}
						
				         },
				error:  function(data){
				         	alert("修改失败！");
							location.href = "<%=path%>/admin/baseInfo_course/CourseManage.jsp";
				         }
			});
			
		});
		
	});
	function queryParams(params) {  
      var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的  
         // limit: params.limit,   //页面大小    
          pageSize:this.pageSize,  
          pageNumber:this.pageNumber,  
          course_name : $("#txt_search_name").val()
      };  
      return temp;  
  };  
	function InitTable(){
			$('#tb_course').bootstrapTable({
	            url: "service/course/getCourseList",                            //请求后台的URL（*）
	            method: 'post',                      //请求方式（*）
	            contentType : "application/x-www-form-urlencoded",
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
	            uniqueId: "course_id",                     //每一行的唯一标识，一般为主键列
	//            showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
	            cardView: false,                    //是否显示详细视图
	            detailView: false,                   //是否显示父子表
	            columns: [{
	                checkbox: true
	            },{
	                field: 'course_id',
	                title: '课程编号'
	            },{
	                field: 'course_name',
	                title: '课程名称'
	            },{
	                field: 'is_examed',
	                title: '是否完成考试',
	                formatter : function (value, row, index) {
						var is_examed = "";
						if(row.is_examed==1)
							is_examed="是"; 
						if(row.is_examed==0)
							is_examed="否";
						return is_examed;
			        } 
	            }, {
	                field: 'Operate',
	                title: '操作',
	                formatter : function (value, row, index) {

	                	return "<a course_id='"+row.course_id+"' class='modify' data-target='#myModal2'>修改</a>  <a href=\"javascript:deleteT("+row.course_id+")\">删除</a>";
	                }
	            }]
	        });
	    };
	    function InitModify(course_id){
	    	$.ajax({
	    		url : "service/course/getCourse",
	    		method : "POST",
	    		data : {
	    			course_id : course_id
	    		},
	    		dataType : "json",
	    		success : function(data){
	    			$("#course_idM").val(data.course_id);
	    			$("#course_nameM").val(data.course_name);
	    			$("#is_examedM").val(data.is_examed);
	    		},
	    		error :function(data){
	    			alert("加载失败");
	    		    location.href = "<%=path%>/admin/baseInfo_course/CourseManage.jsp";
	    		}
	    	});
	    }
	
	</script>
</html>