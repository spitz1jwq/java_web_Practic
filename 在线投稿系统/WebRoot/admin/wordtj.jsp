<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>wordinfo</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/concss.css">
		<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath %>js/syssmp.js"></script>
		<script type="text/javascript">
		//查询
		function cktj(){
			var sqls="select realname,uname,count(wordinfo.id) as allnum from users left join wordinfo on tgid=users.id where role='投稿人'  group by realname,uname";
			var un=$("#ckuname").val();
			if(un!=""){
				sqls+=" and realname like '%"+un+"%'";
			}
			$.ajax({
				url:'CkSvlt',
				type:'post',
				data:{sql:sqls},
				dataType:'json',
				success:function(data){
					if(data.msg==1){
						window.location.href="InitSvlt?tbname=wordtj";
					}else{
						alert(data.msg);
					}
				}
			});
		}
		
	</script>
</head>
<body style="margin: 0px 0px 0px 0px;">	<center>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-bottom:5px;">
		<tr>
			<td width="13"><img src="<%=basePath%>images/2_11.gif" width="13" height="36" /></td>
			<td background="<%=basePath%>images/2_13.gif"><table height="36" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="50">&nbsp;</td>
					<td width="150" align="left" style="color: #7a7a7a;font-weight: bold;">投稿统计</td>
					<td>投稿人：</td>
					<td><input id="ckuname" name="ckuname" type="text"/>
					</td>
					<td>    
						&nbsp;<input type="button" value="查 询" onclick="cktj();"/>
					</td>
				<td>&nbsp;</td>
			</tr>
			</table></td>
			<td width="13"><img src="<%=basePath%>images/2_15.gif" width="13" height="36" /></td>
		</tr>
	</table>
	<div id="nrdiv">
	<table width="100%" border="0" cellpadding="0" cellspacing="2" bgcolor="#E8F5FD" style="border:1px solid #0C89A9" id="sho1">
		<tr>
			<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce">
					<tr>
						<td width="0" height="20" bgcolor="d3eaef" class="STYLE6" align="center">投稿人</td>
						<td width="0" height="20" bgcolor="d3eaef" class="STYLE6" align="center">账号</td>
						<td width="0" height="20" bgcolor="d3eaef" class="STYLE6" align="center">投稿数量</td>
					</tr>
				<c:forEach var="a" items="${alist}">
				<tr>
					<td width="0" height="20" bgcolor="#FFFFFF" class="STYLE19">${a.realname }</td>
					<td width="0" height="20" bgcolor="#FFFFFF" class="STYLE19">${a.uname }</td>
					<td width="0" height="20" bgcolor="#FFFFFF" class="STYLE19">${a.allnum }</td>
				</tr>
				</c:forEach>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="33%"><div align="left"><span class="STYLE22">&nbsp;&nbsp;&nbsp;&nbsp;当前第<strong>${pagenum }</strong> 页，共 <strong>${pagenums }</strong> 页</span></div></td>
				<td width="67%"><table width="321" border="0" align="right" cellpadding="0" cellspacing="0">
					<tr>
						<td width="49"><div align="center"><input type="image" src="<%=basePath%>images/main_54.gif" width="40" height="15" onclick="sybtdown('PagingSvlt?flag=1','wordtj');"/></div></td>
						<td width="49"><div align="center"><input type="image" src="<%=basePath%>images/main_56.gif" width="45" height="15" onclick="syybtdown('PagingSvlt?flag=2','wordtj');"/></div></td>
						<td width="49"><div align="center"><input type="image" src="<%=basePath%>images/main_58.gif" width="45" height="15" onclick="xyybtdown('PagingSvlt?flag=3','wordtj');"/></div></td>
						<td width="49"><div align="center"><input type="image" src="<%=basePath%>images/main_60.gif" width="40" height="15" onclick="wybtdown('PagingSvlt?flag=4','wordtj');"/></div></td>
						<td width="37" class="STYLE22"><div align="center"></div></td>
						<td width="22"><div align="center">
						</div></td>
						<td width="22" class="STYLE22"><div align="center"></div></td>
						<td width="44">
						</td>
					</tr>
				</table></td>
			</tr>
		</table>
		</td>
		</tr>
	</table>
	</div>
	<div id="gldiv" style="display: none;text-align: center; width: 100%;">
	<table style="width: 100%">
		<tr>
			<td height="15" colspan="2" align="center" style="color: red;">
				<input type="hidden" id="idi" name="idi" value=""/>
				<input type="hidden" id="userid" name="userid" value="${userid }"/>
				<input type="hidden" id="flagi" name="flagi" value=""/>
			</td>
		</tr>
	</table>
	</div>
		<input type="hidden" id="hrownums" value="${rownums }" />
		<input type="hidden" id="hpagenum" value="${pagenum }" />
		<input type="hidden" id="hpagenums" value="${pagenums }" />
		<div style="display: none;">
			<form id="fm" action="" method="post">
				<input id="pt" name="tbname"/>
			</form>
		</div>
		</center>
	</body>
</html>
