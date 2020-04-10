<%--
  Created by IntelliJ IDEA.
  User: HJY
  Date: 2020-1-5
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>友情链接_编辑修改</title>
    <link href="main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<script LANGUAGE=javascript>
    function rewlink(){
        if((refform.linkname.value == "")||(refform.linkurl.value == "")){
            alert("关键字不能为空，")
        }else{
            if(refform.linkurl.value.substring(0,7).toLowerCase() == 'http://'){
                return true;
            }else{
                alert("必须带http://");
                return false;
            }
        }
        return false;
    }
</script>
<div id="main">
    <div id="inmain">
        <div id="main_head">当前位置:<strong>后台首页</strong> >； <strong>其它信息管理e5a48de588b6e799bee5baa631333337393632</strong> >； <strong>友情链接管理</strong></div>
        <div id="main_text">
            <form name="refform" action="../admin/LinkServlet？method=rewLink&link_id=${rew.link_id }" method="post" onSubmit="return rewlink();">
                <input name="link_id" type="hidden" value="${rew.link_id }"/>
                <div class="main_table">
                    <dl>
                        <dt>修改友情链接</dt>
                        <dd class="table_style">
                            <ul>
                                <li style="width:150px;">描述</li>
                                <li style="width:200px;"><input name="linkname" value="${rew.link_name }" type="text" class="border" /></li>
                                <li></li>
                            </ul>
                        </dd>
                        <dd class="table_style">
                            <ul>
                                <li style="width:150px;">链接地址</li>
                                <li style="width:200px;"><input type="text" name="linkurl" value="${rew.link_url }" class="border" /></li>
                                <li><span>[ 需要添加 “http://” ]</span></li>
                            </ul>
                        </dd>
                        <dd class="table_handle">
                            <ul>
                                <li style="width:83px;">
                                    <input type="submit" value="修改" class="bt" />
                                </li>
                                <li style="width:50px;">
                                    <input type="reset" value="重置" class="bt" />
                                </li>
                            </ul>
                        </dd>
                    </dl>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
