<%@ page import="org.apache.taglibs.standard.tag.common.sql.ResultImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Login</title>
</head>
<body>
<%
    if (request.getSession().getAttribute("user") != null) {
        response.sendRedirect("../view/home.jsp");
        return;
    }
%>
<c:catch var="error">
    <sql:setDataSource var="test"
                       driver="org.postgresql.Driver"
                       url="jdbc:postgresql://localhost:5432/th_ltm"
                       user="postgres"
                       password="sonlaai1"/>
    <sql:query var="user" dataSource="${test}">
        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            if (username == null) {
                response.sendRedirect("../view/login.jsp?error=400");
                return;
            }

            if (password == null) {
                response.sendRedirect("../view/login.jsp?error=400");
                return;
            }
            out.println(String.format("SELECT * FROM authentication WHERE username = '%s' and password = '%s'", username, password));
        %>
    </sql:query>
</c:catch>
<%
    if (pageContext.getAttribute("error") != null) {
        response.sendRedirect("../view/login.jsp?error=400");
        return;
    }
    Object user = pageContext.getAttribute("user");
    if (user instanceof ResultImpl) {
        ResultImpl resultSet = (ResultImpl) user;
        if (resultSet.getRowCount() > 0) {
            String name = (String) resultSet.getRowsByIndex()[0][0];
            request.getSession().setAttribute("user", name);
            response.sendRedirect("../index.jsp");
            return;
        }

        response.sendRedirect("../view/login.jsp?error=400");
    }
%>
</body>
</html>
