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
<title>班级管理</title>
</head>
<body>
	<div class = "table-tiele-nav">
				<ol class="breadcrumb">
					<li><a href="#">>班级管理</a></li>
				</ol>
			</div>
			<!-- 			 查询条件 -->
			<div class="panel-body" style="padding-bottom:0px;">
		        <div class="panel panel-default">
		            <div class="panel-heading">查询条件</div>
		            <div class="panel-body">
		                <form id="formSearch" class="form-horizontal">
		                    <div class="form-group" style="margin-top:15px">
		                        <label class="control-label select" for="txt_search_name">班级名</label>
		                        <div class="course-box">
		                            <input type="text" class="form-control" id="txt_search_name">
		                        </div>
		                        <div class="btn2" style="text-align:left;">
		                            <button type="button" style="width:100px" id="btn_query" class="btn btn-primary">查询</button>
		                       		<button type="button" style="width:100px" data-toggle="modal" data-target="#myModal" class="btn btn-primary">新增班级</button>
		                        </div>
		                    </div>
		                </form>
		            </div>
		        </div>
		        <table id="tb_class">
		        </table>  
			</div>
<!-- 			新增model fade -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title">新增班级</h4>
			      </div>
			      <div class="modal-body">
			        	<div class="content">
					<form class="form-horizontal" role="form">
					<!--  	<div class="form-group">
							<label for="teacher_id" class="col-sm-3 control-label">班级编号:</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="class_id">
							</div>
							<label for="teacher_id" class="IDError control-label">此编号已存在</label>
						</div>-->
						<div class="form-group">
							<label for="department" class="col-sm-3 control-label">所属院系:</label>
							<div class="col-sm-4">
							<select class="form-control" id = "depart">
							
							</select>
							</div>
						</div>	
						<div class="form-group">
							<label for="name" class="col-sm-3 control-label">班级名称:</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="class_name">
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-3 control-label">年级:</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="class_grade">
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-3 control-label">班主任:</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="class_contact">
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-3 control-label">联系方式:</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="class_phone">
							</div>
						</div>	
						</form>	
				</div>
			      </div>
			      <div class="modal-footer">
			       <button type="button" class="btn btn-primary" id ="button">确认</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			       
			      </div>
			    </div><!-- /.modal-content -->
			  </div><!-- /.modal-dialog -->
			</div><!-- /.modal -->
			
			<!-- 修改modal fade -->
			<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title">修改班级</h4>
			      </div>
			      <div class="modal-body">
			        	<div class="content">
					<form class="form-horizontal" role="form">
							<div class="form-group">
							<label for="teacher_id" class="col-sm-3 control-label">班级编号:</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="class_idM" disabled>
							</div>
							<label for="teacher_id" class="IDError control-label">此编号已存在</label>
						</div>
						<div class="form-group">
							<label for="department" class="col-sm-3 control-label">所属院系:</label>
							<div class="col-sm-4">
							<select class="form-control" id = "departM">
							
							</select>
							</div>
						</div>	
						<div class="form-group">
							<label for="name" class="col-sm-3 control-label">班级名称:</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="class_nameM">
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-3 control-label">年级:</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="class_gradeM">
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-3 control-label">班主任:</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="class_contactM">
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-3 control-label">联系方式:</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="class_phoneM">
							</div>
						</div>	
						</form>
				</div>
			      </div>
			      <div class="modal-footer">
			       <button type="button" class="btn btn-primary" id ="buttonM">确认</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			       
			      </div>
			    </div><!-- /.modal-content -->
			  </div><!-- /.modal-dialog -->
			</div><!-- /.modal -->
