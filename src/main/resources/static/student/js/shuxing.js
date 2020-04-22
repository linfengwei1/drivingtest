﻿$(function () {
	layui.use(['layer'], function() {
		var path = $("#path").val();
		var layer = layui.layer;
		console.log(path);
		var roleid = $("#roleid").val();
		$.ajax({
			type: "Post",
			async: true,
			url: path + '/user/getHasMenu',
			data: {roleid: roleid},
			dataType: "text",
			success: function (str) {
				data = JSON.parse(str);
				console.log(data);
				layui.use('tree', function () {
					tree = layui.tree;
					//渲染
					var inst1 = tree.render({
						elem: '#test1'  //绑定元素
						, data: data.menulist
						, showCheckbox: true
						, id: 'demoId' //定义索引
					});

					console.log(data.hasmenu);
					var list = data.hasmenu;
					var arr = [];

					//把已经分配好的菜单对象的id取出来装进arr
					for (var i= 0; i <list.length; i++)
					{
						arr.push(list[i].id);
						if(list[i].children != null && list[i].children.length > 0)
						{
							for( var k = 0; k <list[i].children.length; k++){

								getId(list[i].children[k],arr);
							}
						}

					}
					console.log(arr);
					tree.setChecked('demoId', arr);//勾选已经分配好的菜单,arr里面是id



				});

			},
			error: function (str) {
				alert(str);
			}
		});



		$("#get").on("click", function () {
			var checkData = tree.getChecked('demoId');
			console.log(checkData);

			var arr = [];

			for (var i= 0; i <checkData.length; i++)
			{
				arr.push(checkData[i].id);
				if(checkData[i].children != null && checkData[i].children.length > 0)
				{
					for( var k = 0; k <checkData[i].children.length; k++){

						getId(checkData[i].children[k],arr);
					}
				}

			}
			console.log(arr);

			$.ajax({
				type: "Post",
				async: true,
				url: path + '/user/changeMenu',
				data: {menuid: arr,roleid:roleid},
				dataType: "text",
				success: function (str) {
					if(str == "success")
					{
						layer.msg("修改成功")
					}else
					{
						layer.msg("修改失败")
					}

				},
				error: function (str) {
					alert(str);
				}
			});

		})
	})
})

function getId(data,arr) {

	arr.push(data.id);
	if(data.children != null && data.children.length > 0)
	{
		for( var k = 0; k <data.children.length; k++){

			getId(data.children[k],arr);
		}
	}

}