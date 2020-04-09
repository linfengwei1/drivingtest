﻿﻿﻿$(function () {

	var path = $("#path").val();
	console.log(path);
	var roleid = $("#roleid").val();
	$.ajax({
		type:"Post",
		async:true,
		url:path+'/user/getMenu',
		data:{roleid:roleid},
		dataType:"text",
		success:function (str) {
			loadMenu(str);
		},
		error: function (str) {
			alert(str);
		}
	});


})

function loadMenu(data) {
	var path = $("#path").val();
	layui.use('element', function(){
		var element = layui.element;
		var $ = layui.jquery;
		console.log("data: "+data);
		data = JSON.parse(data);
		data = data.hasmenu;
		var liStr= "";
		// 遍历生成主菜单
		for( var i = 0; i <data.length; i++){
			//console.log("--> "+JSON.stringify(data[i]));
			// 判断是否存在子菜单
			if(data[i].children!=null&&data[i].children.length>0){
				console.log("--> "+JSON.stringify(data[i].children));
				liStr+="<li class=\"layui-nav-item\"><a class=\"\" href=\"javascript:;\"><i class='layui-icon' >&#xe653;</i> "+data[i].title+"</a>\n"+
					"<dl class=\"layui-nav-child\">\n";
				// 遍历获取子菜单
				for( var k = 0; k <data[i].children.length; k++){
					liStr+=getChildMenu(data[i].children[k],0);
				}
				liStr+="</dl></li>";
			}else{
				liStr+="<li class=\"layui-nav-item\"><a class=\"\" href=\""+path+data[i].href+"\" target='frame_div'><i class='layui-icon' >&#xe66c;</i> "+data[i].title+"</a></li>";
			}
		};
		console.log(">>>> "+liStr);
		$("#navBarId").html("<ul class=\"layui-nav layui-nav-tree\"  lay-filter=\"test\">\n" +liStr+"</ul>");
		element.init();
	});
}


// 递归生成子菜单
function getChildMenu(subMenu,num) {
	var path = $("#path").val();
	var menuCell = 5;
	console.log("num: "+num);
	num++;
	var subStr = "";
	if(subMenu.children!=null&&subMenu.children.length>0){
		subStr+="<dd><ul><li class=\"layui-nav-item\" ><a style=\"margin-Left:"+num*menuCell+"px\" class=\"\" href=\"javascript:;\"><i class='layui-icon' >&#xe653;</i> "+subMenu.title+"</a>" +
			"<dl class=\"layui-nav-child\">\n";
		for( var j = 0; j <subMenu.children.length; j++){
			subStr+=getChildMenu(subMenu.children[j],num);
		}
		subStr+="</dl></li></ul></dd>";
	}else{
		subStr+="<dd><a style=\"margin-Left:"+num*menuCell+"px\" href=\""+path+subMenu.href+"\" target='frame_div'><i class='layui-icon' >&#xe66c;</i> "+subMenu.title+"</a></dd>";
	}
	return subStr;
}