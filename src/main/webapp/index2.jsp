<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" type="text/css" href="statics/css/index.css">
    <link rel="stylesheet" href="statics/layui/css/layui.css"  media="all">

    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">

    <script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="statics/js/jquery.form.js"></script>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>


</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">网上商城后台管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">商品管理</a></li>
            <li class="layui-nav-item layui-this"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    贤心
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">用户操作</a></dd>
                        <dd><a href="javascript:;">用户修改日志</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">用户来信</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">反馈建议</a></dd>
                        <dd><a href="javascript:;">投诉举报</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body" style="background-color: #f4f4f4">
        <!-- 内容主体区域 -->
        <div class="site-title" style="margin: 30px 0 20px 0">
            <fieldset style="border: none; padding: 0; border-top: 2px solid #e6e6e6;">
                <legend style="margin-left: 50px;  padding: 0 10px; font-size: 22px; font-weight: 300;">
                    <a name="use">用户基本信息管理</a>
                </legend>
            </fieldset>
        </div>
        <div style="padding: 10px 100px;">
            <div class="container">
                <table id="dg" title="My Users" class="easyui-datagrid" style="width:1000px;height:650px"
                       toolbar="#toolbar" pagination="true"
                       rownumbers="true" fitColumns="true" singleSelect="true">
                    <thead>
                    <tr>
                        <th field="id" width="40"> Id</th>
                        <th field="name" width="40"> Name</th>
                        <th field="password" width="40">Password</th>
                        <th field="phone" width="40">Phone</th>
                        <th field="email" width="40">Email</th>
                    </tr>
                    </thead>
                </table>
                <div id="toolbar">
                    <form class="layui-form"  id="query" action="">
                        <div class="layui-form-item">
                            <div class="layui-input-inline" style="width: 88%; margin: 0">
                                <input id="searchInput" type="text" name="title" required  lay-verify="required" placeholder="输入用户名进行搜索" autocomplete="off" class="layui-input">
                            </div>
                            <div class="layui-input-inline"  style="width: 12%; margin: 0">
                                <button class="layui-btn" style="width: 100%" lay-submit lay-filter="formDemo" onclick="searchUser()">搜索</button>
                            </div>
                        </div>
                    </form>
                    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">New User</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">Edit User</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">Remove User</a>
                </div>

                <div id="dlg" class="easyui-dialog" style="width:400px" data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons'">
                    <form id="fm" method="post" novalidate style="margin:0;padding:20px 50px">
                        <h3>User Information</h3>
                        <div style="margin-bottom:10px">
                            <input name="name" class="easyui-textbox" required="true" label=" Name:" style="width:100%">
                        </div>
                        <div style="margin-bottom:10px">
                            <input name="password" class="easyui-textbox" required="true" label="password:" style="width:100%">
                        </div>
                        <div style="margin-bottom:10px">
                            <input name="phone" class="easyui-textbox" required="true" label="Phone:" style="width:100%">
                        </div>
                        <div style="margin-bottom:10px">
                            <input name="email" class="easyui-textbox" required="true" validType="email" label="Email:" style="width:100%">
                        </div>
                    </form>
                </div>
                <div id="dlg-buttons">
                    <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveUser()" style="width:90px">Save</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
                </div>
            </div>
        </div>
    </div>

</div>
<script src="statics/layui/layui.js" charset="utf-8"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });

    var url;
    function initDataGrid(url) {
        $('#dg').datagrid({
            url: url
        });
    }
    function searchUser(){
        var input = $('#query :input').eq(0).val();
        $('#query').ajaxForm({
            url: 'queryByName?name='+input,
            dataType: 'json',
            success: function(responseText){
                initDataGrid("queryByName?name="+input);
                $('#dg').datagrid('reload');
            }
        })
    }
    function newUser(){
        $('#dlg').dialog('open').dialog('center').dialog('setTitle','New User');
        $('#fm').form('clear');
        url = 'addUser';
    }
    function editUser(){
        var row = $('#dg').datagrid('getSelected');
        if (row){
            $('#dlg').dialog('open').dialog('center').dialog('setTitle','Edit User');
            $('#fm').form('load',row);
            url = 'updateUser?id='+row.id;
        }
    }
    function saveUser(){
        $('#fm').form('submit',{
            url: url,
            onSubmit: function(){
                return $(this).form('validate');
            },
            success: function(result){
                $('#dlg').dialog('close');        // close the dialog
                $('#dg').datagrid('reload');    // reload the user data
            }
        });
    }
    function destroyUser(){
        var row = $('#dg').datagrid('getSelected');
        if (row){
            $.messager.confirm('Confirm','Are you sure you want to destroy this user?',function(r){
                if (r){
                    $.post('removeUser',{id:row.id,time:new Date()},function(result){
                    },'json');
                    $('#dg').datagrid('reload');    // reload the user data
                }
            });
        }
    }

    $(function () {
        initDataGrid("queryAll");
    })
</script>
</body>
</html>