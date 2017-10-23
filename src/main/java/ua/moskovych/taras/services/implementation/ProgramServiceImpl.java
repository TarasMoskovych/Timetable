package ua.moskovych.taras.services.implementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.moskovych.taras.dao.GroupDao;
import ua.moskovych.taras.dao.ProgramDao;
import ua.moskovych.taras.entity.Group;
import ua.moskovych.taras.entity.Program;
import ua.moskovych.taras.services.ProgramService;

import java.util.List;

/**
 * Created by Taras on 13.05.2017.
 */

@Service
public class ProgramServiceImpl implements ProgramService {

    @Autowired
    private ProgramDao programDao;
    @Autowired
    private GroupDao groupDao;

    public void add(Program program) {
        programDao.add(program);
    }

    public void edit(int id, String name, int hours) {
        Program program = programDao.find(id);
        if(name!= null && !name.equalsIgnoreCase("")){
            program.setName(name);
        }
        if(hours >= 0){
            program.setHours(hours);
        }

        programDao.edit(program);
    }

    public void delete(int id) {
        programDao.delete(id);
    }

    public List<Program> findAll() {
        return programDao.findAll();
    }

    public Program find(int id) {
        return programDao.find(id);
    }

    public void addGroups(int id, Group group) {
        Program program = programDao.find(id);
        group.setProgram(program);
        groupDao.edit(group);
    }

    public void removeGroups(int id) {
        Program program = programDao.find(id);
        List<Group> groupList = program.getGroupList();

        for (Group group : groupList) {
            group.setProgram(null);
            groupDao.edit(group);
        }

    }
}
