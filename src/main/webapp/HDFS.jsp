<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>HDFS</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="js/jquery.js"></script>
    <script type="text/javascript" src="layui/layui.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css" type="text/css"/>

</head>
<body>
<div class="layui-col-md12" >
    <div class="layui-row grid-demo grid-demo-bg1">
        <fieldset class="layui-elem-field layui-field-title site-demo-button" style="margin-top: 30px;">
            <legend >HDFS</legend>
        </fieldset>
        <div class="layui-upload" style="margin-left: 20px">
            <button type="button" class="layui-btn" id="upload">上传文件</button>
        </div>
        <form class="layui-form" action="" style="margin-top: 30px;" name="form" >
            <div class="layui-form-item" >
                <div class="layui-input-block layui-input-inline" style="margin-left: 20px;">
                    <input type="text" placeholder="请输入需预测的内容" id="content" class="layui-input" style="width: 500px;">
                </div>
                <div class="layui-input-block layui-input-inline" style="margin-left: 315px">
                    <button type="button" class="layui-btn layui-btn-normal" id="prerdit2" onclick="single()">开始预测</button>
                </div>
            </div>
        </form>
        <fieldset class="layui-elem-field layui-field-title site-demo-button" style="margin-top: 30px;">
            <legend >预测结果</legend>
        </fieldset>
        <div class="layui-form-item layui-form-text" style="width: 800px;">
            <label class="layui-form-label"></label>
            <div class="layui-input-block">
                <p id="crate">好评正确率：</p><br>
                <p id="wrate">差评正确率：</p><br>
                <textarea placeholder="请输入内容" class="layui-textarea"  id="res" readonly></textarea>
                <a class="layui-btn layui-btn-normal" id="copy" style="float: right;margin-top: 5px;">复制</a>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $("#res").html(" ")
    layui.use('upload', function(){
        var $ = layui.jquery
        ,upload = layui.upload;

        upload.render({
            elem: '#upload'
            ,url: 'upload.action'
            ,accept: 'file'
            ,async:true
            ,method:"post"
            ,done: function(res){
                console.log(res)
                if(res.status ==="fail"){
                    layui.use('layer', function(){
                        var layer = layui.layer;
                        layer.alert("<h2 style='color:black'>" + res.data.errMsg + "</h2>",{title: "Tips"});
                    });
                }else if(res.status ==="success"){
                    layui.use('layer', function () {
                        var layer = layui.layer;
                        layer.alert("<h2 style='color:black'>" + '上传成功！' + "</h2>", {title: "Tips"});
                        setTimeout(function () {
                            //刷新
                            location.reload();
                        }, 1000);
                    });
                }
                console.log(res)  //返回对象数据
            }
        })
    })

    function single() {
        $("#res").html("请稍后...")
        layui.use('layer', function () {
            var layer = layui.layer;
            layer.alert("<h2 style='color:black'>" + '请稍后...' + "</h2>", {title: "Tips"});
        });
        $.post("test.action",{msg:$("#content").val()},function(res){
            console.log(res)
            $("#res").html(res.id+" : "+res.type+"!")
        })
    }

    function predictAll(){

        $.post("/xunlian.action",function(res){

        })
    }

    $(function () {
        const btn = $("#copy");
        btn.click( () => {
            const input = $("#res");
            input.select();
            if (document.execCommand('copy')) {
                document.execCommand('copy');
                alert('复制成功');
            }
        })
    })


</script>
</body>
</html>