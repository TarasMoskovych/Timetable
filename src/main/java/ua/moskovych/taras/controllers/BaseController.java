package ua.moskovych.taras.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ua.moskovych.taras.Formatters.GroupSearchForm;
import ua.moskovych.taras.Formatters.GroupSearchFormList;
import ua.moskovych.taras.Formatters.TeacherSearchFormSet;
import ua.moskovych.taras.entity.Group;
import ua.moskovych.taras.services.*;

/**
 * Created by Taras on 03.04.2017.
 */

@Controller
public class BaseController {

    @Autowired
    private GroupService groupService;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private ClassroomService classroomService;
    @Autowired
    private SubjectService subjectService;
    @Autowired
    private ProgramService programService;

    @RequestMapping(value = "/timetable/groups", method = RequestMethod.GET)
    public String groupsPage(){
       return "groups";
    }

    @RequestMapping(value = "/timetable/teachers", method = RequestMethod.GET)
    public String teachersPage(){
        return "teachers";
    }

    @RequestMapping(value = "/timetable/classrooms", method = RequestMethod.GET)
    public String classroomsPage(){;
        return "classrooms";
    }

    @RequestMapping(value = "/timetable/subjects", method = RequestMethod.GET)
    public String showAllSubjects(Model model){
        //model.addAttribute("teacher", new Teacher());
        model.addAttribute("subjects", subjectService.findAll());
        model.addAttribute("teachers", teacherService.findAll());
        model.addAttribute("teacherSearchFormList", new TeacherSearchFormSet());
        //model.addAttribute("teacherSearchForm", new TeacherSearchForm());
        return "subjects";
    }

    @RequestMapping(value = "/timetable/curriculum", method = RequestMethod.GET)
    public String curriculum(Model model){
        model.addAttribute("group", new Group());
        model.addAttribute("groupList", groupService.findAll());
        model.addAttribute("programs", programService.findAll());
        model.addAttribute("groupSearchFormList", new GroupSearchFormList());
        model.addAttribute("groupSearchForm", new GroupSearchForm());
        return "curriculum";
    }

}