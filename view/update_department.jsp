<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
    <title>Update Department</title>
    <link rel="stylesheet" href="../resources/css/update_staff.css"/>
</head>
<body>
<%
    if (request.getSession().getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<sql:setDataSource var="test"
                   driver="org.postgresql.Driver"
                   url="jdbc:postgresql://localhost:5432/th_ltm"
                   user="postgres"
                   password="sonlaai1"/>
<sql:query var="department" dataSource="${test}">
    SELECT * FROM department where department.id = '<%=request.getParameter("id")%>';
</sql:query>
<div class="container">
    <form action="../process/update.jsp" method="post">
        <input type="hidden" id="departmentId" name="departmentId" value="${department.rows[0].id}">
        <div class="row">
            <div class="col-25">
                <label for="departmentName">Name</label>
            </div>
            <div class="col-75">
                <input type="text"
                       id="departmentName"
                       name="departmentName"
                       placeholder="Your department name.."
                       value="${department.rows[0].name}">
            </div>
        </div>
        <div class="row">
            <input type="submit" value="Submit">
        </div>
    </form>
</div>
</body>
