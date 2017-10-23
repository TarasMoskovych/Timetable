<%--
  Created by IntelliJ IDEA.
  User: Taras
  Date: 02.04.2017
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp" %>
<title>Search for timetable</title>
</head>
<body>
<div align="center" class="container">
    <div class="container">
        <div style="box-shadow: 2px 5px 6px 2px rgba(0,0,0, 0.5); padding: 0" class="login-wrap form-login no-padding">
            <form:form id="formGroup" method="post" modelAttribute="groupSearchForm" action="" role="form">
                <h2 class="form-login-heading">Search for timetable</h2>
                <br>
                <form:select required="true" class="selectpicker btn-padding" data-live-search="true" path="group" data-width="100%">
                    <form:option disabled="true" value="">Choose a group</form:option>
                    <form:options items="${groups}" itemValue="id"/>
                </form:select>
                <div class="btn-padding2">
                    <p><input onclick="func(this)" id="group" type="submit" name="forGroup" value="Lessons" class="btn btn-info subBtn btn-block"></p>
                    <p><input onclick="func(this)" id="groupExam" type="submit" name="forGroup" value="Exams" class="btn btn-info subBtn btn-block"></p>
                </div>
            </form:form>

            <form:form class="formTeacher" method="post" modelAttribute="teacherSearchForm" action="" role="form" id="myForm">
                <form:select required="true" class="selectpicker btn-padding" data-live-search="true" path="teacher" data-width="100%">
                    <form:option disabled="true" value="">Choose a teacher</form:option>
                    <form:options items="${teachers}" itemValue="id"/>
                </form:select>
                <div class="btn-padding2">
                    <p><input onclick="func(this)" id="teacher" type="submit" name="forTeacher" value="Lessons" class="btn btn-info subBtn btn-block"></p>
                    <p><input onclick="func(this)" id="examTeacher" type="submit" name="forTeacher" value="Exams" class="btn btn-info subBtn btn-block"></p>
                </div>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <br>
                    <div class="btn-padding">
                        <p><a class="btn btn-md btn-success btn-block" href="/timetable" role="button">Admin panel</a></p>
                        <p><a class="btn btn-md btn-danger btn-block" href="/logout" role="button">Logout</a></p>
                    </div>
                </sec:authorize>
            </form:form>
        </div>

    </div>

</div>

<footer class="site-footer ff">
    <div class="text-center">
        <p>&copy; Taras Moskovych 2017</p>
    </div>
</footer>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/assets/js/jquery.backstretch.min.js"></script>
<script>
    $.backstretch("${pageContext.request.contextPath}/resources/assets/img/t1.jpg", {speed: 500});
    function func(input) {
        var id = 0;
        id = input.id;
        if (id == "group") $("#formGroup").attr('action', 'for/group');
        if (id == "groupExam") $("#formGroup").attr('action', 'exam/for/group');
        if (id == "teacher") $(".formTeacher").attr('action', 'for/teacher');
        if (id == "examTeacher") $(".formTeacher").attr('action', 'exam/for/teacher');
    }
</script>
<%@include file="footer.jsp" %>

