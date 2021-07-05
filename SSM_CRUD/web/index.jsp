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
    <script src="${APP_PATH}/static/js/jquery-1.12.4.min.js" rel="script"></script>
    <%-- 引入 BootStrap文件 --%>
    <link href="${APP_PATH}/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/js/bootstrap.min.js" rel="script"></script>
</head>
<body>

<%-- 员工修改模态框 --%>
<div class="modal fade" id="empUpdeateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改员工</h4>
            </div>
            <div class="modal-body">
                <%-- 修改员工的表单 --%>
                <form class="form-horizontal" id="update_form">
                    <div class="form-group">
                        <label for="lastName_update" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="lastName_update"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_update" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" name="email" id="email_update" placeholder="Email@163.com">
                            <span id="email_update_msg" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender_update_man" value="1" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender_update_woman" value="0"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="dept_update_select" class="col-sm-2 control-label">部门名</label>
                        <div class="col-sm-5">
                            <select name="dId" id="dept_update_select" class="form-control"></select>
                        </div>
                    </div>
                </form>
                <%-- 添加员工的表单 --%>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>
<%-- 员工修改模态框 --%>

<%-- 员工添加模态框 --%>
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">新增员工</h4>
            </div>
            <div class="modal-body">
                <%-- 添加员工的表单 --%>
                <form class="form-horizontal" id="add_form">
                    <div class="form-group">
                        <label for="lastName_add" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="lastName" id="lastName_add" placeholder="lastName">
                            <span id="lastName_add_msg" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" name="email" id="email_add" placeholder="Email@163.com">
                            <span id="email_add_msg" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender_add_man" value="1" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender_add_woman" value="0"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="dept_add_select" class="col-sm-2 control-label">部门名</label>
                        <div class="col-sm-5">
                            <select name="dId" id="dept_add_select" class="form-control"></select>
                        </div>
                    </div>
                </form>
                <%-- 添加员工的表单 --%>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<%-- 员工添加模态框 --%>

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
            <button class="btn btn-primary btn-sm" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-danger btn-sm" id="del_all">删除</button>
        </div>
    </div>
    <%-- 信息行 --%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="empTable">
                <thead>
                    <th>
                        <input type="checkbox" id="checkAll" value="option1">
                    </th>
                    <th>员工编号</th>
                    <th>员工姓名</th>
                    <th>员工性别</th>
                    <th>员工邮箱</th>
                    <th>员工所在部门</th>
                    <th>操作</th>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>
    <%-- 分页行 --%>
    <div class="row">
        <%-- 分页文字信息 --%>
        <div class="col-md-6" id="page_msg"></div>

        <%-- 分页条 --%>
        <div class="col-md-6" id="page_nav"></div>

    </div>
