<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
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
                        <li><a href="/timetable">Lessons</a></li>
                    </ul>
                    <ul class="sub">
                        <li class="active"><a href="/timetable/exam">Exams</a></li>
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
                        <h4 class="mb"><i class="fa fa-angle-right"></i> Exam generation</h4>
                        <form:form method="post" action="timetable/examGeneration" modelAttribute="groupSubjectSearchFormSet" role="form" class="form-inline">
                        <form:select multiple="true" path="groups"
                                     class="selectGroup selectpicker mform" data-live-search="true" data-width="100%">
                            <form:options items="${groups}" itemValue="id"/>
                        </form:select>
                        <form:select multiple="true" path="subjects"
                                     class="selectSubject selectpicker mform" data-live-search="true" data-width="100%">
                            <form:options items="${subjects}" itemValue="id"/>
                        </form:select>
                        <div class="form-group">
                            <label style="margin-right: 10px;" class="form-control form-control label1 col-xs-12" for="date3">From: </label>
                            <input name="date3" id="date3" class="form-control label1" type="date"/>
                        </div>
                        <br>
                        <div class="form-group">
                            <label style="margin-right: 10px;" class="form-control form-control label1 col-xs-12" for="date2">Till: </label>
                            <input name="date2" id="date2" class="form-control label1" type="date"/>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">
                                <input style="margin-top: 8px;" type="submit" name="addLesson" value="Generate" class="label1 btn btn-primary btn-block">
                            </div>
                        </div>
                    </div>
                    </form:form>
                </div>
                <div class="col-md-6">
                    <div class="form-panel">
                        <h4 class="mb"><i class="fa fa-angle-right"></i> Delete exams</h4>
                        <form:form method="post" action="generate/cleanExam" modelAttribute="groupSearchForm" role="form" class="form-inline">
                            <form:select multiple="false" path="group" class="selectGroup selectpicker mform" data-live-search="true" data-width="100%">
                                <form:options items="${groups}" itemValue="id"/>
                            </form:select>
                            <div class="row">
                                <div class="col-sm-4">
                                    <input type="submit" name="addLesson" value="Confirm" class="label1 btn btn-primary btn-block">
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
            </div>
            <div class="row mt">
                <div class="col-md-12">
                    <div class="form-panel">
                        <h4 class="mb"><i class="fa fa-angle-right"></i> Add exam</h4>
                        <form:form method="post" action="/add/exam" modelAttribute="exam" role="form"
                                   class="form-inline">
                            <div class="row">
                                <div class="form-group">
                                    <div class="col-md-3">
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
                                        <form:select path="lessonTime" class="selectpicker mform" data-live-search="true">
                                            <form:options items="${lessonTime}" itemLabel="timeName"/>
                                        </form:select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <label style="margin-right: 10px;" class="form-control label1 col-sm-12" for="date1">Date: </label>
                                        <form:input id="date1" class="form-control label2 label1" type="date" path="date"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <input style="margin-top: 8px;" type="submit" name="addExam" value="Add exam" class="label1 btn btn-primary btn-block">
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
            </div>
            </sec:authorize>
            <div class="special">
                <div class="col-sm-10 col-sm-offset-1 mt">
                    <c:if test="${empty exams}">
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
                    <c:if test="${!empty exams}">
                        <div class="content-panel">
                            <c:if test="${mode == 'group'}">
                                <h3 align="center"><i class="fa fa-angle-right"></i> Timetable for group: ${name}</h3>
                            </c:if>
                            <c:if test="${mode == 'teacher'}">
                                <h3 align="center"><i class="fa fa-angle-right"></i> Timetable for teacher: ${teacherName} ${teacherSecondname}</h3>
                            </c:if>
                            <br>

                            <table class="table table-bordered table-striped table-hover table-responsive mTable">
                                <tr>
                                    <th class="success">Date</th>
                                    <th class="success">Exam</th>
                                </tr>

                                <c:forEach items="${exams}" var="e">
                                    <tr class="align-bottom">
                                        <td style="text-align: center; vertical-align: middle">${e.date}</td>
                                        <td align="center">
                                            <table>
                                                <c:if test="${mode == 'teacher'}">
                                                    <tr>
                                                        <td style="text-align: center">${e.groups}</td>
                                                    </tr>
                                                </c:if>
                                                <tr>
                                                    <td style="text-align: center">${e.subjectString}</td>
                                                </tr>
                                                <c:if test="${mode == 'group'}">
                                                    <tr>
                                                        <td style="text-align: center">${e.teachersString}</td>
                                                    </tr>
                                                </c:if>

                                                <tr>
                                                    <td style="text-align: center">${e.classroomsString}</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center">
                                                        Start at: ${e.lessonTime.timeName.substring(3,8)}</td>
                                                </tr>
                                                <sec:authorize access="hasRole('ROLE_ADMIN')">
                                                    <tr>
                                                        <td style="text-align: center">
                                                            <form onsubmit="return confirm('Do you want to delete this exam?')" action="delete/exam/${e.id}" method="post"><button class='btn btn-danger btn-xs'><i class='fa fa-trash-o'></i></button></form>
                                                        </td>
                                                    </tr>
                                                </sec:authorize>
                                            </table>
                                        </td>
                                    </tr>
                                </c:forEach>
                                    <%--<table align="center">--%>
                                    <%----%>
                                    <%--<sec:authorize access="hasRole('ROLE_ADMIN')">--%>
                                    <%--<tr>--%>
                                    <%--<td style="text-align: center">--%>
                                    <%--<form action="delete/exam/${exams[count].id}" method="post">--%>
                                    <%--<input type="submit" class="btn btn-danger btn-xs"--%>
                                    <%--value="Видалити"/>--%>
                                    <%--</form>--%>
                                    <%--</td>--%>
                                    <%--</tr>--%>
                                    <%--</sec:authorize>--%>
                                    <%--</table>--%>


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