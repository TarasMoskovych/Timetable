<%--
  Created by IntelliJ IDEA.
  User: Taras
  Date: 02.04.2017
  Time: 17:54
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp" %>
<title>Timetable</title>
</head>
<body>
<section id="container">
    <sec:authorize access="hasRole('ROLE_ADMIN')">
    <header class="header black-bg">
        <div class="sidebar-toggle-box">
            <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Collapse"></div>
        </div>
        <a href="/" class="logo"><b>Time Table</b></a>
        <div class="top-menu">
            <ul class="nav pull-right top-menu">
                <li><a class="logout" href="/logout">Logout</a></li>
            </ul>
        </div>
    </header>
    <aside>
        <div id="sidebar" class="nav-collapse ">
            <ul class="sidebar-menu" id="nav-accordion">
                <p class="centered"><img src="${pageContext.request.contextPath}/resources/assets/img/admin.png"
                                         class="img-circle" width="60"></p>
                <h5 class="centered">ADMIN</h5>
                <li class="li_location">
                    <a href="/">
                        <i class="fa fa-arrow-left"></i>
                        <span>Back</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a class="active" href="javascript:;">
                        <i class="fa fa-tasks"></i>
                        <span>Timetable creation</span>
                    </a>
                    <ul class="sub">
                        <li class="active"><a href="/timetable">Lessons</a></li>
                    </ul>
                    <ul class="sub">
                        <li><a href="/timetable/exam">Exams</a></li>
                    </ul>
                    <ul class="sub">
                        <li><a href="/timetable/curriculum">Curriculums</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-th"></i>
                        <span>Data management</span>
                    </a>
                    <ul class="sub">
                        <li><a href="/timetable/groups">Groups</a></li>
                        <li><a href="/timetable/teachers">Teachers</a></li>
                        <li><a href="/timetable/subjects">Subjects</a></li>
                        <li><a href="/timetable/classrooms">Classrooms</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </aside>
    <section id="main-content">
        <section class="wrapper">
            <div class="row mt">
                <div class="col-md-6">
                    <div class="form-panel">
                        <h4 class="mb"><i class="fa fa-angle-right"></i> Lesson generation</h4>
                        <form:form method="post" action="timetable/generate" modelAttribute="groupSubjectSearchFormSet" role="form" class="form-inline">
                            <form:select multiple="true" path="groups" class="selectGroup selectpicker mform"
                                         data-live-search="true" data-width="100%">
                                <form:options items="${groups}" itemValue="id"/>
                            </form:select>
                            <form:select multiple="true" path="subjects" class="selectSubject selectpicker mform"
                                         data-live-search="true" data-width="100%">
                                <form:options items="${subjects}" itemValue="id"/>
                            </form:select>
                            <div class="row">
                                <div class="col-sm-3">
                                    <input type="submit" name="addLesson" value="Generate" class="label1 btn btn-primary btn-block">
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-panel">
                        <h4 class="mb"><i class="fa fa-angle-right"></i> Delete lessons</h4>
                        <form:form method="post" action="generate/clean" modelAttribute="groupSearchForm" role="form" class="form-inline">
                            <form:select multiple="false" path="group" class="selectGroup selectpicker mform" data-live-search="true" data-width="100%">
                                <form:options items="${groups}" itemValue="id"/>
                            </form:select>
                            <div class="row">
                                <div class="col-sm-3">
                                    <input type="submit" name="addLesson" value="Confirm" class="label1 btn btn-primary btn-block">
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
            <div class="row mt">
                <div class="col-sm-12">
                    <div class="form-panel">
                        <h4 class="mb"><i class="fa fa-angle-right"></i> Add lesson</h4>
                        <form:form method="post" action="/add/lesson" modelAttribute="lesson" role="form" class="form-inline myForm">
                            <div class="row">
                                <div class="form-group">
                                    <div class="col-md-3 select">
                                        <form:select multiple="true" path="groups" class="selectGroup selectpicker mform" data-live-search="true">
                                            <form:options items="${groups}" itemValue="id"/>
                                        </form:select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-3">
                                        <form:select multiple="true" path="subjects" class="selectSubject selectpicker mform" data-live-search="true">
                                            <form:options items="${subjects}" itemValue="id" itemLabel="name"/>
                                        </form:select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-3">
                                        <form:select multiple="true" path="teachers" class="selectTeacher selectpicker mform" data-live-search="true">
                                            <form:options items="${teachers}" itemValue="id"/>
                                        </form:select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-3">
                                        <form:select multiple="true" path="classrooms" class="selectClassroom selectpicker mform" data-live-search="true">
                                            <form:options items="${classrooms}" itemValue="id"/>
                                        </form:select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-3">
                                        <form:select path="dayOfWeek" class="selectpicker mform" data-live-search="true">
                                            <form:options items="${dayOfWeek}" itemLabel="dayName"/>
                                        </form:select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-3">
                                        <form:select path="lessonTime" class="selectpicker mform" data-live-search="true">
                                            <form:options items="${lessonTime}" itemLabel="timeName"/>
                                        </form:select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-3">
                                        <form:select path="lessonType" class="selectpicker mform" data-live-search="true">
                                            <form:options items="${lessonType}" itemLabel="typeName"/>
                                        </form:select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-3">
                                        <form:select path="lessonMode" class="selectpicker mform" data-live-search="true">
                                            <form:options items="${lessonMode}" itemLabel="modeName"/>
                                        </form:select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-2">
                                    <input type="submit" name="addLesson" value="Add lesson" class="label1 btn btn-primary btn-block">
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
            </div>
            </sec:authorize>
            <div class="special">
                <div class="col-sm-12 mt">
                    <c:if test="${empty lessons}">
                        <sec:authorize access="isAnonymous()">
                            <div class="row">
                                <div class="col-sm-offset-3 col-sm-6">
                                    <div class="closed.bs.alert alert alert-warning alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true">&times;</span></button>
                                        <strong>Error!</strong> Timetable is empty!
                                    </div>
                                    <p align="center"><a class="btn btn-md btn-info" href="/" role="button">Back</a>
                                    </p>
                                </div>
                            </div>
                        </sec:authorize>
                    </c:if>
                    <c:if test="${!empty lessons}">
                        <div class="content-panel">
                            <c:if test="${mode == 'group'}">
                                <h3 align="center"><i class="fa fa-angle-right"></i> Timetable for group: ${name}</h3>
                            </c:if>
                            <c:if test="${mode == 'teacher'}">
                                <h3 align="center"><i class="fa fa-angle-right"></i> Timetable for teacher: ${teacherName} ${teacherSecondname}</h3>
                            </c:if>
                            <br>
                            <table class="table table-bordered table-striped table-hover table-responsive mTable">
                                <thead>
                                <tr class="success">
                                    <th></th>
                                    <c:forEach items="${daysOfWeek}" var="dayOfWeek">
                                        <th>${dayOfWeek.dayName}</th>
                                    </c:forEach>
                                </tr>
                                </thead>
                                <tbody>
                                <c:set var="count" value="0" scope="page"/>
                                <c:forEach var="i" begin="1" end="5">
                                    <c:forEach var="j" begin="1" end="5">
                                        <c:if test="${j == 1}">
                                            <tr class="tr-border">
                                            <th>${lessonTime[i - 1].timeName}</th>
                                        </c:if>

                                        <td class="tr-border">
                                            <c:if test="${lessons[count].lessonTime.timeValue == i && lessons[count].dayOfWeek.dayValue == j}">
                                                <c:if test="${lessons[count].lessonMode.modeValue == 3}">
                                                    <!--Numerator-->
                                                    <div class="vertical top"></div>
                                                </c:if>

                                                <table align="center">
                                                    <tr>
                                                        <td style="text-align: center">${lessons[count].subjectString}, ${lessons[count].lessonType.typeName}</td>
                                                    </tr>
                                                    <c:if test="${mode == 'group'}">
                                                        <tr>
                                                            <td style="text-align: center">${lessons[count].teachersString}</td>
                                                        </tr>
                                                    </c:if>
                                                    <c:if test="${mode == 'teacher'}">
                                                        <tr>
                                                            <td style="text-align: center">${lessons[count].groupsString}</td>
                                                        </tr>
                                                    </c:if>
                                                    <tr>
                                                        <td style="text-align: center">${lessons[count].classroomsString}</td>
                                                    </tr>
                                                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                                                        <tr>
                                                            <td style="text-align: center">
                                                                <form onsubmit="return confirm('Do you want to delete this lesson?')" action="delete/lesson/${lessons[count].id}" method="post">
                                                                    <button class="btn btn-danger btn-xs"><i class='fa fa-trash-o'></i></button>
                                                                </form>
                                                            </td>
                                                        </tr>
                                                    </sec:authorize>
                                                </table>


                                                <c:if test="${lessons[count].lessonMode.modeValue == 2}">
                                                    <div class="vertical bottom"></div>
                                                </c:if>

                                                <c:if test="${fn:length(lessons) > count}">
                                                    <c:set var="count" value="${count + 1}" scope="page"/>
                                                </c:if>
                                            </c:if>
                                        </td>
                                        <c:if test="${j == 6}">
                                            </tr>
                                        </c:if>

                                    </c:forEach>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <br>
                        <p align="center"><a class="btn btn-md btn-success" href="/" role="button">Go to searching page</a></p>
                    </c:if>
                </div>
                <br>
                <br>
            </div>
        </section>
    </section>
    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <footer class="site-footer">
            <div class="text-center">
                <p>&copy; Taras Moskovych 2017</p>
            </div>
        </footer>
    </sec:authorize>
</section>
<script type="text/javascript">
    $('.selectGroup').selectpicker({
        noneSelectedText: 'Select a group'
    });
    $('.selectTeacher').selectpicker({
        noneSelectedText: 'Select a teacher'
    });
    $('.selectClassroom').selectpicker({
        noneSelectedText: 'Select a classroom'
    });
    $('.selectSubject').selectpicker({
        noneSelectedText: 'Select a subject'
    });
    $('.selectpicker').selectpicker({
        noneResultsText: "None selected"
    });

</script>

<%@include file="footer.jsp" %>