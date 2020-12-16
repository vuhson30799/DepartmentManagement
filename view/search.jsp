<%--
  Created by IntelliJ IDEA.
  User: shvu
  Date: 11/9/20
  Time: 13:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        response.sendRedirect("login.jsp");
        return;
    }
%>
<form class="search-form"
      action="../process/search.jsp"
      style="margin:auto;width:600px">
    <label for="criteria">
        <input type="text"
               placeholder="Search for staff or department..."
               id="criteria"
               name="criteria">
    </label>
    <button type="submit"><em class="fa fa-search"></em></button>
</form>
</body>
</html>
