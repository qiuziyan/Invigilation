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
			<li><a href="#">时间管理</a></li>
		</ol>
	</div>
	<!-- 			 查询条件 -->
	<div class="panel-body" style="padding-bottom:0px;">
        <div class="panel panel-default">
            <div class="panel-heading">查询条件</div>
            <div class="panel-body">
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label select" for="txt_search_statu">查询日期</label>
                        <div class="time">
                            <input type="text"  id="time">  
                        </div>
                        <label class="control-label select" for="txt_search_statu">之后</label>
                        <div class="btn2" style="text-align:left;">
                            <button type="button" style="width:100px" id="btn_query" class="btn btn-primary">查询</button>
                       		<button type="button" style="width:100px" id="btn_add" class="btn btn-primary">新增忙碌时间</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <table id="tb_freetime">
        </table>  
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">新增忙碌时间</h4>
	      </div>
	      <div class="modal-body">
	        <div class="content">
			<form class="form-horizontal" role="form">
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">周次:</label>
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
					<label for="teacher_id" class="col-sm-3 control-label">开始时间:</label>
					<div class="col-sm-4">
						<input type="text" class = "form-control" id="starttime"> 
					</div>
				</div>
				<div class="form-group">
					<label for="name" class="col-sm-3 control-label">结束时间:</label>
					<div class="col-sm-4">
						<input type="text" class = "form-control" id="endtime">
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
		$('#starttime').datetimepicker({    
			minView: "day",
			format: 'yyyy-mm-dd hh:00',
			autoclose:true, todayBtn: true     
		}); 
		$('#endtime').datetimepicker({    
			minView: "day",
			format: 'yyyy-mm-dd  hh:00',
			autoclose:true, todayBtn: true     
		});
		$('#time').datetimepicker({    
			minView: "month",
			format: 'yyyy-mm-dd',
			autoclose:true, todayBtn: true       
		});
		InitTable();
		//查询点击事件
		$("#btn_query").click(function(){
			$('#tb_freetime').bootstrapTable('refresh')
		});
		//显示新增模态框
		$("#btn_add").on('click',function(e){
		    $("#myModal").modal();
		    $('#myModal').on('shown.bs.modal', function (e) {
		    });
		});
		//新增空闲时间事件
		$("#buttonAdd").click(function(){
			var starttime = $("#starttime").val();
			var endtime = $("#endtime").val();
			var week = $("#week").val();
			var teacher_id = getTeacher();
			$.ajax({
				url : "<%=path%>/service/teacher/addFreeTime",
				method : "POST",
				async: true,
				data : {
					week      : week,
					starttime : starttime,
					endtime : endtime,
					teacher_id : teacher_id
				},
				success : function(data){
					if(data == "ok"){
						alert("添加成功");
						window.location.reload(true);
					}
					else{
						alert("添加失败");
						window.location.reload(true);
					}
				},
				error :function(data){
					alert("添加失败");
					window.location.reload(true);
				}
			}); 
		});
		//删除事件
		$("#tb_freetime").on('click','.delete',function(e){
		    var id=$(this).attr("id");
		    var status=confirm("确认删除？");
			console.log(status);
			if(status==true){
					console.log("sure");
					$.ajax({
						url : "<%=path%>/service/teacher/deleteFreeTime",
						method : "POST",
						data : {
							id : id
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
			});
		
	})
	function queryParams(params) { 
		 var teacher_id = getTeacher(); 
      var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的  
        
         time : $("#time").val(),
         teacher_id : teacher_id
      };  
      return temp;  
  };  
	function InitTable(){
			$('#tb_freetime').bootstrapTable({
	            url: "<%=path%>"+"/service/teacher/getFreeTimeList", 
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
	            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
	//            showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
	            cardView: false,                    //是否显示详细视图
	            detailView: false,                   //是否显示父子表
	            columns: [{
	                checkbox: true
	            }, {
	                field: 'id',
	                title: '编号',
	                formatter : function (value, row, index) {
		                return index+1;
	                }
	            }, {
	                field: 'week',
	                title: '周次'
	            }, {
	                field: 'starttime',
	                title: '开始时间'
	            }, {
	                field: 'endtime',
	                title: '结束时间'
	            }, 
	            {
	                field: 'Oprate',
	                title: '操作',
	                formatter : function (value, row, index) {
		                return 	'<a href = "#" id = "'+row.id+'" class = "delete">删除</a>';                	
	                }
	            }]
	        });
	    };
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