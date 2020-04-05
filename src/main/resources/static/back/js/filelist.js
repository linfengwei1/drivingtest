$(function (){
	var path = $("#path").val();
	layui.use(['table','layer'], function(){
		var table = layui.table;
		var layer = layui.layer;
		table.render({
			method: 'post',
			elem: '#demo'
			,id:'tableOne'
			,height: 300
			,page: true //开启分页
			,limit:5
			,limits:[5,10]
			,title:'用户列表'
			,cols: [[ //表头
				{field: 'fileName', title: '文档标题', width:80, sort: true, fixed: 'left'}
				,{field: 'uname', title: '上传人', width:80}
				,{field: 'uploadTime', title: '上传时间', width:80}
				,{field: 'score', title: '上传积分', width:80}
				,{field: 'styleName', title: '文档类型', width:80}
				,{field: 'update', title: '操作',toolbar:'#barDemo', width:130}
			]]
			,url: path+"/user/getFileList"
		});

		$("#serch").on("click",function () {
			var uname = $("#uname").val();
			table.reload('tableOne', {
				method: 'post'
				, where: {
					'uname': uname,
				}
				, page: {
					curr: 1
				}
			});
		})

		table.on('tool(test)', function(obj){
			var data = obj.data;
			console.log(data);
			// console.log(obj);
			if(obj.event === 'del'){
				layer.confirm('真的删除行么', function(index){
					obj.del();
					layer.close(index);

					$.ajax({
						url:path+"/GetUserListServlet?method=delUser",
						type:'post',
						data: {id:data.uid},
						success:function(msg){
							if(msg == "success")
							{
								layer.close(index);
								layer.msg('删除成功');
								table.reload('tableOne', {
									method: 'post'
									, page: {
										curr: 1
									}
								});

							}else
							{
								layer.msg('删除失败');
							}

						},error:function (err) {
							console.log(err);
						}
					});



				});
			} else if(obj.event === 'edit'){
				layer.open({
					type: 2,
					area: ['500px', '300px'],
					btn: ['添加', '取消'],
					btn1: function(index, layero){
						//layer.getChildFrame("form", index)获取iframe的表单
						//serializeArray jquery方法，将表单对象序列化为数组
						var formData = serializeObject($, layer.getChildFrame("form", index).serializeArray());
						console.log(formData);

						$.ajax({
							url:path+"/GetUserListServlet?method=update",
							type:'post',
							data: formData,
							success:function(msg){
								if(msg == "success")
								{
									layer.close(index);
									layer.msg('修改成功');
									table.reload('tableOne', {
										method: 'post'
										, page: {
											curr: 1
										}
									});

								}else
								{
									layer.msg('修改失败');
								}

							},error:function (err) {
								console.log(err);
							}
						});
					},
					content: path+'/front/jsp/form.jsp' //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
					,success: function(layero, index){

						layer.getChildFrame("#uname", index).val(data.uname);
						layer.getChildFrame("#pwd", index).val(data.pwd);
						layer.getChildFrame("#id", index).val(data.uid);

					}
				});
			}
		});


	});


})

//将表单转为js对象数据
function serializeObject($, array){
	var obj=new Object();
	$.each(array, function(index,param){
		if(!(param.name in obj)){
			obj[param.name]=param.value;
		}
	});
	return obj;
};