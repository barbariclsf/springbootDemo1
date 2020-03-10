<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>员工列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());

    %>
    <link	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
      <jsp:forward page="/emps"></jsp:forward>
</body>
</html>

