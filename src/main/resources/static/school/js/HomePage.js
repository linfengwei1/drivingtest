
var divNode;
var a;
var b;
function timeTimer() {
    var d = new Date();//实例化日期对象
    a = d.toLocaleTimeString();//获取日期
    b = d.toLocaleDateString();//获取时间
    document.getElementById("time1").innerHTML = "当前时间："+b+"&nbsp"+a;//.innerHTML是dom里面的方法（获取对象的内容  或  向对象插入内容，可以直接在网页上显示）
}
setInterval(function() {timeTimer()},1000);//这个方法可以这样写吗 。。。

function GoodsManager(node) {
    divNode = document.getElementById("iframe_div");
    divNode.src = node.title;
}


$(document).ready(function(){//这个是获取当前菜单的，点击时出现下滑的动画效果
    $(".h_mun").click(function(){
        $(this).next(".ul_menu").slideToggle("slow");
    });
});
//获取到的是h标签（一级标签）
// next（h标签下的第一个标签ul，因为有很多个h标签，所有会取到所有的ul）所以获取的是一个集合，点击后返回的也是一个集合；
// this。next是获取ul这个集合，包含里面的所有内容；

$(function () {
    // $("#closeAdmin").click(function () {
    //     var res = confirm("确定退出");
    //     if(res == true) {
    //         var path=   $("#path").val();
    //         location.href = path+ "/LoginServlet?method=deleteAdmin";
    //     }
    //
    // })
})