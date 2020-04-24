jQuery(function($){
    var $chatWindow = $('#chatWindow');
    var $top = $chatWindow.find('.top');
    var $minWindow = $('#minwidow');
    var $msglist = $('.body .msglist ul');

    var msgidx = -1;  // 消息历史，默认无

    // 拖拽效果
    $top.mousedown(function(e){
        // var e = e || window.event;  // 已经用了jq，不考虑兼容性
        var ox = e.clientX - $chatWindow.offset().left;
        var oy = e.clientY - $chatWindow.offset().top;
        document.onmousemove=function(evt){
            var x = evt.clientX-ox;
            var y = evt.clientY-oy;
            if(x<=0) x=0;
            if(y<=0) y=0;
            if(x>=window.innerWidth - $chatWindow.outerWidth()) x=window.innerWidth - $chatWindow.outerWidth();
            if(y>=window.innerHeight - $chatWindow.outerHeight()) y=window.innerHeight - $chatWindow.outerHeight();
            $chatWindow.css({left:x,top:y})
            return false;
        }
        document.onmouseup=function(){
            document.onmousemove=null;
        }
    })
    // 关闭按钮
    $('.marco-guanbi').click(function(e){
        $chatWindow.hide();
    })
    // 改变窗口大小
    $('.changewindow').click(function(){
        $(this).toggleClass('marco-zuidahua1');
        $chatWindow.toggleClass('big');
    })
    // 最小化
    $('.marco-zuixiaohua').click(function(){
        $chatWindow.slideUp(function(){
          $minWindow.fadeIn();
        });
    })
    // 复原
    $minWindow.click(function(){
        $minWindow.hide();
        $chatWindow.slideDown();
    })



    var msgArr = [];  // 记录用户发送消息的记录
    // 问答系统
    function QAsystem(){
        var val = $('.question').val().trim();
        if(val == '') return false;
        // 生成问题列表
        var Qtime = new Date();
        Qtime=Qtime.format('YYYY-MM-DD hh:mm')
        $('<li/>').addClass('clfix Time').html('<span class="fr time">'+Qtime+'</span>').appendTo($msglist);
        var $Qli = $('<li/>').addClass('clfix').html('<span class="fr customer triangle-right">'+val+'</span>').appendTo($msglist);
        msgArr.unshift(val);
        $('.body')[0].scrollTop = $('.body')[0].scrollHeight;
        $('.question').val('').focus();
        msgidx = -1;
        // 生成回答列表
        setTimeout(function(){
            $.ajax({
               type: "get",
               url: "http://www.tuling123.com/openapi/api?key=49de46c409c047d19b2ed2285e8775a6&info="+val,
               // data: "mes="+val,
               success: function(res){
                    var res = res.text;
                    console.log(res);
                    $('<li/>').addClass('clfix Time').html('<span class="fl time">'+Qtime+'</span>').appendTo($msglist);
                    var $Ali = $('<li/>').addClass('clfix');
					$Ali.html('<span class="fl robot triangle-left">'+res+'</span>');
                    $msglist.append($Ali);
                    $('.body')[0].scrollTop = $('.body')[0].scrollHeight;
					
					// res.forEach((item,idx)=>{
     //                    var $Ali = $('<li/>').addClass('clfix');
     //                    if(item.resultType == 'url'){
     //                        $Ali.html(`<a href="${item.values.url}" class="fl robot triangle-left" target="_blank">${item.values.url}</a>`);
     //                    }else if(item.resultType == 'image'){
     //                        $Ali.html(`<img src="${item.values.image}" class="fl"/>`);
     //                    }else if(item.resultType == 'text'){
     //                        $Ali.html(`<span class="fl robot triangle-left">${item}</span>`);
     //                    }else if(item.resultType == 'news'){
     //                        var newsArr = item.values.news;
     //                        var ol = $('<ol class="news"></ol>');
     //                        var newshtml = newsArr.map((items,idx)=>{
     //                            return `<li class="clfix">
     //                                <a href="${items.detailurl}" class="name" target="_blank">${items.name}</a>
     //                                <span class="info">${items.info}</span>
     //                            </li>`
     //                        }).join('')
     //                        ol.html(newshtml);
     //                        $Ali.html(ol);
     //                    }else{
     //                        $Ali.html('<span class="fl robot triangle-left">你说什么？风太大我看不见哈哈哈~~~！</span>');
     //                    }
					// 	$Ali.html(`<span class="fl robot triangle-left">"+res+"</span>`);
     //                    $msglist.append($Ali);
     //                    $('.body')[0].scrollTop = $('.body')[0].scrollHeight;
     //                })
               }
            });
        },1000)
    }

    // 点击发送
    $('.foot .bottom input').click(function(){
        QAsystem();
    })

    $(".question").bind("keypress", function(){
        if (event.keyCode == 13){
            // 触发需要调用的方法
            QAsystem();
        }
    })
    // 移入发送按钮提示快捷键
    $('.foot .bottom input').mousemove(function(e){
        $('.send_hint').show();
        var x = e.clientX-$('.foot .bottom').offset().left+10;
        var y = e.clientY-$('.foot .bottom').offset().top+10;
        if(e.clientX+10>=window.innerWidth-$('.send_hint').outerWidth()){
            x = e.clientX-$('.foot .bottom').offset().left - $('.send_hint').outerWidth() -5;
        }
        if(e.clientY+10>=window.innerHeight-$('.send_hint').outerHeight()){
            y = e.clientY-$('.foot .bottom').offset().top - $('.send_hint').outerHeight() -5;
        }
        $('.send_hint').css({
            left:x,
            top:y
        })
    })
    $('.foot .bottom input').mouseout(function(){
        $('.send_hint').hide();
    })

    // 键盘Ctrl+Enter发送消息
    // 上下键选择消息历史
    window.onkeydown=function(e){
        if(e.ctrlKey && e.keyCode===13){ 
            QAsystem();
        }else if(e.keyCode === 38){ // 向上选择消息记录
            if(msgArr == []){
                return false;
            }else{
                msgidx++;
                if(msgidx >= msgArr.length-1) msgidx=msgArr.length-1;
                if(msgidx <= -1){
                    $('.question').val('');
                }else{
                    $('.question').val(msgArr[msgidx]);
                }
                
            }
        }else if(e.keyCode === 40){ // 向下选择消息记录
            if(msgArr == []){
                return false;
            }else{
                msgidx--;
                if(msgidx <= -1) msgidx = -1;
                if(msgidx <= -1){
                    $('.question').val('');
                }else{
                    $('.question').val(msgArr[msgidx]);
                }
            }
        }
    }
})