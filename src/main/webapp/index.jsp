<%--
  Created by IntelliJ IDEA.
  User: mrjiao
  Date: 2018/5/21
  Time: 下午3:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Basic CRUD Application - jQuery EasyUI CRUD Demo</title>
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/demo/demo.css">
    <link rel="stylesheet" type="text/css" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.min.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="http://cdn.amazeui.org/amazeui/2.7.2/js/amazeui.min.js"></script>
</head>
<style type="text/css">
    body {
        display: flex;
        justify-content: center;
    }

    .container {
        width: 600px;
    }
</style>
<body>
<div class="container">
    <h2>基础CRUD操作</h2>

    <table id="dg" title="My Users" class="easyui-datagrid" style="width:700px;height:500px"
           toolbar="#toolbar" pagination="true"
           rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
        <tr>
            <th field="name" width="66.7">Name</th>
            <th field="phone" width="66.7">Phone</th>
            <th field="email" width="66.7">Email</th>
        </tr>
        </thead>
        <tbody>

        <%--todo el表达式完善--%>
        <%--<c:forEach items="${requestScope.users}" var="user">--%>
            <%--<tr>--%>
                <%--<td>${user.name}</td>--%>
                <%--<td>${user.phoneNumber}</td>--%>
                <%--<td>${user.email}</td>--%>
            <%--</tr>--%>
        <%--</c:forEach>--%>

        </tbody>
    </table>
    <div id="toolbar">

        <form action="" method="get">
            <input type="text" class="am-form-field am-radius" placeholder="输入用户名进行搜索"
                   style="width: 84%; display: inline-block;"/>
            <button type="submit" class="am-btn am-btn-secondary" style="width: 15%">搜索</button>
        </form>

        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">New
            User</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">Edit
            User</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true"
           onclick="destroyUser()">Remove User</a>
    </div>

    <div id="dlg" class="easyui-dialog" style="width:400px"
         data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons'">
        <form id="fm" method="post" novalidate style="margin:0;padding:20px 50px">
            <h3>User Information</h3>
            <div style="margin-bottom:10px">
                <input name="name" class="easyui-textbox" required="true" label="Name:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="phone" class="easyui-textbox" required="true" label="Phone:" style="width:100%">
            </div>
            <div style="margin-bottom:10px">
                <input name="email" class="easyui-textbox" required="true" validType="email" label="Email:"
                       style="width:100%">
            </div>
        </form>
    </div>
    <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveUser()"
           style="width:90px">Save</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
           onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
    </div>
</div>
<script type="text/javascript">
    var url;

    function newUser() {
        $('#dlg').dialog('open').dialog('center').dialog('setTitle', 'New User');
        $('#fm').form('clear');
        url = '/add';
    }

    function editUser() {
        var row = $('#dg').datagrid('getSelected');
        if (row) {
            $('#dlg').dialog('open').dialog('center').dialog('setTitle', 'Edit User');
            $('#fm').form('load', row);
            url = '/update?id=' + row.id;
        }
    }

    function saveUser() {
        $('#fm').form('submit', {
            url: url,
            onSubmit: function () {

            },
            success: function () {
                $('#dlg').dialog('close');        // close the dialog
                $('#dg').datagrid('reload');    // reload the user data
            }
        });
    }

    function destroyUser() {
        var row = $('#dg').datagrid('getSelected');
        if (row) {
            $.messager.confirm('Confirm', 'Are you sure you want to destroy this user?', function (r) {
                if (r) {
                    $.post('destroy_user.php', {id: row.id}, function (result) {
                        if (result.success) {
                            $('#dg').datagrid('reload');    // reload the user data
                        } else {
                            $.messager.show({    // show error message
                                title: 'Error',
                                msg: result.errorMsg
                            });
                        }
                    }, 'json');
                }
            });
        }
    }
</script>
</body>
</html>
