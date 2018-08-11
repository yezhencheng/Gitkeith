<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
        <script language="javascript">
           function yishengDel(yishengId)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/yishengDel.action?yishengId="+yishengId;
               }
           }
           function yishengEditPre(yishengId)
           {
                   window.location.href="<%=path %>/yishengEditPre.action?yishengId="+yishengId;
           }
           
           function yishengAdd()
           {
                 var url="<%=path %>/admin/yisheng/yishengAdd.jsp";
                 //var n="";
                 //var w="480px";
                 //var h="500px";
                 //var s="resizable:no;help:no;status:no;scroll:yes";
				 //openWin(url,n,w,h,s);
				 window.location.href=url;
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="5" background="<%=path %>/img/tbg.gif">&nbsp;专家管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="20%">姓名</td>
					<td width="20%">性别</td>
					<td width="20%">年龄</td>
					<td width="20%">所在科室</td>
					<td width="20%">操作</td>
		        </tr>	
				<s:iterator value="#request.yishengList" id="yisheng">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td  bgcolor="#FFFFFF" align="center">
						<s:property value="#yisheng.yishengName"/>
					</td>
					<td  bgcolor="#FFFFFF" align="center">
					    <s:property value="#yisheng.yishengSex"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#yisheng.yishengAge"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#yisheng.keshiName"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<a href="#" onclick="yishengDel(<s:property value="#yisheng.yishengId"/>)" class="pn-loperator">删除</a>
					    <%--<a href="#" onclick="yishengEditPre(<s:property value="#yisheng.yishengId"/>)" class="pn-loperator">编辑</a>--%>
					</td>
				</tr>
				</s:iterator>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加" style="width: 80px;" onclick="yishengAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
