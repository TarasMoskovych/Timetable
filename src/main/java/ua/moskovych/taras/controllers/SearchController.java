package ua.moskovych.taras.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ua.moskovych.taras.Formatters.GroupSearchForm;
import ua.moskovych.taras.Formatters.TeacherSearchForm;
import ua.moskovych.taras.services.GroupService;
import ua.moskovych.taras.services.TeacherService;

/**
 * Created by Taras on 02.04.2017.
 */

@Controller
public class SearchController {

    @Autowired
    private GroupService groupService;
    @Autowired
    private TeacherService teacherService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String showIndexPage(Model model) {
        model.addAttribute("groups", groupService.findAll());
        model.addAttribute("teachers", teacherService.findAll());
        model.addAttribute("groupSearchForm", new GroupSearchForm());
        model.addAttribute("teacherSearchForm", new TeacherSearchForm());
        return "index";
    }

    @RequestMapping(value = "/for/group", method = RequestMethod.POST)
    public String forGroup(@ModelAttribute("groupSearchForm") GroupSearchForm groupSearchForm) {
        return "redirect:/timetable/group/" + groupSearchForm.getGroup().getId() + "/";
    }

    @RequestMapping(value = "/for/teacher", method = RequestMethod.POST)
    public String forTeacher(@ModelAttribute("teacherSearchForm") TeacherSearchForm teacherSearchForm) {
        return "redirect:/timetable/teacher/" + teacherSearchForm.getTeacher().getId() + "/";
    }

    @RequestMapping(value = "/exam/for/group", method = RequestMethod.POST)
    public String examForGroup(@ModelAttribute("groupSearchForm") GroupSearchForm groupSearchForm) {
        return "redirect:/timetable/exam/group/" + groupSearchForm.getGroup().getId() + "/";
    }

    @RequestMapping(value = "/exam/for/teacher", method = RequestMethod.POST)
    public String examForTeacher(@ModelAttribute("teacherSearchForm") TeacherSearchForm teacherSearchForm) {
        return "redirect:/timetable/exam/teacher/" + teacherSearchForm.getTeacher().getId() + "/";
    }

}