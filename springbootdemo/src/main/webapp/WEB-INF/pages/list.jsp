<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>员工列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());

    %>
    <link	rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" >
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<!---修改-->
<div class="modal fade" id="empupdateModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>

                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@qq.com">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender"  value="M"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="V"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" >

                            </select>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_model"  >更新</button>
            </div>
        </div>
    </div>
</div>
<%--员工新增--%>
<div class="modal fade" id="empAddModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">

                            <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@qq.com">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add" value="M"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add" value="V"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="selectId">

                            </select>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_model">保存</button>
            </div>
        </div>
    </div>
</div>
    <div class="container">
        <%--标题行--%>
        <div class="row">
            <div class="col-md-12">
                <h1>SSMCRUD</h1>
            </div>

        </div>
        <%--按钮--%>
            <div class="row">
                <div class="col-md-4 col-md-offset-8">
                    <button class="btn btn-primary" id="emp_add_model">新增</button>
                    <button class="btn btn-success"  >删除</button>
                </div>
            </div>
        <%--表格--%>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>#</th>
                        <th>name</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作 </th>
                    </tr>
                    <c:forEach items="${pageInfo.list }" var="emp">
                        <tr>
                            <th>${emp.empId }</th>
                            <th>${emp.empName }</th>
                            <th>${emp.gender == "M" ? "男" : "女" }</th>
                            <th>${emp.email }</th>
                            <th>${emp.department.deptName }</th>
                            <th>
                                <button class="btn btn-primary btn-sm edit_btn" editId="${emp.empId }">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    编辑</button>
                                <button class="btn btn-success  btn-sm delet_btn" editId="${emp.empId }"  editName="${emp.empName }">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                    删除</button>
                            </th>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <%--分页信息--%>
        <div>
            <%--分页文字信息--%>
            <div class="col-md-6">
                当前${pageInfo.pageNum}页,
                总共${pageInfo.pages}页,
                总共${pageInfo.total}记录数
            </div>
            <%--分页条--%>
            <div class="col-md-6">

                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li>
                            <a href="${APP_PATH}/emps?pn=1">首页</a>
                        </li>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <li>
                                <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum - 1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach items="${pageInfo.navigatepageNums}" var="pagenum">
                            <c:if test="${pagenum == pageInfo.pageNum}">
                                <li class="active"><a href="#">${pagenum}</a></li>
                            </c:if>
                            <c:if test="${pagenum != pageInfo.pageNum}">
                                <li ><a href="${APP_PATH}/emps?pn=${pagenum}">${pagenum}</a></li>
                            </c:if>

                        </c:forEach>

                            <c:if test="${pageInfo.hasNextPage}">
                                <li>
                                    <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum + 1}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                        <li>
                            <a href="${APP_PATH}/emps?pn=${pageInfo.pages}">末页</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
<script type="text/javascript">
    var toatl = ${pageInfo.pages};
    var currrentpage = ${pageInfo.pageNum};

    $("#emp_add_model").click(function () {
        //清除表单数据
        $("#empAddModel form")[0].reset();
        getDept("#empAddModel select");
        $("#empAddModel").modal({
            backdrop:"static"
        });
    });
    //得到部门
    function getDept(ele) {
        //清空
        $(ele).empty();
        $.ajax({
            url:"${APP_PATH}/depts",
            type:"GET",
            success:function (result) {
                $.each(result.extend.depts,function () {
                    //把下拉列表添加进模态框
                    var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                    optionEle.appendTo(ele);
                });
            }
        });
    }
//检验用户名
    $("#empName_add_input").change(function () {
        //校验用户名
        var input = this.value;
        $.ajax({
            url:"${APP_PATH}/checkuser",
            type:"POST",
            data:"empName="+input,
            success:function (result) {
                if(result.code == 100){
                    alert("用户名可用！")
                    $("#emp_save_model").attr("ajax_va","success");
                }
                else {
                    alert("用户名重复！")
                    $("#emp_save_model").attr("ajax_va","fail");
                }
            }
        })
    })
    //保存
    $("#emp_save_model").click(function () {
        if( $(this).attr("ajax_va") == "fail"){
            return false;
        }
        $.ajax({
            url:"${APP_PATH}/emps",
            type:"POST",
            //表单数据序列化，json形式
            data:$("#empAddModel form").serialize(),
            success:function (result) {
               $("#empAddModel").modal('hide');
                toPage(toatl);
            }
        })
    });
    //到哪页
    function  toPage(pn) {
        window.location.href = "${APP_PATH}/emps?pn="+pn;
    }
    //编辑
    $(document).on("click",".edit_btn",function () {
        getDept("#empupdateModel select"),
            getEmp($(this).attr("editId")),
            //
            $("#emp_update_model").attr("editId",$(this).attr("editId")),
        $("#empupdateModel").modal({
            backdrop:"static"
        });
    })
    //根据id删除
    $(document).on("click",".delet_btn",function () {
        var id = $(this).attr("editId");
        var name = $(this).attr("editName");
        if(confirm("确认删除【"+name+"】吗？")){
            $.ajax({
                url:"${APP_PATH}/deletemps?id="+id,
                type:"GET",
                success:function (result) {
                    toPage(currrentpage);
                }
            })
        }
    })

    //根据id获取员工
    function getEmp(id) {
        $.ajax({
            url:"${APP_PATH}/selectemps?id="+id,
            type:"GET",
            success:function (result) {
                console.log(result);
                var empData = result.extend.emp;
                $("#empName_update_static").text(empData.empName);
                $("#email_update_input").val(empData.email);
                $("#empupdateModel input[name=gender]").val([empData.gender]);
                $("#empupdateModel select").val([empData.Id]);
            }
        })
    }
    //更新
    $("#emp_update_model").click(function () {
       $.ajax({
           url:"${APP_PATH}/updatemps?id="+$(this).attr("editId"),
           type:"POST",
           data:$("#empupdateModel form").serialize(),
           success:function (result) {
               $("#empAddModel").modal('hide');
               toPage(currrentpage);
           }
       })
    })
</script>
</body>
</html>
