<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>admin</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/concss.css">
		<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath %>js/syssmp.js"></script>
		<script type="text/javascript">
			function addbt(){
				$("#flagi").val("add");
				$("#guname").val("");
				$("#gupassword").val("");
				dshow();
				$("#gldiv").show();
			}
			function updbt(id,uname,upassword){
				$("#flagi").val("upd");
				$("#idi").val(id);
				$("#guname").val(uname);
				$("#gupassword").val(upassword);
				dshow();
				$("#gldiv").show();
			}
			function dshow(){
				$("#nrdiv").hide();
				$("#gldiv").hide();
			}
			//保存
			function gltj(){
				var uname=$("#guname").val();
				var upassword=$("#gupassword").val();
				var id=$("#idi").val();
				var flag=$("#flagi").val();
				if(uname==""||upassword==""){
					alert('管理员信息不完整。');
					return;
				}
				if("add"==flag){
					$.ajax({
						url:'AddSvlt',
						type:'post',
						data:{"tbname":"admin","uname":uname,"upassword":upassword},
						dataType:'json',
						success:function(data){
							alert(data.msg);
						}
					});
				}else if("upd"==flag){
					$.ajax({
						url:'UpdSvlt',
						type:'post',
						data:{"tbname":"admin","id":id,"uname":uname,"upassword":upassword},
						dataType:'json',
						success:function(data){
							alert(data.msg);
						}
					});
				}
			}
			//取消
		function rst(){
			window.location.href="InitSvlt?tbname=admin";
		}
		//查询
		function cktj(){
			var un=$("#ckuname").val();
			var sqls="select * from admin";
			if(un!=""){
				sqls+=" where uname like '%"+un+"%'";
			}
			$.ajax({
				url:'CkSvlt',
				type:'post',
				data:{sql:sqls},
				dataType:'json',
				success:function(data){
					if(data.msg==1){
						window.location.href="InitSvlt?tbname=admin";
					}else{
						alert(data.msg);
					}
				}
			});
		}
		function cbonclick(){
			var cb1=$("#delids").attr("checked");
			if(cb1){
				$("input:checkbox").attr("checked",true);
			}else{
				$("input:checkbox").attr("checked",false);
			}
		}
		function delsbt(){
			var ids="";
			$("input:checkbox").each(
				function(){
					if($(this).attr("checked")){
						var nm=$(this).attr("name");
						if(nm.indexOf("delids")!=0){
							ids+=$(this).val()+",";
						}
					}
				}
			);
			if(ids==""){
				alert("请选择所要删除的数据.");
				return;
			};
			$.ajax({
				url:'DelSvlt',
				type:'post',
				dataType:'json',
				data:{"ids":ids,"tbname":"admin"},
				success:function(data){
					window.location.href="InitSvlt?tbname=admin";
					alert(data.msg);
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
					<td width="150" align="left" style="color: #7a7a7a;font-weight: bold;">管理员信息管理</td>
					<td>账号：</td>
					<td><input type="text" id="ckuname" name="ckuname"/></td>
					<td>    
						&nbsp;<input type="button" value="查 询" onclick="cktj();"/>
					</td>
					<td>
						&nbsp;<input type="button" value="添 加" onclick="addbt();"/>
					</td>
					<td>
					&nbsp;<input type="button" value="删 除" onclick="delsbt();"/>
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
						<td width="5%" height="20" bgcolor="d3eaef" class="STYLE10" align="center">
							<input name="delids" type="checkbox" onclick="cbonclick();" />
						</td>
						<td width="0" height="20" bgcolor="d3eaef" class="STYLE6" align="center">账号</td>
						<td width="0" height="20" bgcolor="d3eaef" class="STYLE6" align="center">密码</td>
						<td width="8%" height="20" bgcolor="d3eaef" class="STYLE6" align="center">操作</td>
					</tr>
				<c:forEach var="a" items="${alist}">
				<tr>
					<td width="0" height="20" bgcolor="#FFFFFF" align="center">
						<input name="delid" type="checkbox" value="${a.id }"/>
					</td>
					<td width="0" height="20" bgcolor="#FFFFFF" class="STYLE19">${a.uname }</td>
					<td width="0" height="20" bgcolor="#FFFFFF" class="STYLE19">${a.upassword }</td>
					<td width="0" height="20" bgcolor="#FFFFFF" align="center" class="STYLE19">
						<input type="button" value="修改" onclick="updbt('${a.id}','${a.uname}','${a.upassword}');"/>
					</td>
				</tr>
				</c:forEach>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="33%"><div align="left"><span class="STYLE22">&nbsp;&nbsp;&nbsp;&nbsp;当前第<strong>${pagenum }</strong> 页，共 <strong>${pagenums }</strong> 页</span></div></td>
				<td width="67%"><table width="321" border="0" align="right" cellpadding="0" cellspacing="0">
					<tr>
						<td width="49"><div align="center"><input type="image" src="<%=basePath%>images/main_54.gif" width="40" height="15" onclick="sybtdown('PagingSvlt?flag=1','admin');"/></div></td>
						<td width="49"><div align="center"><input type="image" src="<%=basePath%>images/main_56.gif" width="45" height="15" onclick="syybtdown('PagingSvlt?flag=2','admin');"/></div></td>
						<td width="49"><div align="center"><input type="image" src="<%=basePath%>images/main_58.gif" width="45" height="15" onclick="xyybtdown('PagingSvlt?flag=3','admin');"/></div></td>
						<td width="49"><div align="center"><input type="image" src="<%=basePath%>images/main_60.gif" width="40" height="15" onclick="wybtdown('PagingSvlt?flag=4','admin');"/></div></td>
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
		<tr>
			<td width="25%" align="right">账号：</td>
			<td>
				<input type="text" id="guname" name="guname" />
			</td>
		</tr>
		<tr>
			<td height="9" colspan="2"></td>
		</tr>
		<tr>
			<td width="25%" align="right">密码：</td>
			<td>
				<input type="text" id="gupassword" name="gupassword" />
			</td>
		</tr>
		<tr>
			<td height="9" colspan="2"></td>
		</tr>
		<tr>
			<td></td>
			<td height="15">
				<input type="button" value="确定" onclick="gltj();"/>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="取消" onclick="rst();"/>
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