</div>

    <script type="text/javascript">

        //总页码
        var totalNum = 0;
        //当前页码
        var currentNum = 0;

        /* 1、页面加载完成之后，直接发送一个 ajax 请求，要到员工数据 */
        $(function (){
            go_page(1);
        });

        /*====================================显示和导航条======================================*/
        /* 去指定页面 */
        function go_page(pageNum) {
            $.ajax({
                url:"${APP_PATH}/emps?",
                data:"pageNum="+pageNum,
                type:"GET",
                success:function (result) {
                    //1、解析并显示员工数据
                    build_emps_table(result);
                    //2、解析并显示分页信息
                    build_page_msg(result);
                    //3、解析并显示分页条
                    build_page_nav(result);
                }
            });
        }

        /* 解析并显示员工数据 */
        function build_emps_table(result){
            //清空table表格
            $("#empTable tbody").empty();

            var emps = result.extend.pageInfo.list;
            $.each(emps,function (index,item){
                var checkBoxTd = $("<td></td>").append($("<input type='checkbox'/>").addClass("checkOne"));
                var empIdTd = $("<td></td>").append(item.empId);
                var lastNameTd = $("<td></td>").append(item.lastName);
                var genderTd = $("<td></td>").append(item.gender == "0" ? "女":"男");
                var emailTd = $("<td></td>").append(item.email);
                var deptNameTd = $("<td></td>").append(item.dept.deptName);
                var editBtn = $("<button></button>").addClass("btn btn-success btn-sm edit_btn")
                              .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                //给编辑按钮添加自定义属性
                editBtn.attr("edit_id",item.empId);
                var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm del_btn")
                              .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
                //给删除按钮添加自定义属性
                delBtn.attr("del_id",item.empId);
                var operBtn = $("<td></td>").append(editBtn).append(" ").append(delBtn);
                $("<tr></tr>").append(checkBoxTd)
                              .append(empIdTd)
                              .append(lastNameTd)
                              .append(genderTd)
                              .append(emailTd)
                              .append(deptNameTd)
                              .append(operBtn)
                              .appendTo("#empTable tbody");
            });
        }

        /* 解析并显示分页信息 */
        function build_page_msg(result) {
            //清空 分页信息
            $("#page_msg").empty();

            $("#page_msg").append("当前："+result.extend.pageInfo.pageNum
                +"页，总"+result.extend.pageInfo.pages
                +"页，总"+result.extend.pageInfo.total+"条记录");

            //获得总记录数
            totalNum = result.extend.pageInfo.total;
            //获得当前页码
            currentNum = result.extend.pageInfo.pageNum;
        }

        /* 解析并显示分页条 */
        function build_page_nav(result){
            //清空table表格
            $("#page_nav").empty();

            //首页和上一页
            var firstPageLi = $("<li></li>").append($("<a></a>").attr("href","#").append("首页"));
            var prePageLi = $("<li></li>").append($("<a></a>").attr("href","#")
                .attr("aria-label","Previous")
                .append($("<span></span>").attr("aria-hidden","true").append("&laquo;")));
            //尾页和下一页
            var lastPageLi = $("<li></li>").append($("<a></a>").attr("href","#").append("末页"));
            var nextPageLi = $("<li></li>").append($("<a></a>").attr("href","#")
                .attr("aria-label","Next")
                .append($("<span></span>").attr("aria-hidden","true").append("&raquo;")));
            var ul = $("<ul></ul>").addClass("pagination");

            //将首页和上一页添加到分页条中
            if(!result.extend.pageInfo.hasPreviousPage){
                firstPageLi.addClass("disabled");
                prePageLi.addClass("disabled");
            } else {
                //为首页和末页添加单击事件
                firstPageLi.click(function (){
                    go_page(1);
                });
                prePageLi.click(function (){
                    go_page(result.extend.pageInfo.pageNum-1);
                });
            }

            ul.append(firstPageLi);
            ul.append(prePageLi);
            //遍历每一页添加到分页条中
            $.each(result.extend.pageInfo.navigatepageNums,function (index,item) {
                var numLi = $("<li></li>").append($("<a></a>").attr("href","#").append(item));
                if(result.extend.pageInfo.pageNum == item){
                    numLi.addClass("active");
                }
                numLi.click(function (){
                    go_page(item);
                });
                ul.append(numLi);
            });
            //将首页和上一页添加到分页条中
            if(!result.extend.pageInfo.hasNextPage){
                lastPageLi.addClass("disabled");
                nextPageLi.addClass("disabled");
            } else {
                //给尾页和下一页添加单击事件
                lastPageLi.click(function (){
                    go_page(result.extend.pageInfo.pages);
                });
                nextPageLi.click(function (){
                    go_page(result.extend.pageInfo.pageNum+1);
                });
            }

            ul.append(nextPageLi)
            ul.append(lastPageLi);
            var nav = $("<nav></nav>").attr("aria-label","Page navigation");
            nav.append(ul);
            //把分页条添加到所属div中
            $("#page_nav").append(nav);
        }
        /*=====================================显示和导航条======================================*/

        /*=====================================新增员工======================================*/
        //表单重置
        function reset_form(ele){
            //清空表单内容
            $(ele)[0].reset();
            //清空表单样式
            $(ele).find("*").removeClass("has-error has-success");
            $(ele).find(".help-block").text("");
        };

        /* 新增员工 */
        $("#emp_add_modal_btn").click(function(){
            //点击新增后，先清除表单中的内容（数据、样式）
            reset_form("#empAddModal form");
            //发送 ajax请求，查出部门信息，显示下拉列表
            getDepts("#dept_add_select");
            //弹出模态框
            $("#empAddModal").modal({
                backdrop:"static"
            });
        });

        //向数据库发送请求，得到部门信息
        function getDepts(ele){
            //清空之前下拉列表的值
            $(ele).empty();
            $.ajax({
                url:"${APP_PATH}/depts",
                type:"get",
                success:function (result){
                    $.each(result.extend.depts,function (index,item){
                        $(ele).append($("<option></option>")
                            .attr("value",item.deptId)
                            .append(item.deptName));
                    });

                }
            });
        }
        //保存
        $("#emp_save_btn").click(function (){
            //点击保存后，对数据进行校验
            if( !check_add_form() ){
                return false;
            }
            //判断之前的ajax请求是否成功
            if( $(this).attr("ajax_state") == "error" ){
                return false;
            }
            //发送ajax请求，让服务器保存数据
            $.ajax({
                url:"${APP_PATH}/emp",
                type:"POST",
                data: $("#empAddModal form").serialize(),
                success:function (result){
                    if (result.code == 100){
                        //1.关闭模态框
                        $("#empAddModal").modal("hide");
                        //2.去最后一页
                        go_page(totalNum);
                    } else {
                        //显示后端 jsr 303 数据校验信息
                        if(undefined != result.extend.errorMsg.lastName){
                            check_add_form("#lastName_add","error",result.extend.errorMsg.lastName);
                        }
                        if(undefined != result.extend.errorMsg.email){
                            check_add_form("#email_add","error",result.extend.errorMsg.email);
                        }
                    }
                }
            });
        });
        //校验
        function check_add_form(){
            //校验邮箱
            regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            var email = $("#email_add").val();
            if( !regEmail.test(email) ){
                show_check_msg("#email_add","error","邮箱格式不合法！");
                return false;
            } else {
                show_check_msg("#email_add","success","");
            }
            return true;
        }
        //显示校验信息
        function show_check_msg(ele,state,msg){
            $(ele).parent().removeClass("has-error has-success");
            $(ele).next("span").text("");
            if("success" == state){
                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg);
            } else if("error" == state){
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg);
            }
        }
        //后端检查姓名是否合法、重复
        $("#lastName_add").change(function (){
            var empName = this.value;
            $.ajax({
                url:"${APP_PATH}/checkName",
                data:"empName="+empName,
                type:"GET",
                success:function (result){
                    if(result.code == 200){
                        //后端校验不成功，返回错误提示信息
                        var msg = result.extend.msg;
                        show_check_msg("#lastName_add","error",msg);
                        $("#emp_save_btn").attr("ajax_state","error");
                    } else if (result.code == 100){
                        show_check_msg("#lastName_add","success","用户名可用");
                        $("#emp_save_btn").attr("ajax_state","success");
                    }
                }
            });
        });
        /*=====================================新增员工======================================*/

        /*=====================================修改员工======================================*/
        //给编辑按钮绑定单击事件
        $(document).on("click",".edit_btn",function (){
            var editId = $(this).attr("edit_id");
            //获取员工数据
            getEmpById(editId);
            //将员工id设置到更新按钮中
            $("#emp_update_btn").attr("update_id",editId);
            //获取部门信息
            getDepts("#dept_update_select");
            //弹出模态框
            $("#empUpdeateModal").modal({
                backdrop:"static"
            });
        });
        function getEmpById(id) {
            $.ajax({
               url:"${APP_PATH}/emp/"+id,
               type:"get",
               success:function (result){
                   var empDate = result.extend.emp
                   $("#lastName_update").text(empDate.lastName);
                   $("#email_update").val(empDate.email);
                   $("#empUpdeateModal input[name=gender]").val([empDate.gender]);
                   $("#empUpdeateModal select[name=dId]").val([empDate.dId]);
               }
            });
        }
        //为更新按钮绑定单击事件
        $("#emp_update_btn").click(function (){
            //1.校验邮箱
            regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            var email = $("#email_update").val();
            if( !regEmail.test(email) ){
                show_check_msg("#email_update","error","邮箱格式不合法！");
                return false;
            } else {
                show_check_msg("#email_update","success","");
            }
            //2.发送ajax请求
            $.ajax({
                url:"${APP_PATH}/emp/"+$(this).attr("update_id"),
                type:"put",
                data:$("#update_form").serialize(),
                success:function (result){
                    //3.更新结束，关闭模态框
                    $("#empUpdeateModal").modal("hide");
                    //4.回到当前页面
                    go_page(currentNum);
                }
            });
            return true;
        });
        /*=====================================修改员工======================================*/

        /*=====================================删除员工======================================*/
        //改操作里面的删除按钮添加点击事件
        //单个删除
        $(document).on("click",".del_btn",function (){
            var delName = $(this).parents("tr").find("td:eq(2)").text();
            if( confirm("你要删除["+delName+"]吗？") ){
                $.ajax({
                    url:"${APP_PATH}/emp/"+$(this).attr("del_id"),
                    type:"delete",
                    success:function (result){
                        alert(result.msg);
                        //回到本页
                        go_page(currentNum);
                    }
                });
            }
        });
        //全选、全不选
        $("#checkAll").click(function (){
            //attr获取自定义的属性，
            // prop修改和获取dom原生的属性
            $(".checkOne").prop("checked",$(this).prop("checked"));
        });
        //全选、单选之间的关联控制
        $(document).on("click",".checkOne",function (){
           var flag = ( $(".checkOne:checked").length==$(".checkOne").length );
           $("#checkAll").prop("checked",flag);
        });
        //批量删除
        $("#del_all").click(function (){
            //要删除的姓名
            var delNames = "";
            //要删除的id
            var delIds = "";
            $.each($(".checkOne:checked"),function (){
               delNames += $(this).parents("tr").find("td:eq(2)").text()+",";
               delIds += $(this).parents("tr").find("td:eq(1)").text()+"-";
            });
            delNames = delNames.substring(0,delNames.length-1);
            delIds = delIds.substring(0,delIds.length-1);
            if( confirm("你确定要删除["+delNames+"]吗？") ){
                $.ajax({
                    url:"${APP_PATH}/emp/"+delIds,
                    type:"delete",
                    success:function (result){
                        alert(result.msg);
                        go_page(currentNum);
                    }
                });
            }
        });

    </script>
</body>
</html>
