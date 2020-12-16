<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Help</title>
</head>
<body style="display: flex; justify-content: center; align-items: center;">
<%
    if (request.getSession().getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<img src="../resources/images/help.gif" alt="gif for help"/>
</body>
</html>
