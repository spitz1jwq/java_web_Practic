<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>修改密码</title>
    <script type="text/javascript" src="<%=basePath %>js/jquery-1.4.1.min.js"></script>
    <style type="text/css">
        body
        {
            font-size: 10pt;
            font-family: "宋体";
            margin: 0px;
            padding: 0px;
            color: #0077AA;
            overflow: hidden;
        }
        .style1
        {
            width: 280px;
            text-align: left;
        }
        .style2
        {
            width: 120px;
            text-align: right;
        }
        .style3
        {
            height: 50px;
        }
    </style>
    <script type="text/javascript">
    	function tjbt(){
    		var opwd=$("#opwd").val();
    		var npwd=$("#npwd").val();
    		var dnpwd=$("#dnpwd").val();
    		if(opwd==""){
    			alert("请输入原密码");
    			return;
    		}
    		if(npwd==""){
    			alert("密码不能为空");
    			return;
    		}
    		if(npwd!=dnpwd){
    			alert("两次密码输入不一致。");
    			return;
    		}
    		$.ajax({
				url:'UpdPwdSvlt',
	            type:'post',
    			dataType:"json",
    			data:{"opwd":opwd,"npwd":npwd},
    			success:function(data){
    				alert(data.msg);
    			}
    		});
    	}
    </script>
</head>
<body style="">
    <div id="tea" style="text-align: center; margin: 30px auto auto auto;">
        <table cellspacing="0px" style="text-align: center; padding: 0px;  margin: 0px auto 0px auto;">
            <tr>
                <td style="width: 30px; background-image: url('<%=basePath %>images/formback_1.jpg'); background-repeat: no-repeat; padding: 0px;">
                </td>
                <td style="background-image: url('<%=basePath %>images/formback_2.jpg')">
                    <table cellspacing="6px" style="text-align: center; height: 439px;">
                        <tr>
                            <td colspan="2" style="text-align: center; height: 38px; font-family: 微软雅黑; font-size: 16pt; color:White">
                             在线投稿系统
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center; height: 24px; font-family: 微软雅黑; font-size: 12pt; color:White">
                                修改密码
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center; height: 10px;">
                            	<b></b>
                            </td>
                        </tr>
                           <tr>
                            <td class="style2">
                               原密码
                            </td>
                            <td class="style1">
                                <input id="opwd" name="opwd" type="text"/>
                            </td>
                           </tr>
                           <tr>
                            <td class="style2">
                                密码
                            </td>
                            <td class="style1">
                                <input id="npwd" name="npwd" type="text"/>
                            </td>
                           </tr>
                           <tr>
                            <td class="style2">
                                确认密码
                            </td>
                            <td class="style1">
                                <input id="dnpwd" name="dnpwd" type="text"/>
                            </td>
                           </tr>
                         <tr>
                            <td class="style3">
                            </td>
                            <td class="style3" style="text-align: center;">
                                <input type="button" value="提  交" onclick="tjbt();" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <p>&nbsp;</p>
                                <p>&nbsp;</p>
                                 <p>&nbsp;</p>
                                <p>&nbsp;</p>
                                <p>&nbsp;</p>
                                <p>&nbsp;</p>
                                <p>&nbsp;</p>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 30px; background-image: url('<%=basePath %>images/formback_3.jpg'); background-repeat: no-repeat; padding: 0px;">
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
