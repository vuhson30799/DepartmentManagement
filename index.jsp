<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
  <title>TH_LTM</title>
  <link href="resources/css/index.css" rel="stylesheet"/>
</head>
<body>
<%
  if (request.getSession().getAttribute("user") == null) {
    request.getRequestDispatcher("view/login.jsp").forward(request, response);
  }
%>
<div class="index-header">
  <div class="index-header-img"><img src="resources/images/index-1.png" alt="logo of this page"/></div>
  <div class="index-header-title"><h1>DEPARTMENT MANAGER APPLICATION</h1></div>
  <div class="index-header-img"><img src="resources/images/index-2.png" alt="logo of this page"></div>
</div>
<div class="index-body">
  <div class="index-menu">

    <a class="menu-box" href="view/home.jsp" target="frame_overview"><div class="menu-link">Home</div></a>
    <a class="menu-box" href="view/info_staff.jsp" target="frame_overview"><div class="menu-link">Staff Info</div></a>
    <a class="menu-box" href="view/info_department.jsp" target="frame_overview"><div class="menu-link">Department Info</div></a>
    <a class="menu-box" href="view/add_staff.jsp" target="frame_overview"><div class="menu-link">Add new staff</div></a>
    <a class="menu-box" href="view/add_department.jsp" target="frame_overview"><div class="menu-link">Add new department</div></a>
    <a class="menu-box" href="view/search.jsp" target="frame_overview"><div class="menu-link">Search</div></a>
    <a class="menu-box" href="view/login.jsp" target="_self"><div class="menu-link">Login</div></a>
    <a class="menu-box" href="process/logout.jsp" target="_self"><div class="menu-link">Logout</div></a>
<%--    <a class="menu-box" href="view/update_all.jsp" target="frame_overview"><div class="menu-link">Update all</div></a>--%>
<%--    <div class="menu-box" onclick="deleteAll()"><p>Delete all</p></div>--%>
    <a class="menu-box" href="view/help.jsp" target="frame_overview"><div class="menu-link">Help</div></a>

  </div>
  <div class="index-overview">
    <iframe title="overview" name="frame_overview" width="100%" height="500" src="view/home.jsp"></iframe>
  </div>
  <div class="index-iframe"></div>
</div>
<script>
  function deleteAll() {
    if (confirm("Are you sure? This operation can not be restored!")) {
      document.getElementsByName('frame_overview')[0].attributes['src'].value = 'process/delete.jsp'
    }
  }
</script>
</body>
