<%--
  Created by IntelliJ IDEA.
  User: Taras
  Date: 02.04.2017
  Time: 17:54
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
    <title>Curriculums</title>
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
                    <p class="centered"><img src="${pageContext.request.contextPath}/resources/assets/img/admin.png" class="img-circle" width="60"></p>
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
                            <li><a href="/timetable/exam">Exams</a></li>
                        </ul>
                        <ul class="sub">
                            <li class="active"><a href="/timetable/curriculum">Curriculums</a></li>
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
                <h3 class="pull-left"><i class="fa fa-angle-right"></i> ADD CURRICULUM</h3>
                <button class="position btn btn-success btn-xs" data-toggle="modal" data-target="#settingsAddModal"><i class="fa fa-plus"></i></button>
                <div class="row mt">
                    <div class="col-md-12">
                        <div class="form-panel">

                            <table class="table table-striped table-advance table-hover">
                                <thead>
                                <tr>
                                    <th>№</th>
                                    <th>Curriculum</th>
                                    <th>Subject's hours</th>
                                    <th>Groups</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody id="settingsContent">
                                    <%--AJAX HERE--%>
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>

                <div class="modal fade" id="settingsEditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel">Edit this curriculum</h4>
                            </div>
                            <div class="modal-body">
                                <div style="display: none;" class="form-group">
                                    <div>
                                        <input id="editId" disabled name="id" type="text" class="form-control" placeholder="Id"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <input id="editName" name="name" type="text" class="form-control" placeholder="Curriculum name"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <input id="editHours" name="secondName" type="text" class="form-control" placeholder="Hours"/>
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
                <div class="modal fade" id="settingsAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel2">Add new curriculum</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <div>
                                        <input id="addName" name="name" type="text" class="form-control" placeholder="Curriclulum name"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <input id="addHours" name="secondName" type="text" class="form-control" placeholder="Hours"/>
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

                <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel3">Add new group</h4>
                            </div>
                            <div class="modal-body">
                                <form:form action="add/curriculum-group" method="post" modelAttribute="groupSearchFormList">
                                    <div class="form-group">
                                        <div>
                                            <input style="display:none;" id="idNew" name="id" type="text" class="form-control" placeholder="Id"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div align="center">
                                            <form:select path="groupList" multiple="true" class="selectGroup selectpicker mform" data-live-search="true">
                                                <form:options items="${groupList}" itemValue="id"/>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div align="center">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        <input type="submit" class="btn btn-success btn-md" value="Add group"/>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel4">Clean groups list</h4>
                            </div>
                            <div class="modal-body">
                                <form action="removeAllGroups" method="post">
                                    <div class="form-group">
                                        <div>
                                            <input style="display:none;" id="idRemove" name="id" type="text" class="form-control" placeholder="Id"/>
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


                <div class="modal fade" id="settingsDeleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel5">Do you want to delete this curriculum?</h4>
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

                </sec:authorize>
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

    <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.scrollTo.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/common-scripts.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/jquery-ui-1.9.2.custom.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-switch.js"></script>

    <script>

        $(document).ready(showAllPrograms());

        function editProgram(button) {
            var id = 0;
            id = button.id;
            document.getElementById("editId").value = id;
        }

        function addGroup (button) {
            var id = 0;
            id = button.id;
            document.getElementById("idNew").value = id;

        }

        function deleteGroup (button) {
            var id2 = 0;
            id2 = button.id;
            document.getElementById("idRemove").value = id2;

        }

        function deleteProgram(button) {
            var id = 0;
            id = Number(button.id);

            $("#deleteBtn").click(function (e) {
                e.preventDefault();

                $.ajax({
                    url:'/timetable/curriculum/delete',
                    method:'POST',
                    contentType:'application/json',
                    data: JSON.stringify(id),
                    success:function () {
                        $('#settingsDeleteModal').modal('toggle');
                        $("#settingsContent").empty();
                        showAllPrograms();
                    }
                })
            })
        }

        function getSettingsObject() {
            return {name:$("#addName").val(), hours: $("#addHours").val()};
        }

        function getSettingsObject2() {
            return {id:$("#editId").val(), name:$("#editName").val(), hours: $("#editHours").val()};
        }

        function showAllPrograms() {
            var HTML = "";

            $.ajax({
                url:'/timetable/curriculum/all',
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
                            +"<button onclick='addGroup(this)' id='"+ response[i].id + "'  class='pull-left btn btn-success btn-xs' data-toggle='modal' data-target='#myModal3'><i class='fa fa-plus'></i></button>"
                            +"<button style='margin-right: 5px;' onclick='deleteGroup(this)' id='"+ response[i].id + "' class='position3 pull-left btn btn-danger btn-xs' data-toggle='modal' data-target='#myModal4'><i class='fa fa-trash-o'></i></button>"
                            + response[i].groupsString
                            +"</td>"
                            +"<td>"
                            +"<div class='col-sm-1'>"
                            +"<button id='"+ response[i].id + "' title='Edit this curriculum' class='pull-left btn btn-primary btn-xs' onclick='editProgram(this)' data-toggle='modal' data-target='#settingsEditModal'><i class='fa fa-pencil'></i></button>"
                            +"<button id='" + response[i].id + "'" +  "title='Delete this curriculum' class='position2 btn btn-danger btn-xs' data-toggle='modal' data-target='#settingsDeleteModal' onclick='deleteProgram(this)'><i class='fa fa-trash-o '></i></button>"
                            +"</div>"
                            +"</td>"
                            +"</tr>";
                    }
                    $("#settingsContent").append(HTML);
                },
                error: function () {
                    alert('Exception!');
                }
            })
        }

        $("#addBtn").click(function (e) {
            e.preventDefault();



            $.ajax({
                url:'/timetable/curriculum/add',
                method:'POST',
                contentType:'application/json',
                data: JSON.stringify(getSettingsObject()),
                success:function () {

                    $('#settingsAddModal').modal('toggle');
                    $('#addName').val('');
                    $('#addHours').val('');
                    $("#settingsContent").empty();
                    showAllPrograms();

                },
                error: function () {
                    alert("Bad value!");
                }
            })
        });

        $("#editBtn").click(function (e) {
            e.preventDefault();

            $.ajax({
                url:'/timetable/curriculum/edit',
                method:'POST',
                contentType:'application/json',
                data: JSON.stringify(getSettingsObject2()),
                success:function () {
                    $('#settingsEditModal').modal('toggle');
                    $('#editName').val('');
                    $('#editHours').val('');
                    $("#settingsContent").empty();
                    showAllPrograms();
                },
                error: function () {
                    alert("Bad value!");
                }
            })
        });

        $('#settingsAddModal').on('shown.bs.modal', function () {
            $('#addName').focus();
        });

        $('#settingsEditModal').on('shown.bs.modal', function () {
            $('#editName').focus();
        })

    </script>
</body>
</html>