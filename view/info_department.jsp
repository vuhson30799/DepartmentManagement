<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
    <title>Department_Info</title>
    <link rel="stylesheet" href="../resources/css/staff_info.css">
    <link href="../resources/css/all.css" rel="stylesheet">
</head>
<body>
<div>
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
    <sql:query var="result" dataSource="${test}">
        SELECT * FROM department;
    </sql:query>
    <table class="staff_info">
        <caption hidden>DEPARTMENT INFO</caption>
        <tr>
            <th scope="col">Name</th>
            <th scope="col">Update</th>
        </tr>
        <c:forEach var = "row" items = "${result.rows}">
            <tr>
                <td><c:out value = "${row.name}"/></td>
                <td><a href="<c:url value = "update_department.jsp?id=${row.id}"/>"><em class="fas fa-edit" style="font-size:24px"></em></a></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
