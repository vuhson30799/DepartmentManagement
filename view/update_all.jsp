<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
    <title>Staff_Info</title>
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
        SELECT * FROM Staff;
    </sql:query>
    <table class="staff_info">
        <caption hidden>STAFF INFO</caption>
        <tr>
            <th scope="col">Name</th>
            <th scope="col">Address</th>
            <th scope="col">Phone Number</th>
            <th scope="col">Date Of Birth</th>
            <th scope="col">Update</th>
        </tr>

        <c:forEach var = "row" items = "${result.rows}">
            <tr>
                <td><c:out value = "${row.name}"/></td>
                <td><c:out value = "${row.address}"/></td>
                <td><c:out value = "${row.phone_number}"/></td>
                <td><c:out value = "${row.date_of_birth}"/></td>
                <td><a href="<c:url value = "update_staff.jsp?id=${row.id}"/>"><em class="fas fa-edit" style="font-size:24px"></em></a></td>
            </tr>
        </c:forEach>
    </table>
</div>

<div style="margin-top: 10px">
    <sql:query var="departmentResult" dataSource="${test}">
        SELECT * FROM department;
    </sql:query>
    <table class="staff_info">
        <caption hidden>DEPARTMENT INFO</caption>
        <tr>
            <th scope="col">Name</th>
            <th scope="col">Update</th>
        </tr>
        <c:forEach var = "row" items = "${departmentResult.rows}">
            <tr>
                <td><c:out value = "${row.name}"/></td>
                <td><a href="<c:url value = "update_department.jsp?id=${row.id}"/>"><em class="fas fa-edit" style="font-size:24px"></em></a></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
