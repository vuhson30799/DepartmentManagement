<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%--
  Created by IntelliJ IDEA.
  User: shvu
  Date: 10/26/20
  Time: 12:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<html>
<head>
    <title>Search Result</title>
    <link rel="stylesheet" href="../resources/css/staff_info.css">
    <link href="../resources/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href="../resources/css/update.css"/>
    <link rel="stylesheet" href="../resources/css/search_all.css"/>
</head>
<body>
<%
    if (request.getSession().getAttribute("user") == null) {
        response.sendRedirect("../view/home.jsp");
        return;
    }
%>
<%! String criteria;%>
<sql:setDataSource var="test"
                   driver="org.postgresql.Driver"
                   url="jdbc:postgresql://localhost:5432/th_ltm"
                   user="postgres"
                   password="sonlaai1"/>
<sql:query var="staffResult" dataSource="${test}">
    <%
        criteria = request.getParameter("criteria");
        if (criteria == null) {
            return;
        } else {
            criteria = criteria.trim();
        }
        try {
            LocalDate dateOfBirth = LocalDate.parse(criteria);
            dateOfBirth.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            out.println(String.format("SELECT * FROM staff WHERE " +
                            "lower(unaccent(staff.id)) LIKE lower(unaccent('%%%s%%')) " +
                            "OR lower(unaccent(staff.name)) LIKE lower(unaccent('%%%s%%')) " +
                            "OR staff.phone_number LIKE '%%%s%%' " +
                            "OR staff.date_of_birth = to_date('%s','YYYY-MM-DD') ",
                    criteria,
                    criteria,
                    criteria,
                    dateOfBirth));

        } catch (Exception e) {
            out.println(String.format("SELECT * FROM staff WHERE " +
                            "lower(unaccent(staff.id)) LIKE lower(unaccent('%%%s%%')) " +
                            "OR lower(unaccent(staff.name)) LIKE lower(unaccent('%%%s%%')) " +
                            "OR staff.phone_number LIKE '%%%s%%' ",
                    criteria,
                    criteria,
                    criteria));
        }
    %>
</sql:query>
<sql:query var="departmentResult" dataSource="${test}">
    <%
        if (criteria != null) {
            out.println(String.format("SELECT * FROM department WHERE " +
                            "lower(unaccent(department.id)) LIKE lower(unaccent('%%%s%%')) " +
                            "OR lower(unaccent(department.name)) LIKE lower(unaccent('%%%s%%'))",
                    criteria,
                    criteria));
        }

    %>
</sql:query>
<form class="search-form"
      action="../process/search.jsp"
      style="margin:auto;width:600px">
    <label for="criteria">
        <input type="text"
               placeholder="Search for staff or department..."
               id="criteria"
               name="criteria" value="<%out.print(criteria);%>">
    </label>
    <button type="submit"><em class="fa fa-search"></em></button>
</form>
<c:if test="${staffResult.rowCount != 0}">
    <div>
        <table class="staff_info">
            <caption hidden>STAFF INFO</caption>
            <tr>
                <th scope="col">Name</th>
                <th scope="col">Address</th>
                <th scope="col">Phone Number</th>
                <th scope="col">Date Of Birth</th>
                <th scope="col">Update</th>
                <th scope="col">Delete</th>
            </tr>
            <c:forEach var="row" items="${staffResult.rows}">
                <tr>
                    <td><c:out value="${row.name}"/></td>
                    <td><c:out value="${row.address}"/></td>
                    <td><c:out value="${row.phone_number}"/></td>
                    <td><c:out value="${row.date_of_birth}"/></td>
                    <td><a href="<c:url value = "../view/update_staff.jsp?id=${row.id}"/>"><em class="fas fa-edit"
                                                                                               style="font-size:24px"></em></a>
                    </td>
                    <td><a href="<c:url value = "../view/delete_staff.jsp?id=${row.id}"/>"><em class="fas fa-trash-alt"
                                                                                               style="font-size:24px"></em></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</c:if>
<c:if test="${departmentResult.rowCount != 0}">
    <div class="search-result">
        <table class="staff_info">
            <caption hidden>DEPARTMENT INFO</caption>
            <tr>
                <th scope="col">Name</th>
                <th scope="col">Update</th>
            </tr>
            <c:forEach var="row" items="${departmentResult.rows}">
                <tr>
                    <td><c:out value="${row.name}"/></td>
                    <td><a href="<c:url value = "../view/update_department.jsp?id=${row.id}"/>"><em class="fas fa-edit"
                                                                                                    style="font-size:24px"></em></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</c:if>
</body>
</html>
