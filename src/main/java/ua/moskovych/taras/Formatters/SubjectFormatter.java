package ua.moskovych.taras.Formatters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.Formatter;
import org.springframework.stereotype.Component;
import ua.moskovych.taras.dao.SubjectDao;
import ua.moskovych.taras.entity.Subject;

import java.text.ParseException;
import java.util.Locale;

/**
 * Created by Taras on 02.04.2017.
 */

@Component("subjectForm")
public class SubjectFormatter implements Formatter<Subject> {

    @Autowired
    private SubjectDao subjectDao;

    public Subject parse(String id, Locale locale) throws ParseException {
        return subjectDao.findById(Integer.parseInt(id));
    }

    public String print(Subject subject, Locale locale) {
        return subject.getName().toString();
    }
}
