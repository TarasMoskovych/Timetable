<%--
  Created by IntelliJ IDEA.
  User: Taras
  Date: 02.04.2017
  Time: 17:54
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
    <title>Classrooms</title>
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
                        <li><a href="/timetable/subjects">Subjects</a></li>
                        <li class="active"><a href="/timetable/classrooms">Classrooms</a></li>
                    </ul>
                </li>

            </ul>
        </div>
    </aside>

    <section id="main-content">
        <section class="wrapper">
            <h3 class="pull-left"><i class="fa fa-angle-right"></i> CLASSROOMS</h3>
            <button class="position btn btn-success btn-xs" data-toggle="modal" data-target="#classroomAddModal"><i class="fa fa-plus"></i></button>

            <div class="row mt">
                <div class="col-md-12">
                    <div class="content-panel">
                        <table class="table table-striped table-advance table-hover">
                            <thead>
                            <tr>
                                <th>№</th>
                                <%--<th>ID</th>--%>
                                <th>Building</th>
                                <th>Room</th>
                                <th>Type</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody id="classroomContent">
                                <%--AJAX HERE--%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="classroomEditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">Edit this classroom</h4>
                        </div>
                        <div class="modal-body">
                                <div style="display:none;" class="form-group">
                                    <div>
                                        <input id="editId" disabled name="id" type="text" class="form-control" placeholder="Id"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <input id="editBuilding" name="building" type="text" class="form-control" placeholder="Building"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <input id="editRoom" name="room" type="text" class="form-control" placeholder="Room"/>
                                    </div>
                                </div>
                                <div class="align-center">
                                    <label for="editType">
                                        <select id="editType" name="typeClassroom" class="selectpicker mform" data-live-search="true" >
                                            <option value="1">Lecture</option>
                                            <option value="2">Laboratory</option>
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

            <div class="modal fade" id="classroomDeleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel5">Do you want to delete this classroom?</h4>
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

            <div class="modal fade" id="classroomAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel2">Add new classroom</h4>
                        </div>
                        <div class="modal-body">
                                <div class="form-group">
                                    <div>
                                        <input id="addBuilding" name="building" type="text" class="form-control" placeholder="Building"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <input id="addRoom" name="room" type="text" class="form-control" placeholder="Room"/>
                                    </div>
                                </div>
                                <div class="align-center">
                                    <label for="addType">
                                        <select id="addType" name="typeClassroom" class="selectpicker mform" data-live-search="true">
                                            <option value="1">Lecture</option>
                                            <option value="2">Laboratory</option>
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

    $(document).ready(showAllClassrooms());

    function editClassroom(button) {
        var id = 0;
        id = button.id;
        document.getElementById("editId").value = id;
    }

    function deleteClassroom(button) {
        var id = 0;
        id = Number(button.id);

        $("#deleteBtn").click(function (e) {
            e.preventDefault();

            $.ajax({
                url:'/timetable/classrooms/delete',
                method:'POST',
                contentType:'application/json',
                data: JSON.stringify(id),
                success:function () {
                    $('#classroomDeleteModal').modal('toggle');
                    $("#classroomContent").empty();
                    showAllClassrooms();
                }
            })
        })
    }

    function showAllClassrooms() {
        var HTML = "";

        $.ajax({
            url:'/timetable/classrooms/all',
            method:'GET',
            contentType:'application/json',
            success:function (response) {
                for(var i = 0; i < response.length; i++){
                    var classroomType = 'None';
                    if(response[i].classroomType == 'LECTURE')classroomType = 'Lecture';
                    if(response[i].classroomType == 'LABORATORY') classroomType = 'Laboratory';

                    HTML+="<tr>"
                        +"<td>"+ (i+1) + "</td>"
//                        +"<td>"+ response[i].id + "</td>"
                        +"<td>" + response[i].building + "</td>"
                        +"<td>" + response[i].room + "</td>"
                        +"<td>" + classroomType + "</td>"
                        +"<td>"
                        +"<div class='col-sm-1'>"
                        +"<button id='"+ response[i].id + "' title='Edit this classroom' class='pull-left btn btn-primary btn-xs' onclick='editClassroom(this)' data-toggle='modal' data-target='#classroomEditModal'><i class='fa fa-pencil'></i></button>"
                        +"<button id='" + response[i].id + "'" +  "title='Delete this classroom' onclick='deleteClassroom(this)' class='position2 btn btn-danger btn-xs' data-toggle='modal' data-target='#classroomDeleteModal'><i class='fa fa-trash-o'></i></button>"
                        +"</div>"
                        +"</td>"
                        +"</tr>";
                }
                $("#classroomContent").append(HTML);
            },
            error: function () {
                alert('Exception!');
            }
        })
    }

    $("#addBtn").click(function (e) {
        e.preventDefault();

        var type = $("#addType").val();
        var objType = 'LECTURE';
        if(type == 2) objType = 'LABORATORY';

        var classroomObj = {
            building:$("#addBuilding").val(),
            room: $("#addRoom").val(),
            classroomType: objType
        };


        $.ajax({
            url:'/timetable/classrooms/add',
            method:'POST',
            contentType:'application/json',
            data: JSON.stringify(classroomObj),
            success:function () {

                $('#classroomAddModal').modal('toggle');
                $('#addBuilding').val('');
                $('#addSecondName').val('');
                $("#classroomContent").empty();
                showAllClassrooms();

            },
            error: function () {
                alert("Bad value!");
            }
        })
    });

    $("#editBtn").click(function (e) {
        e.preventDefault();

        var type = $("#editType").val();
        var objType = 'LECTURE';
        if(type == 2) objType = 'LABORATORY';

        var classroomObj = {
            id: $("#editId").val(),
            building:$("#editBuilding").val(),
            room: $("#editRoom").val(),
            classroomType: objType
        };

        $.ajax({
            url:'/timetable/classrooms/edit',
            method:'POST',
            contentType:'application/json',
            data: JSON.stringify(classroomObj),
            success:function () {
                $('#classroomEditModal').modal('toggle');
                $('#editId').val('');
                $('#editBuilding').val('');
                $('#editRoom').val('');
                $("#classroomContent").empty();

                showAllClassrooms();
            },
            error: function () {
                alert("Bad value!");
            }
        })
    });

    $('#classroomAddModal').on('shown.bs.modal', function () {
        $('#addBuilding').focus();
    });

    $('#classroomEditModal').on('shown.bs.modal', function () {
        $('#editBuilding').focus();
    })

</script>

</body>
</html>

