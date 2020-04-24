if(!Date.prototype.format){
    /*
        RegExp.$n:保存正则匹配到的分组
     */
    Date.prototype.format=function(fmt){
        // 这里面的this指向实例，即谁调用format方法this就指向谁
        var o={
            "M+": this.getMonth() + 1,
            "D+": this.getDate(),
            "h+": this.getHours(),
            "m+": this.getMinutes(),
            "s+": this.getSeconds()
        };

        // 配置年份（年份比较特殊，这里单独处理）
        // 若有年份，则匹配年份，利用RegExp.$1可以获取第一个分组内容
        if(/(Y+)/.test(fmt)){
            // true 说明有传入年份
            var res=String(this.getFullYear()).substr(4-RegExp.$1.length);
            fmt=fmt.replace(RegExp.$1,res);
        }

        // 配置其他
        for(var attr in o){
            var reg=new RegExp('('+attr+')')
            if(reg.test(fmt)){
                var res = RegExp.$1.length<2 ? o[attr] : ('00'+o[attr]).substr(String(o[attr]).length);
                fmt=fmt.replace(RegExp.$1,res);
            }
        }
        return fmt;
    }
}