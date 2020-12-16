<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
    <title>Update Staff</title>
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
<sql:query var="departmentList" dataSource="${test}">
    SELECT * FROM department;
</sql:query>
<sql:query var="staff" dataSource="${test}">
    SELECT * FROM staff where staff.id = '<%=request.getParameter("id")%>';
</sql:query>
<div class="container">
    <form action="../process/update.jsp" method="post">
        <input type="hidden" id="staffId" name="staffId" value="${staff.rows[0].id}">
        <div class="row">
            <div class="col-25">
                <label for="name">Name</label>
            </div>
            <div class="col-75">
                <input type="text"
                       id="name"
                       name="name"
                       placeholder="Your name.."
                       value="${staff.rows[0].name}">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label for="address">Address</label>
            </div>
            <div class="col-75">
                <input type="text"
                       id="address"
                       name="address"
                       placeholder="Your address.."
                       value="${staff.rows[0].address}">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label for="phoneNumber">Phone Number</label>
            </div>
            <div class="col-75">
                <input type="text"
                       id="phoneNumber"
                       name="phoneNumber"
                       placeholder="Your phone number.."
                       value="${staff.rows[0].phone_number}">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label for="dateOfBirth">Date Of Birth</label>
            </div>
            <div class="col-75">
                <input type="date"
                       id="dateOfBirth"
                       name="dateOfBirth"
                       placeholder="Your date of birth.."
                       value="${staff.rows[0].date_of_birth}">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label for="department">Department</label>
            </div>
            <div class="col-75">
                <select id="department" name="department">
                    <c:forEach var="department" items="${departmentList.rows}">
                        <option value="${department.id}"${staff.rows[0].department_id == department.id ? 'selected' : ''}>
                            <c:out value="${department.name}"/>
                        </option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="row">
            <input type="submit" value="Submit">
        </div>
    </form>
</div>
</body>
