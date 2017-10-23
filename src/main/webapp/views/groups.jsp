<%--
  Created by IntelliJ IDEA.
  User: Taras
  Date: 02.04.2017
  Time: 17:54
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
    <title>Groups</title>
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
                        <li class="active"><a href="/timetable/groups">Groups</a></li>
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
            <h3 class="pull-left"><i class="fa fa-angle-right"></i> GROUPS</h3>
            <button class="position btn btn-success btn-xs" data-toggle="modal" title="Add new group" data-target="#groupAddModal"><i class="fa fa-plus"></i></button>
            <div class="row mt">
                <div class="col-sm-12">
                    <div class="content-panel">
                        <table class="table table-striped table-hover table-responsive">
                            <thead>
                            <tr>
                                <th>№</th>
                                <%--<th>ID</th>--%>
                                <th>Group name</th>
                                <th>Number of students</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody id="groupContent">
                                <%--AJAX HERE--%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="groupEditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">Edit this group</h4>
                        </div>
                        <div class="modal-body">
                                <div style="display: none;" class="form-group">
                                    <div>
                                        <input id="editId" disabled name="id" type="text" class="form-control groupName" placeholder="Id"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <input id="editName" name="name" type="text" class="form-control" placeholder="Name"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <input id="editNumberOfStudents" name="count" type="text" class="form-control numberOfStudents" placeholder="Number of students"/>
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
            <div class="modal fade" id="groupDeleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel5">Do you want do delete this group?</h4>
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
            <div class="modal fade" id="groupAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel2">Add new group</h4>
                        </div>
                        <div class="modal-body">
                                <div class="form-group">
                                    <div>
                                        <input id="groupName" name="name" class="form-control groupName" placeholder="Name"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <input id="numberOfStudents" name="numberOfStudents" class="form-control numberOfStudents" placeholder="Number of students"/>
                                    </div>
                                </div>
                                <div align="center">
                                    <button type="addbtnClose" class="btn btn-default" data-dismiss="modal">Close</button>
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

    $(document).ready(showAllGroups());

    function deleteGroup(button) {
        var id = 0;
        id = Number(button.id);

        $("#deleteBtn").click(function (e) {
            e.preventDefault();

            $.ajax({
                url:'/timetable/groups/delete',
                method:'POST',
                contentType:'application/json',
                data: JSON.stringify(id),
                success:function () {
                    $('#groupDeleteModal').modal('toggle');
                    $("#groupContent").empty();
                    showAllGroups();
                }
            })
        })
    }

    $(document).ready(showAllGroups());

    function editGroup(button) {
        var id = 0;
        id = button.id;
        document.getElementById("editId").value = id;
    }

    function showAllGroups() {
        var HTML = "";

        $.ajax({
            url:'/timetable/groups/all',
            method:'GET',
            contentType:'application/json',
            success:function (response) {
                for(var i = 0; i < response.length; i++){
                    HTML+="<tr id='tr" + response[i].id +"'>"
                        +"<td>"+ (i+1) + "</td>"
//                        +"<td>"+ response[i].id + "</td>"
                        +"<td>" + response[i].name + "</td>"
                        +"<td>" + response[i].numberOfStudents + "</td>"
                        +"<td>"
                        +"<div class='col-sm-1'>"
                        +"<button id='"+ response[i].id + "' title='Edit this group' class='pull-left btn btn-primary btn-xs' onclick='editGroup(this)' data-toggle='modal' data-target='#groupEditModal'><i class='fa fa-pencil'></i></button>"
                        +"<button data-toggle='modal' title='Delete this group' data-target='#groupDeleteModal' onclick = 'deleteGroup(this)' id='"+ response[i].id + "'" +  "title='Видалити групу' class='position2 btn btn-danger btn-xs'><i class='fa fa-trash-o '></i></button>"
                        +"</div>"
                        +"</td>"
                        +"</tr>";
                }

                $("#groupContent").empty();
                $("#groupContent").append(HTML);
            },
            error: function () {
                alert('Exception!');
            }
        })
    }

    function getGroupObject() {
        return {name:$("#groupName").val(), numberOfStudents: $("#numberOfStudents").val()};
    }

    function getGroupObject2() {
        return {id:$("#editId").val(), name:$("#editName").val(), numberOfStudents: $("#editNumberOfStudents").val()};
    }

    $("#addBtn").click(function (e) {
        e.preventDefault();

        $.ajax({
            url:'/timetable/groups/add',
            method:'POST',
            contentType:'application/json',
            data: JSON.stringify(getGroupObject()),
            success:function () {

                $('#groupAddModal').modal('toggle');
                $('#groupName').val('');
                $('#numberOfStudents').val('');
                $("#groupContent").empty();
                showAllGroups();

            },
            error: function () {
                alert("Bad value!");
            }
        })
    });

    $("#editBtn").click(function (e) {
        e.preventDefault();

        $.ajax({
            url:'/timetable/groups/edit',
            method:'POST',
            contentType:'application/json',
            data: JSON.stringify(getGroupObject2()),
            success:function () {
                $('#groupEditModal').modal('toggle');
                $('#editId').val('');
                $('#editName').val('');
                $('#editNumberOfStudents').val('');
                $("#groupContent").empty();
                showAllGroups();
            },
            error: function () {
                alert("Bad value!");
            }
        })
    });

    $('#groupAddModal').on('shown.bs.modal', function () {
        $('#groupName').focus();
    });

    $('#groupEditModal').on('shown.bs.modal', function () {
        $('#editName').focus();
    })

</script>

</body>
</html>