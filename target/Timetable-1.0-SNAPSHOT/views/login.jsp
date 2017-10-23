<%--
  Created by IntelliJ IDEA.
  User: Taras
  Date: 02.04.2017
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
    <title>Login</title>
</head>
<body>
    <div id="login-page">
        <div class="container">
            <form style="box-shadow: 2px 5px 6px 2px rgba(0,0,0, 0.5);" class="form-login" action="/login" method="post">
                <h2 class="form-login-heading">Admin login</h2>
                <div class="login-wrap">
                    <input type="text" class="form-control" name="username" placeholder="Login" required autofocus>
                    <br>
                    <input type="password" class="form-control" name="password" placeholder="Password" required>
                    <br>
                    <button class="btn btn-theme btn-block" href="index.html" type="submit"><i class="fa fa-lock"></i> Login</button>
                </div>
            </form>
        </div>
    </div>
    <footer class="site-footer ff">
        <div class="text-center">
            <p>&copy; Taras Moskovych 2017</p>
        </div>
    </footer>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/jquery.backstretch.min.js"></script>
<script>
    $.backstretch("${pageContext.request.contextPath}/resources/assets/img/t1.jpg", {speed: 500});
</script>

<%@include file="footer.jsp"%>