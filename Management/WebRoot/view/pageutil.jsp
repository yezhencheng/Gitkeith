<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="JavaScript" src="<%=basePath%>js/front/jquery.min.js" type="text/javascript"></script>
	<script language="JavaScript" src="<%=basePath%>js/pageutil.js" type="text/javascript"></script>
  </head>
  
  <body>
   <div class="message">
    共<i class="blue">${pagehelper.total}</i>条记录，当前显示第&nbsp;<i
        class="blue">${pagehelper.pageNum}/${pagehelper.pages}</i>&nbsp;页
</div>
<div style="text-align:center;">
    <ul class="pagination">
        <!-- <li><a href="#">&laquo;</a></li> -->
        <c:if test="${!pagehelper.isFirstPage}">
            <li><a href="javascript:queryAllPerson(${pagehelper.firstPage}, ${pagehelper.pageSize});">首页</a></li>
            <li><a href="javascript:queryAllPerson(${pagehelper.prePage}, ${pagehelper.pageSize});">上一页</a></li>
        </c:if>
        <c:forEach items="${pagehelper.navigatepageNums}" var="navigatepageNum">
        
            <c:if test="${navigatepageNum==pagehelper.pageNum}">
                <li class="active"><a href="javascript:queryAllPerson(${navigatepageNum}, ${pagehelper.pageSize});">${navigatepageNum}</a></li>
            </c:if>
            <c:if test="${navigatepageNum!=pagehelper.pageNum}">
                <li><a href="javascript:queryAllPerson(${navigatepageNum}, ${pagehelper.pageSize});">${navigatepageNum}</a></li>
            </c:if>
        </c:forEach>
        <c:if test="${!pagehelper.isLastPage}">
            <li><a href="javascript:queryAllPerson(${pagehelper.nextPage}, ${pagehelper.pageSize});">下一页</a></li>
            <li><a href="javascript:queryAllPerson(${pagehelper.lastPage}, ${pagehelper.pageSize});">最后一页</a></li>
        </c:if>
        <!-- <li><a href="#">&raquo;</a></li> -->
    </ul>
</div>
      <script type="text/javascript">
        function queryDeviceRecords(pageNum) {
            var id=$("#deviceId").val();
            $("#paging").load("<%=basePath %>view/pageutil.jsp?id="+id+"&pageNum=" + pageNum);
        }
    </script>
  </body>
</html>
