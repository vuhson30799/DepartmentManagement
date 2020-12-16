<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login</title>
    <link href="../resources/css/login.css" rel="stylesheet" type="text/css" />
</head>
<body onload="displayError()">
<%
    if (request.getSession().getAttribute("user") != null) {
        response.sendRedirect("../index.jsp");
        return;
    }
%>
<div class="wrapper fadeInDown">
    <div id="formContent">
        <!-- Tabs Titles -->
        <h2 id="sign-in-h2" class="active" onclick="displayLoginForm()"> Sign In </h2>
        <h2 id="register-h2" class="inactive underlineHover" onclick="displayRegisterForm()">Sign Up </h2>

        <!-- Login Form -->
        <div id="form">
            <form method="post" action="../process/login.jsp">
                <label for="username" hidden></label><input type="text" id="username" class="fadeIn second"
                                                            name="username" placeholder="username">
                <label for="password" hidden></label><input type="password" id="password" class="fadeIn third"
                                                            name="password" placeholder="password">
                <input type="submit" class="fadeIn fourth" value="Log In">
            </form>
        </div>

    </div>
</div>
<script type="text/javascript">
    function displayLoginForm() {
        document.getElementById('sign-in-h2').className = 'active'
        document.getElementById('register-h2').className = 'inactive underlineHover'
        document.getElementById('form').innerHTML = '<form method="post" action="../process/login.jsp">\n' +
            '            <label for="username" hidden></label><input type="text" id="username" class="fadeIn second" name="username" placeholder="username">\n' +
            '            <label for="password" hidden></label><input type="password" id="password" class="fadeIn third" name="password" placeholder="password">\n' +
            '            <input type="submit" class="fadeIn fourth" value="Log In">\n' +
            '        </form>'
    }
    function displayRegisterForm() {
        document.getElementById('sign-in-h2').className = 'inactive underlineHover'
        document.getElementById('register-h2').className = 'active'
        document.getElementById('form').innerHTML = '<form method="post" action="../process/register.jsp">\n' +
            '            <label for="username" hidden></label><input type="text" id="username" class="fadeIn second" name="username" placeholder="username">\n' +
            '            <label for="password" hidden></label><input type="password" id="password" class="fadeIn third" name="password" placeholder="password">\n' +
            '            <label for="display_name" hidden></label><input type="text" id="display_name" class="fadeIn fifth" name="display_name" placeholder="display name">\n' +
            '            <input type="submit" class="fadeIn fourth" value="Register">\n' +
            '        </form>'
    }
    function displayError() {
        const error = <%out.print(request.getParameter("error"));%>
        if (error !== null) {
            alert("Something went wrong!!")
        }
    }
</script>
</body>
</html>
