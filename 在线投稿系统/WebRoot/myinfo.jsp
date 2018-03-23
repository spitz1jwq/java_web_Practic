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
    <title>我的信息</title>
    <script type="text/javascript" src="<%=basePath %>js/jquery-1.4.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/yzjs.js"></script>
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
    		var uname=$("#guname").val();
			var upassword=$("#gupassword").val();
			var realname=$("#grealname").val();
			var gender=$("#ggender").val();
			var phone=$("#gphone").val();
			var addr=$("#gaddr").val();
			var email=$("#gemail").val();
			if(!ckemail(email)){
				alert("邮箱格式输入有误");
				return;
			}
			if(uname==""||upassword==""||realname==""||gender==""||phone==""||addr==""||email==""){
				alert('用户信息不完整。');
				return;
			}
    		$.ajax({
				url:'UpdSvlt',
	            type:'post',
    			dataType:"json",
    			data:{"tbname":"user","upassword":upassword,"realname":realname,"gender":gender,"phone":phone,"addr":addr,"email":email},
    			success:function(data){
    				alert(data.msg);
    			}
    		});
    	}
    	function bjbt(){
    		$("#nrdiv").hide();
    		$("#gldiv").show();
    	}
    	function bcbt(){
    		window.location.href="<%=basePath%>InitSvlt?tbname=myinfo";
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
                	<div id="nrdiv">
                    <table cellspacing="6px" style="text-align: center; height: 439px;">
                        <tr>
                            <td colspan="2" style="text-align: center; height: 38px; font-family: 微软雅黑; font-size: 16pt; color:White">
                             在线投稿系统
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center; height: 24px; font-family: 微软雅黑; font-size: 12pt; color:White">
                                用户信息
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center; height: 10px;">
                            	<b></b>
                            </td>
                        </tr>
                           <tr>
                            <td class="style2">
                               账号
                            </td>
                            <td class="style1">
                                ${user.uname }
                            </td>
                           </tr>
                           <tr>
                            <td class="style2">
                                姓名
                            </td>
                            <td class="style1">
                                 ${user.realname }
                            </td>
                           </tr>
                            <tr>
                            <td class="style2">
                                性别
                            </td>
                            <td class="style1">
                                 ${user.gender }
                            </td>
                           </tr>
                           <tr>
                            <td class="style2">
                                电话
                            </td>
                            <td class="style1">
                                 ${user.phone }
                            </td>
                           </tr>
                           <tr>
                            <td class="style2">
                                地址
                            </td>
                            <td class="style1">
                                 ${user.addr }
                            </td>
                           </tr>
                           <tr>
                            <td class="style2">
                                邮箱
                            </td>
                            <td class="style1">
                                 ${user.email }
                            </td>
                           </tr>
                         <tr>
                            <td class="style3">
                            </td>
                            <td class="style3" style="text-align:left;">
                                <input type="button" value="编  辑" onclick="bjbt();" />&nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <p>&nbsp;</p>
                                <p>&nbsp;</p>
                            </td>
                        </tr>
                    </table>
                	</div>
                	<div id="gldiv" style="display: none;">
                    <table cellspacing="6px" style="text-align: center; height: 439px;">
                        <tr>
                            <td colspan="2" style="text-align: center; height: 38px; font-family: 微软雅黑; font-size: 16pt; color:White">
                             在线投稿系统
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center; height: 24px; font-family: 微软雅黑; font-size: 12pt; color:White">
                                用户信息
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center; height: 10px;">
                            	<b></b>
                            </td>
                        </tr>
                           <tr>
                            <td class="style2">
                               账号
                            </td>
                            <td class="style1">
                                ${user.uname }
                            </td>
                           </tr>
                           <tr>
                            <td class="style2">
                                密码
                            </td>
                            <td class="style1">
                                <input id="gupassword" name="gupassword" type="text" value="${user.upassword }"/>
                            </td>
                           </tr>
                           <tr>
                            <td class="style2">
                                姓名
                            </td>
                            <td class="style1">
                                <input id="grealname" name="grealname" type="text" value="${user.realname }"/>
                            </td>
                           </tr>
                            <tr>
                            <td class="style2">
                                性别
                            </td>
                            <td class="style1">
                                <select id="ggender" name="ggender">
                                	<option <c:if test="${user.gender=='男' }">selected="selected"</c:if>>男</option>
                                	<option <c:if test="${user.gender=='女' }">selected="selected"</c:if>>女</option>
                                </select>
                            </td>
                           </tr>
                           <tr>
                            <td class="style2">
                                电话
                            </td>
                            <td class="style1">
                                <input id="gphone" name="gphone" type="text" value="${user.phone }"/>
                            </td>
                           </tr>
                           <tr>
                            <td class="style2">
                                地址
                            </td>
                            <td class="style1">
                                <input id="gaddr" name="gaddr" type="text" value="${user.addr }"/>
                            </td>
                           </tr>
                           <tr>
                            <td class="style2">
                                邮箱
                            </td>
                            <td class="style1">
                                <input id="gemail" name="gemail" type="text" value="${user.email }"/>
                            </td>
                           </tr>
                         <tr>
                            <td class="style3">
                            </td>
                            <td class="style3" style="text-align: left;">
                                <input type="button" value="提  交" onclick="tjbt();" />&nbsp;&nbsp;
								<input type="button" value="取  消" onclick="bcbt();" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <p>&nbsp;</p>
                                <p>&nbsp;</p>
                            </td>
                        </tr>
                    </table>
                	</div>
                </td>
                <td style="width: 30px; background-image: url('<%=basePath %>images/formback_3.jpg'); background-repeat: no-repeat; padding: 0px;">
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
