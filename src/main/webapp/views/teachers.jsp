<%--
  Created by IntelliJ IDEA.
  User: Taras
  Date: 02.04.2017
  Time: 17:54
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
    <title>Teachers</title>
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
                        <li class="active"><a href="/timetable/teachers">Teachers</a></li>
                        <li><a href="/timetable/subjects">Subjects</a></li>
                        <li><a href="/timetable/classrooms">Classrooms</a></li>
                    </ul>
                </li>

            </ul>
        </div>
    </aside>

    <section id="main-content">
        <section class="wrapper">
            <h3 class="pull-left"><i class="fa fa-angle-right"></i> TEACHERS</h3>
            <button class="position btn btn-success btn-xs" data-toggle="modal" data-target="#teacherAddModal"><i class="fa fa-plus"></i></button>

            <div class="row mt">
                <div class="col-md-12">
                    <div class="content-panel">
                        <table class="table table-striped table-hover table-responsive">
                            <thead>
                            <tr>
                                <th>№</th>
                                <%--<th>ID</th>--%>
                                <th>Name</th>
                                <th>Surname</th>
                                <th>Position</th>
                                <th>Academical hours</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody id="teacherContent">
                                <%--AJAX HERE--%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="teacherEditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">Edit this teacher</h4>
                        </div>
                        <div class="modal-body">
                                <div style="display: none;" class="form-group">
                                    <div>
                                        <input id="editId" disabled name="id" type="text" class="form-control" placeholder="Id"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <input id="editName" name="name" type="text" class="form-control" placeholder="Name"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <input id="editSecondName" name="secondName" type="text" class="form-control" placeholder="Surname"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <input id="editHours" name="editHours" type="text" class="form-control" placeholder="Hours"/>
                                    </div>
                                </div>
                                <div class="align-center">
                                    <label for="addTitle">
                                        <select id="editTitle" name="typeTeacher" class="selectpicker mform" data-live-search="true">
                                            <option value="1">Assistant</option>
                                            <option value="2">Junior teacher</option>
                                            <option value="3">Teacher</option>
                                            <option value="4">Docent</option>
                                            <option value="5">Professor</option>
                                        </select>
                                    </label>
                                </div>
                                <div align="center">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <input id="editBtn" type="submit" class="btn btn-danger btn-md" value="Edit"/>
                                </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="teacherDeleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel5">Do you want to delete this teacher?</h4>
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

            <div class="modal fade" id="teacherAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel2">Add new teacher</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                    <div>
                                        <input id="addName" name="name" type="text" class="form-control" placeholder="Name"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <input id="addSecondName" name="secondName" type="text" class="form-control" placeholder="Surname"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <input id="addHours" name="addHours" type="text" class="form-control" placeholder="Number of hours"/>
                                    </div>
                                </div>
                                <div class="align-center">
                                    <label for="addTitle">
                                        <select id="addTitle" name="typeTeacher" class="selectpicker mform" data-live-search="true">
                                            <option value="1">Assistant</option>
                                            <option value="2">Junior teacher</option>
                                            <option value="3">Teacher</option>
                                            <option value="4">Docent</option>
                                            <option value="5">Professor</option>
                                        </select>
                                    </label>
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