</body>
<script type="text/javascript">
function deleteT(class_id){
	var status=confirm("确认删除？");
	console.log(status);
	if(status==true){
			console.log("sure");
			$.ajax({
				url : "service/class/delete",
				method : "POST",
				data : {
					class_id : class_id
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
			$('#tb_class').bootstrapTable('refresh')
		});
		$("#tb_class").on('click','.modify',function(e){
		    //获取id
		    var class_id=$(this).attr("class_id");
		    $("#myModal2").modal();
		    $('#myModal2').on('shown.bs.modal', function (e) {
		    	InitModify(class_id)
		    });
		});
		InitDeparment();
		InitDeparmentM();
		$("#class_idM").attr({"disabled":"disabled"});
	//初始化时间下面框控件
	//课程id得到 按钮移除禁止 回复原样
	$(".IDError").hide();
	$("#class_id").focus(function(){
		$(".IDError").hide();
		$("#button").removeAttr("disabled");
	});
	
	//课程id失去焦点 则执行查重方法 若已存在此ID 则有提示内容 并且按钮设为禁止
	$("#class_id").blur(function () {  
	    var class_id = $("#class_id").val();
		$.ajax({
		 url: "service/class/UniquenessCheckForClass",  
            method: 'POST',    
            data: {"class_id":class_id},
            success: function (data) {
            	if(data != "ok"){
            		$(".IDError").show();
            		$("#button").attr({"disabled":"disabled"});
            	}
            	else{
            		
            	}
            },
            error: function(data){
            	alert("班级号唯一校验失败")
            	$("#button").attr({"disabled":"disabled"});
            }
		});
	});
		$("#button").click(function(){
			var info = {};
		//	info.class_id= $("#class_id").val();
			info.dept_id = $("#depart").val();
			info.class_name = $("#class_name").val();
			info.class_grade= $("#class_grade").val();
			info.class_contact= $("#class_contact").val();
			info.class_phone = $("#class_phone").val();
			$.ajax({
				url: "service/class/addClass",
				async: false ,
				method: 'POST',
				data:{'Info' : JSON.stringify(info)},
				success: function (data) {
							alert("添加成功");
							location.href = "<%=path%>/admin/baseInfo_class/ClassManage.jsp";
				         },
				error:  function(data){
				         	alert("添加失败！");
							location.href = "<%=path%>/admin/baseInfo_class/ClassManage.jsp";
				         }
			});
		});
		$("#buttonM").click(function(){
			var info = {};
			info.class_id = $("#class_idM").val();
			info.dept_id = $("#departM").val();
			info.class_name = $("#class_nameM").val();
			info.class_grade = $("#class_gradeM").val();
			info.class_contact = $("#class_contactM").val();
			info.class_phone = $("#class_phoneM").val();
			$.ajax({
				url: "service/class/modifyClass",
				async: false ,
				method: 'POST',
				data:{'Info' : JSON.stringify(info)},
				success: function (data) {
						if(data == "ok"){
							alert("修改成功");
							location.href = "<%=path%>/admin/baseInfo_class/ClassManage.jsp";
						}
						else{
							alert("修改失败");
							location.href = "<%=path%>/admin/baseInfo_class/ClassManage.jsp";
						}
				},
				error:  function(data){
				         	alert("修改失败！");
							location.href = "<%=path%>/admin/baseInfo_class/ClassManage.jsp";
				         }
			});
		});
	});
	function queryParams(params) {  
      var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的  
         // limit: params.limit,   //页面大小    
          pageSize:this.pageSize,  
          pageNumber:this.pageNumber,  
          class_name : $("#txt_search_name").val()
      };  
      return temp;  
  };  
	function InitTable(){
			$('#tb_class').bootstrapTable({
	            url: "service/class/getClassList",                            //请求后台的URL（*）
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
	            uniqueId: "class_id",                     //每一行的唯一标识，一般为主键列
	//            showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
	            cardView: false,                    //是否显示详细视图
	            detailView: false,                   //是否显示父子表
	            columns: [{
	                checkbox: true
	            },{
	                field: 'class_id',
	                title: '班级编号'
	            }, {
	                field: 'depart.dept_name',
	                title: '所属院系'   
	            },{
	                field: 'class_name',
	                title: '班级名称'
	            },{
	                field: 'class_grade',
	                title: '年级'
	            },{
	                field: 'class_contact',
	                title: '班主任'
	            },{
	                field: 'class_phone',
	                title: '联系方式' 
	          
	            },{
	                field: 'Operate',
	                title: '操作',
	                formatter : function (value, row, index) {

	                	return "<a class_id='"+row.class_id+"' class='modify' data-target='#myModal2'>修改</a>  <a href=\"javascript:deleteT("+row.class_id+")\">删除</a>";
	                }
	            }]
	        });
	    };
function InitDeparment(){
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
function InitDeparmentM(){
	$.ajax({
	 url: "service/dept/getDepartList",  
        method: 'POST',    
        data: "",
        dataType :"JSON",
        success: function (data) {
        	//data为[{"teacherID":"10001","teacherName":"彭焕峰"},{"teacherID":"10003","teacherName":"物理老师"}]
        	//这样的数组，用循环遍历之后拼接字符串生产对应<option>
        	var htmlText = "";
        	$("#departM").html(htmlText);
        	for(var i = 0; i <data.length; i++){
        		htmlText = htmlText + "<option value ='"+data[i].dept_id+"'>"+data[i].dept_name+"</option>";
        	}
        	$("#departM").html(htmlText);
        },
        error: function(data){
        	alert("初始化失败");
        }
	}) 
};

function InitModify(class_id){
	$.ajax({
		url : "service/class/getClass",
		method : "POST",
		data : {
			class_id : class_id
		},
		dataType : "json",
		success : function(data){
			$("#class_idM").val(data.class_id);
			$("#class_nameM").val(data.class_name);
			$("#class_gradeM").val(data.class_grade);
			$("#class_contactM").val(data.class_contact);
			$("#class_phoneM").val(data.class_phone);
		},
		error :function(data){
			alert("加载失败");
		    location.href = "<%=path%>/admin/baseInfo_class/ClassManage.jsp";
		}
	});
}
	</script>
</html>