<%--
  Created by IntelliJ IDEA.
  User: 肖宁
  Date: 2021/6/30
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>员工信息</title>
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
<%-- 搭建信息显示页面 --%>
<div class="container">
    <%-- 标题行 --%>
    <div class="row">
        <div class="col-md-12">
            <h1 class="">SSM_CRUD</h1>
        </div>
    </div>
    <%-- 按钮行 --%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary btn-sm">新增</button>
            <button class="btn btn-danger btn-sm">删除</button>
        </div>
    </div>
    <%-- 信息行 --%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>员工编号</th>
                    <th>员工姓名</th>
                    <th>员工性别</th>
                    <th>员工邮箱</th>
                    <th>员工所在部门</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="emp">
                    <tr>
                        <td>${emp.empId}</td>
                        <td>${emp.lastName}</td>
                        <td>${emp.gender == "1" ? "女":"男"}</td>
                        <td>${emp.email}</td>
                        <td>${emp.dept.deptName}</td>
                        <td>
                            <button class="btn btn-success btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"/>
                                编辑
                            </button>
                            <button class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"/>
                                删除
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <%-- 分页行 --%>
    <div class="row">
        <%-- 分页文字信息 --%>
        <div class="col-md-6">
            当前：${pageInfo.pageNum}页，总${pageInfo.pages}页，总${pageInfo.total}条记录
        </div>

        <%-- 分页条 --%>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <%-- 判断当前页是否是首页 --%>
                    <c:if test="${!pageInfo.isFirstPage}">
                        <li><a href="${APP_PATH}/emps?pageNum=1">首页</a></li>
                        <li>
                            <a href="${APP_PATH}/emps?pageNum=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                        <%-- 判断页码是否是当前页 --%>
                        <c:if test="${page_Num == pageInfo.pageNum}">
                            <li class="active"><a href="#">${page_Num}</a></li>
                        </c:if>
                        <c:if test="${page_Num != pageInfo.pageNum}">
                            <li><a href="${APP_PATH}/emps?pageNum=${page_Num}">${page_Num}</a></li>
                        </c:if>
                    </c:forEach>

                    <%-- 判断是否为末页 --%>
                    <c:if test="${!pageInfo.isLastPage}">
                        <li>
                            <a href="${APP_PATH}/emps?pageNum=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                        <li><a href="${APP_PATH}/emps?pageNum=${pageInfo.pages}">末页</a></li>
                    </c:if>
                </ul>
            </nav>
        </div>

    </div>
</div>
</body>
</html>
