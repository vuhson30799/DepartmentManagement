<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
    <title>Update Result</title>
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
        String staffId = request.getParameter("staffId");
        String departmentId = request.getParameter("departmentId");
        if (staffId != null) {
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String phoneNumber = request.getParameter("phoneNumber");
            String dateOfBirth = request.getParameter("dateOfBirth");
            String department = request.getParameter("department");
            out.println("UPDATE staff SET ");
            out.println(String.format("name='%s', address='%s', phone_number='%s', date_of_birth='%s', department_id=%s where staff.id='%s';",
                    name,
                    address,
                    phoneNumber,
                    dateOfBirth,
                    department,
                    staffId));
        } else {
            String departmentName = request.getParameter("departmentName");
            out.println("UPDATE department SET ");
            out.println(String.format("name='%s' where department.id ='%s'",
                    departmentName,
                    departmentId));
        }
    %>
</sql:update>
<div class="message ${'message'}${result > 0 ? '-success' : '-error'}">
    <h3 style="display: flex; justify-content: center; font-size: 4em">
        <em ${result > 0 ? '' : 'hidden'} class="fas fa-check-circle"></em>
        <em ${result <= 0 ? '' : 'hidden'} class="fas exclamation-triangle"></em>
    </h3>
    <p style="display: flex; justify-content: center; font-size: 1.4em"><c:out value="${result > 0 ? 'Info has been updated successfully!' : 'Oops! Something went wrong!'}"/></p>
</div>
</body>
