package ua.moskovych.taras.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import ua.moskovych.taras.entity.*;
import ua.moskovych.taras.services.*;

import java.util.List;

/**
 * Created by Taras on 03.05.2017.
 */

@Controller
public class RestController {

    @Autowired
    private GroupService groupService;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private ClassroomService classroomService;
    @Autowired
    private SubjectService subjectService;
    @Autowired
    private LessonService lessonService;
    @Autowired
    private ProgramService programService;

    @RequestMapping(value = "/timetable/groups/all", method = RequestMethod.GET)
    @ResponseBody
    public List<Group> showAllGroups(){
        return groupService.findAll();
    }

    @RequestMapping(value = "/timetable/groups/add", method = RequestMethod.POST)
    @ResponseBody
    public void addNewGroup(@RequestBody Group group){
        groupService.add(group);
    }

    @RequestMapping(value = "/timetable/groups/edit", method = RequestMethod.POST)
    @ResponseBody
    public void editGroup(@RequestBody Group group) {
        groupService.edit(group.getId(), group.getName(), group.getNumberOfStudents());
    }

    @RequestMapping(value = "/timetable/groups/delete", method = RequestMethod.POST)
    @ResponseBody
    public void deleteGroup(@RequestBody Integer id) {
        List<Lesson> lessons = lessonService.findByGroupId(id);
        groupService.delete(id);
        for (Lesson lesson : lessons) {
            lessonService.delete(lesson.getId());
        }
    }

    @RequestMapping(value = "/timetable/teachers/all", method = RequestMethod.GET)
    @ResponseBody
    public List<Teacher> showAllTeachers(){
        return teacherService.findAll();
    }

    @RequestMapping(value = "/timetable/teachers/add", method = RequestMethod.POST)
    @ResponseBody
    public void addNewTeacher(@RequestBody Teacher teacher){
        teacherService.add(teacher);
    }

    @RequestMapping(value = "/timetable/teachers/edit", method = RequestMethod.POST)
    @ResponseBody
    public void editTeacher(@RequestBody Teacher teacher) {
        teacherService.edit(teacher.getId(), teacher.getName(), teacher.getSecondName(), teacher.getTeacherTitle(), teacher.getHours());
    }

    @RequestMapping(value = "/timetable/teachers/delete", method = RequestMethod.POST)
    @ResponseBody
    public void deleteTeacher(@RequestBody Integer id) {
        teacherService.delete(id);
    }

    @RequestMapping(value = "/timetable/classrooms/all", method = RequestMethod.GET)
    @ResponseBody
    public List<Classroom> showAllClassrooms(){
        return classroomService.findAll();
    }

    @RequestMapping(value = "/timetable/classrooms/add", method = RequestMethod.POST)
    @ResponseBody
    public void addNewClassroom(@RequestBody Classroom classroom){
        classroomService.add(classroom);
    }

    @RequestMapping(value = "/timetable/classrooms/edit", method = RequestMethod.POST)
    @ResponseBody
    public void editClassroom(@RequestBody Classroom classroom) {
        classroomService.edit(classroom);
    }

    @RequestMapping(value = "/timetable/classrooms/delete", method = RequestMethod.POST)
    @ResponseBody
    public void deleteClassroom(@RequestBody Integer id) {
        classroomService.delete(id);
    }

    @RequestMapping(value = "/timetable/subjects/all", method = RequestMethod.GET)
    @ResponseBody
    public List<Subject> showAllSubjects(){
        return subjectService.findAll();
    }

    @RequestMapping(value = "/timetable/subjects/add", method = RequestMethod.POST)
    @ResponseBody
    public void addNewSubject(@RequestBody Subject subject){
        subjectService.add(subject);
    }

    @RequestMapping(value = "/timetable/subjects/edit", method = RequestMethod.POST)
    @ResponseBody
    public void editSubject(@RequestBody Subject subject) {
        subjectService.edit(subject);
    }

    @RequestMapping(value = "/timetable/subjects/delete", method = RequestMethod.POST)
    @ResponseBody
    public void deleteSubject(@RequestBody Integer id) {
        subjectService.delete(id);
    }

    @RequestMapping(value = "/timetable/curriculum/all", method = RequestMethod.GET)
    @ResponseBody
    public List<Program> showAllPrograms(){
        return programService.findAll();
    }

    @RequestMapping(value = "/timetable/curriculum/add", method = RequestMethod.POST)
    @ResponseBody
    public void addProgram(@RequestBody Program program){
        programService.add(program);
    }

    @RequestMapping(value = "/timetable/curriculum/edit", method = RequestMethod.POST)
    @ResponseBody
    public void editProgram(@RequestBody Program program) {
        programService.edit(program.getId(), program.getName(), program.getHours());
    }

    @RequestMapping(value = "/timetable/curriculum/delete", method = RequestMethod.POST)
    @ResponseBody
    public void deleteProgram(@RequestBody Integer id) {
        programService.delete(id);
    }
}