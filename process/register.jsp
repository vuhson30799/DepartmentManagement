<%--
  Created by IntelliJ IDEA.
  User: shvu
  Date: 11/14/20
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Register</title>
</head>
<body>
<sql:setDataSource var="test"
                   driver="org.postgresql.Driver"
                   url="jdbc:postgresql://localhost:5432/th_ltm"
                   user="postgres"
                   password="sonlaai1"/>
<c:catch var="error">
    <sql:update var="user" dataSource="${test}">
        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String displayName = request.getParameter("display_name");

            if (username == null || username.isEmpty()) {
                response.sendRedirect("/login.jsp?error=400");
                return;
            }

            if (password == null || password.isEmpty()) {
                response.sendRedirect("/login.jsp?error=400");
                return;
            }

            if (displayName == null || displayName.isEmpty()) {
                response.sendRedirect("/login.jsp?error=400");
                return;
            }

            out.println("INSERT INTO authentication VALUES (");
            out.print(String.format("'%s', '%s', '%s')", displayName, username, password));
        %>
    </sql:update>
</c:catch>
<%
    if (pageContext.getAttribute("error") != null) {
        response.sendRedirect("../view/login.jsp?error=400");
    } else {
        response.sendRedirect("../view/login.jsp");
    }

%>

</body>
</html>
