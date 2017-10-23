package ua.moskovych.taras.Formatters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.Formatter;
import org.springframework.stereotype.Component;
import ua.moskovych.taras.dao.GroupDao;
import ua.moskovych.taras.entity.Group;

import java.text.ParseException;
import java.util.Locale;

/**
 * Created by Taras on 02.04.2017.
 */

@Component("groupForm")
public class GroupFormatter implements Formatter<Group>{

    @Autowired
    private GroupDao groupDao;

    public Group parse(String s, Locale locale) throws ParseException {
        return groupDao.findById(Integer.parseInt(s));
    }

    public String print(Group group, Locale locale) {
        return group.getName();
    }
}
