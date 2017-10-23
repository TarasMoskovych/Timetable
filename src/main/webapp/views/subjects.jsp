<%--
  Created by IntelliJ IDEA.
  User: Taras
  Date: 02.04.2017
  Time: 17:54
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
    <title>Subjects</title>
</head>
<body>

<section id="container">
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

                <p class="centered"><img src="${pageContext.request.contextPath}/resources/assets/img/admin.png" class="img-circle" width="60"></p>
                <h5 class="centered">ADMIN</h5>

                <li class="li_location">
                    <a href="/">
                        <i class="fa fa-arrow-left"></i>
                        <span>Back</span>
                    </a>
                </li>

                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-tasks"></i>
                        <span>Timetable creation</span>
                    </a>
                    <ul class="sub">
                        <li><a href="/timetable">Lessons</a></li>
                    </ul>
                    <ul class="sub">
                        <li><a href="/timetable/exam">Exams</a></li>
                    </ul>
                    <ul class="sub">
                        <li><a href="/timetable/curriculum">Curriculums</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a class="active" href="javascript:;">
                        <i class="fa fa-th"></i>
                        <span>Data management</span>
                    </a>
                    <ul class="sub">
                        <li><a href="/timetable/groups">Groups</a></li>
                        <li><a href="/timetable/teachers">Teachers</a></li>
                        <li class="active"><a href="/timetable/subjects">Subjects</a></li>
                        <li><a href="/timetable/classrooms">Classrooms</a></li>
                    </ul>
                </li>

            </ul>
        </div>
    </aside>

    <section id="main-content">
        <section class="wrapper">
            <h3 class="pull-left"><i class="fa fa-angle-right"></i> SUBJECTS</h3>
            <button class="position btn btn-success btn-xs" data-toggle="modal" data-target="#subjectAddModal"><i class="fa fa-plus"></i></button>

            <div class="row mt">
                <div class="col-md-12">
                    <div class="content-panel">
                        <table class="table table-striped table-advance table-hover table-responsive">
                            <thead>
                            <tr>
                                <th>№</th>
                                <%--<th>ID</th>--%>
                                <th>Subject name</th>
                                <th>Number of hours</th>
                                <th>Teachers</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody id="subjectContent">
                                <!-- -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel4">Clean teacher's list</h4>
                        </div>
                        <div class="modal-body">
                            <form action="removeAllTeachers" method="post">
                                <div style="display: none;" class="form-group">
                                    <div>
                                        <input id="idRemove" name="id" type="text" class="form-control" placeholder="Id"/>
                                    </div>
                                </div>
                                <div align="center">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <input type="submit" class="btn btn-danger btn-md" value="Confirm"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


            <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel3">Add teachers to this subject</h4>
                        </div>
                        <div class="modal-body">
                            <form:form action="add/teacher-subject" method="post" modelAttribute="teacherSearchFormList">
                                <div style="display: none;" class="form-group">
                                    <div>
                                        <input id="idNew" name="id" type="text" class="form-control" placeholder="Id"/>
                                    </div>
                                </div>
                                    <div align="center">
                                        <form:select path="teachers" multiple="true" class="selectTeacher selectpicker mform" data-live-search="true">
                                            <form:options items="${teachers}" itemValue="id"/>
                                        </form:select>
                                    </div>

                                <div align="center">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <input type="submit" class="btn btn-success btn-md" value="Add"/>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="subjectDeleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel5">Do you want to delete this subject?</h4>
                        </div>
                        <br>
                        <div>
                            <div align="center">
                                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                                <input id="deleteBtn" type="submit" class="btn btn-danger btn-md" value="Yes"/>
                            </div>
                        </div>
                        <br>
                    </div>
                </div>
            </div>


            <div class="modal fade" id="subjectEditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">Edit this subject</h4>
                        </div>
                        <div class="modal-body">
                                <div style="display: none;" class="form-group">
                                    <div>
                                        <input id="editId" disabled name="id" type="text" class="form-control" placeholder="Id"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <input id="editName" name="name" type="text" class="form-control" placeholder="Subject name"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <input id="editHours" name="hours" type="text" class="form-control" placeholder="Number of hours"/>
                                    </div>
                                </div>
                                <div align="center">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <input id="editBtn" type="submit" class="btn btn-danger btn-md" value="Edit"/>
                                </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="subjectAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel2">Add new subject</h4>
                        </div>
                        <div class="modal-body">
                                <div class="form-group">
                                    <div>
                                        <input id="addName" name="name" type="text" class="form-control" placeholder="Subject name"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <input id="addHours" name="hours" type="text" class="form-control" placeholder="Number of hours"/>
                                    </div>
                                </div>
                                <div align="center">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <input id="addBtn" type="submit" class="btn btn-success btn-md" value="Add"/>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </section>

    <footer class="site-footer">
        <div class="text-center">
            <p>&copy; Taras Moskovych 2017</p>
        </div>
    </footer>

