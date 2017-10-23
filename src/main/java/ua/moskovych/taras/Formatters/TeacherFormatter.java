package ua.moskovych.taras.Formatters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.Formatter;
import org.springframework.stereotype.Component;
import ua.moskovych.taras.entity.Teacher;
import ua.moskovych.taras.services.TeacherService;

import java.text.ParseException;
import java.util.Locale;

/**
 * Created by Taras on 02.04.2017.
 */

@Component("teacherForm")
public class TeacherFormatter implements Formatter<Teacher> {

    @Autowired
    private TeacherService teacherService;

    public Teacher parse(String s, Locale locale) throws ParseException {
        return teacherService.findById(Integer.parseInt(s));
    }

    public String print(Teacher teacher, Locale locale) {
        return teacher.toString();
    }
}