<script>

    $(document).ready(showAllTeachers());

    function editTeacher(button) {
        var id = 0;
        id = button.id;
        document.getElementById("editId").value = id;
    }

    function deleteTeacher(button) {
        var id = 0;
        id = Number(button.id);

        $("#deleteBtn").click(function (e) {
            e.preventDefault();

            $.ajax({
                url:'/timetable/teachers/delete',
                method:'POST',
                contentType:'application/json',
                data: JSON.stringify(id),
                success:function () {
                    $('#teacherDeleteModal').modal('toggle');
                    $("#teacherContent").empty();
                    showAllTeachers();
                }
            })
        })
    }

    function showAllTeachers() {
        var HTML = "";

        $.ajax({
            url:'/timetable/teachers/all',
            method:'GET',
            contentType:'application/json',
            success:function (response) {
                for(var i = 0; i < response.length; i++){

                    var title = 'Не встановлено';
                    if(response[i].teacherTitle == 'ASSISTANT') title = 'Assistant';
                    if(response[i].teacherTitle == 'TEACHER_J')title = 'Junior teacher';
                    if(response[i].teacherTitle == 'TEACHER_S')title = 'Teacher';
                    if(response[i].teacherTitle == 'DOCENT')title = 'Docent';
                    if(response[i].teacherTitle == 'PROFESSOR')title = 'Professor';

                    HTML+="<tr>"
                        +"<td>"+ (i+1) + "</td>"
//                        +"<td>"+ response[i].id + "</td>"
                        +"<td>" + response[i].name + "</td>"
                        +"<td>" + response[i].secondName + "</td>"
                        +"<td>" + title + "</td>"
                        +"<td>" + response[i].hours + "</td>"
                        +"<td>"
                        +"<div class='col-sm-1'>"
                        +"<button id='"+ response[i].id + "' title='Edit the teacher' class='pull-left btn btn-primary btn-xs' onclick='editTeacher(this)' data-toggle='modal' data-target='#teacherEditModal'><i class='fa fa-pencil'></i></button>"
                        +"<button id='" + response[i].id + "'" +  "title='Delete the teacher' class='position2 btn btn-danger btn-xs' data-toggle='modal' data-target='#teacherDeleteModal' onclick='deleteTeacher(this)'><i class='fa fa-trash-o '></i></button>"
                        +"</div>"
                        +"</td>"
                        +"</tr>";
                }
                $("#teacherContent").append(HTML);
            },
            error: function () {
                alert('Exception!');
            }
        })
    }

    $("#addBtn").click(function (e) {
        e.preventDefault();

        var title = $("#addTitle").val();
        var objType = 'ASSISTANT';
        if(title == 2) objType = 'TEACHER_J';
        if(title == 3) objType = 'TEACHER_S';
        if(title == 4) objType = 'DOCENT';
        if(title == 5) objType = 'PROFESSOR';

        var teacherObj = {
            name:$("#addName").val(),
            secondName: $("#addSecondName").val(),
            teacherTitle: objType,
            hours: $("#addHours").val()
        };

        $.ajax({
            url:'/timetable/teachers/add',
            method:'POST',
            contentType:'application/json',
            data: JSON.stringify(teacherObj),
            success:function () {

                $('#teacherAddModal').modal('toggle');
                $('#addName').val('');
                $('#addSecondName').val('');
                $('#addTitle').val('');
                $('#addHours').val('');
                $("#teacherContent").empty();
                showAllTeachers();

            },
            error: function () {
                alert("Bad value!");
            }
        })
    });

    $("#editBtn").click(function (e) {
        e.preventDefault();

        var title = $("#editTitle").val();
        var objType = 'ASSISTANT';
        if(title == 2) objType = 'TEACHER_J';
        if(title == 3) objType = 'TEACHER_S';
        if(title == 4) objType = 'DOCENT';
        if(title == 5) objType = 'PROFESSOR';

        var teacherObj = {
            id:$("#editId").val(),
            name:$("#editName").val(),
            secondName: $("#editSecondName").val(),
            teacherTitle: objType,
            hours: $("#editHours").val()
        };

        $.ajax({
            url:'/timetable/teachers/edit',
            method:'POST',
            contentType:'application/json',
            data: JSON.stringify(teacherObj),
            success:function () {
                $('#teacherEditModal').modal('toggle');
                $('#editId').val('');
                $('#editName').val('');
                $('#editSecondName').val('');
                $('#editTitle').val('');
                $('#editHours').val('');
                $("#teacherContent").empty();
                showAllTeachers();
            },
            error: function () {
                alert("Bad value!");
            }
        })
    });

    $('#teacherAddModal').on('shown.bs.modal', function () {
        $('#addName').focus();
    });

    $('#teacherEditModal').on('shown.bs.modal', function () {
        $('#editName').focus();
    })

</script>

</body>
</html>