</section>

<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.scrollTo.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.nicescroll.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/common-scripts.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-switch.js"></script>

<script type="text/javascript">
    $('.selectTeacher').selectpicker({
        noneSelectedText: 'Оберіть викладача'
    });
</script>

<script>

    $(document).ready(showAllSubjects());

    function editSubject(button) {
        var id = 0;
        id = button.id;
        document.getElementById("editId").value = id;
    }

    function deleteSubject(button) {
        var id = 0;
        id = Number(button.id);

        $("#deleteBtn").click(function (e) {
            e.preventDefault();

            $.ajax({
                url:'/timetable/subjects/delete',
                method:'POST',
                contentType:'application/json',
                data: JSON.stringify(id),
                success:function () {
                    $('#subjectDeleteModal').modal('toggle');
                    $("#subjectContent").empty();
                    showAllSubjects();
                }
            })
        })
    }

    function showAllSubjects() {
        var HTML = "";

        $.ajax({
            url:'/timetable/subjects/all',
            method:'GET',
            contentType:'application/json',
            success:function (response) {
                for(var i = 0; i < response.length; i++){
                    HTML+="<tr>"
                        +"<td>"+ (i+1) + "</td>"
//                        +"<td>"+ response[i].id + "</td>"
                        +"<td>" + response[i].name + "</td>"
                        +"<td>" + response[i].hours + "</td>"
                        +"<td>"
                        +"<button onclick='addTeacherToSubject(this)' id='"+ response[i].id + "'  class='pull-left btn btn-success btn-xs' data-toggle='modal' data-target='#myModal3'><i class='fa fa-plus'></i></button>"
                        +"<button onclick='deleteTeachersFromSubject(this)' id='"+ response[i].id + "' class='position3 pull-left btn btn-danger btn-xs' data-toggle='modal' data-target='#myModal4'><i class='fa fa-trash-o'></i></button>"
                        +"<div class='col-xs-10'>"
                        + response[i].teachersString + "</div>"
                        +"</div>"
                        +"<td>"
                        +"<div class='col-xs-12'>"
                        +"<button id='"+ response[i].id + "' title='Edit the subject' class='position2 pull-left btn btn-primary btn-xs' onclick='editSubject(this)' data-toggle='modal' data-target='#subjectEditModal'><i class='fa fa-pencil'></i></button>"
                        +"<button id='" + response[i].id + "'" +  "title='Delete the subject' class='position2 btn btn-danger btn-xs' data-toggle='modal' data-target='#subjectDeleteModal' onclick='deleteSubject(this)'><i class='fa fa-trash-o '></i></button>"
                        +"</div>"
                        +"</td>"
                        +"</tr>";
                }
                $("#subjectContent").append(HTML);
            },
            error: function () {
                alert('Exception!');
            }
        })
    }

    function addTeacherToSubject (button) {
        var id = 0;
        id = button.id;
        document.getElementById("idNew").value = id;

    }

    function deleteTeachersFromSubject (button) {
        var id2 = 0;
        id2 = button.id;
        document.getElementById("idRemove").value = id2;

    }

    function getSubjectObject() {
        return {name:$("#addName").val(), hours: $("#addHours").val()};
    }

    function getSubjectObject2() {
        return {id:$("#editId").val(), name:$("#editName").val(), hours: $("#editHours").val()};
    }

    $("#addBtn").click(function (e) {
        e.preventDefault();

        $.ajax({
            url:'/timetable/subjects/add',
            method:'POST',
            contentType:'application/json',
            data: JSON.stringify(getSubjectObject()),
            success:function () {

                $('#subjectAddModal').modal('toggle');
                $('#addName').val('');
                $('#addHours').val('');
                $("#subjectContent").empty();
                showAllSubjects();

            },
            error: function () {
                alert("Bad value!");
            }
        })
    });

    $("#editBtn").click(function (e) {
        e.preventDefault();

        $.ajax({
            url:'/timetable/subjects/edit',
            method:'POST',
            contentType:'application/json',
            data: JSON.stringify(getSubjectObject2()),
            success:function () {
                $('#subjectEditModal').modal('toggle');
                $('#editId').val('');
                $('#editName').val('');
                $('#editHours').val('');
                $("#subjectContent").empty();
                showAllSubjects();
            },
            error: function () {
                alert("Bad value!");
            }
        })
    });

    $('#subjectAddModal').on('shown.bs.modal', function () {
        $('#addName').focus();
    });

    $('#subjectEditModal').on('shown.bs.modal', function () {
        $('#editName').focus();
    });

    $('#myModal3').on('shown.bs.modal', function () {
        $('#idNew').focus();
    });

    $('#myModal4').on('shown.bs.modal', function () {
        $('#idRemove').focus();
    })

</script>

</body>
</html>