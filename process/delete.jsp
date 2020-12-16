<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
    <title>Delete Result</title>
    <link rel="stylesheet" href="../resources/css/update.css"/>
    <link href="../resources/css/all.css" rel="stylesheet">
</head>
<body>
<%
    if (request.getSession().getAttribute("user") == null) {
        response.sendRedirect("../view/home.jsp");
        return;
    }
%>
<sql:setDataSource var="test"
                   driver="org.postgresql.Driver"
                   url="jdbc:postgresql://localhost:5432/th_ltm"
                   user="postgres"
                   password="sonlaai1"/>
<sql:update var="result" dataSource="${test}">
    <%
        String staffId = request.getParameter("staffId");
        String departmentId = request.getParameter("departmentId");
        if (staffId != null) {
            out.println(String.format("DELETE FROM staff WHERE staff.id='%s'", staffId));
        }

        if (departmentId != null) {
            out.println(String.format("DELETE FROM staff WHERE department.id='%s'", departmentId));
        }

        if (staffId == null && departmentId == null) {
            out.println("DELETE FROM staff;");
            out.println("DELETE FROM department;");
        }
    %>
</sql:update>
<div class="message ${'message'}${result > 0 ? '-success' : '-error'}">
    <h3 style="display: flex; justify-content: center; font-size: 4em">
        <em ${result > 0 ? '' : 'hidden'} class="fas fa-check-circle"></em>
        <em ${result <= 0 ? '' : 'hidden'} class="fas exclamation-triangle"></em>
    </h3>
    <p style="display: flex; justify-content: center; font-size: 1.4em"><c:out value="${result > 0 ? 'Info has been removed successfully!' : 'Oops! Something went wrong!'}"/></p>
</div>
</body>
