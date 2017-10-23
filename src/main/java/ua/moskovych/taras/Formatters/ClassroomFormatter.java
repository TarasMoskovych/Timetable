package ua.moskovych.taras.Formatters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.Formatter;
import org.springframework.stereotype.Component;
import ua.moskovych.taras.dao.ClassroomDao;
import ua.moskovych.taras.entity.Classroom;

import java.text.ParseException;
import java.util.Locale;

/**
 * Created by Taras on 02.04.2017.
 */

@Component("classroomForm")
public class ClassroomFormatter implements Formatter<Classroom> {

    @Autowired
    private ClassroomDao classroomDao;

    public Classroom parse(String s, Locale locale) throws ParseException {
        return classroomDao.findById(Integer.parseInt(s));
    }

    public String print(Classroom classroom, Locale locale) {
        return classroom.toString();
    }
}
