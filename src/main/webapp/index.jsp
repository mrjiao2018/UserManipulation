<%--
  Created by IntelliJ IDEA.
  User: mrjiao
  Date: 2018/5/25
  Time: 下午2:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Basic CRUD Application - jQuery EasyUI CRUD Demo</title>
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">
    <%--<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/demo/demo.css">--%>
    <link rel="stylesheet" type="text/css" href="statics/css/index.css">
    <link rel="stylesheet" type="text/css" href="statics/css/index2.css">
    <link rel="stylesheet" type="text/css" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.min.css">


    <script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="statics/js/jquery.form.js"></script>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
</head>
<body>
    <div class="container">
        <h2>java web项目：数据库管理程序</h2>

        <table id="dg" title="My Users" class="easyui-datagrid" style="width:700px;height:450px"
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
            <form id="query" action="" method="post">
                <input type="text" class="am-form-field am-radius" style="width: 80%" placeholder="输入用户名进行搜索" style="width: 84%; display: inline-block;"/>
                <button type="submit" style="width: 17%" class="am-btn am-btn-secondary" style="width: 15%" onclick="searchUser()">搜索</button>
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
<script type="text/javascript">
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
                    $.post('removeUser',{id:row.id},function(result){
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
