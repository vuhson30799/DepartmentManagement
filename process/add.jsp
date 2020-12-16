<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.ZoneOffset" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
    <title>Add Result</title>
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
        request.setCharacterEncoding("UTF-8");
        String department = request.getParameter("department");
        if (department != null) {
            String staffId = String.valueOf(LocalDateTime.now().toEpochSecond(ZoneOffset.UTC));
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String phoneNumber = request.getParameter("phoneNumber");
            String dateOfBirth = request.getParameter("dateOfBirth");
            out.println("INSERT INTO staff VALUES (");
            out.println(String.format("'%s', '%s', '%s', %s, '%s', '%s');",
                    staffId,
                    name,
                    address,
                    department,
                    phoneNumber,
                    dateOfBirth));
        } else {
            String departmentId = String.valueOf(LocalDateTime.now().toEpochSecond(ZoneOffset.UTC));
            String departmentName = request.getParameter("departmentName");
            out.println("INSERT INTO department VALUES (");
            out.println(String.format("'%s', '%s');",
                    departmentId,
                    departmentName));
        }
    %>
</sql:update>
<div class="message ${'message'}${result > 0 ? '-success' : '-error'}">
    <h3 style="display: flex; justify-content: center; font-size: 4em">
        <em ${result > 0 ? '' : 'hidden'} class="fas fa-check-circle"></em>
        <em ${result <= 0 ? '' : 'hidden'} class="fas exclamation-triangle"></em>
    </h3>
    <p style="display: flex; justify-content: center; font-size: 1.4em"><c:out value="${result > 0 ? 'Info has been added successfully!' : 'Oops! Something went wrong!'}"/></p>
</div>
</body>
