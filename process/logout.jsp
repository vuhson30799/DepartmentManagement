<%--
  Created by IntelliJ IDEA.
  User: shvu
  Date: 11/14/20
  Time: 13:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logout</title>
</head>
<body>
<%
    request.getSession().invalidate();
    response.sendRedirect("../view/login.jsp");
%>
</body>
</html>
