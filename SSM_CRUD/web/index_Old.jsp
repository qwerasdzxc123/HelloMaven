<%--
  Created by IntelliJ IDEA.
  User: 肖宁
  Date: 2021/6/30
  Time: 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:forward page="/empsOld"></jsp:forward>
<html>
<head>
    <title>首页</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <%-- 引入 jQuery --%>
    <script src="${APP_PATH}/static/js/jquery-1.7.2.js" rel="script"></script>
    <%-- 引入 BootStrap文件 --%>
    <link href="${APP_PATH}/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/js/bootstrap.min.js" rel="script"></script>
</head>
<body>

</body>
</html>
