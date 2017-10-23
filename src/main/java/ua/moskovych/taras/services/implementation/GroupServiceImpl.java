package ua.moskovych.taras.services.implementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.moskovych.taras.dao.GroupDao;
import ua.moskovych.taras.entity.Group;
import ua.moskovych.taras.services.GroupService;

import java.util.List;

/**
 * Created by Taras on 02.04.2017.
 */

@Service
public class GroupServiceImpl implements GroupService {

    @Autowired
    private GroupDao groupDao;

    public List<Group> findAll() {
        return groupDao.findAll();
    }

    public String getName(int id) {
        return groupDao.getName(id);
    }

    public void add(Group group) {
        groupDao.add(group);
    }

    public Group findByName(String name) {
        return groupDao.findByName(name);
    }

    public Group findById(int id) {
        return groupDao.findById(id);
    }

    public void delete(int id) {
        groupDao.delete(id);
    }

    public void edit(int id, String name, int nos) {
        Group group = groupDao.findById(id);

        if(name!= null && !name.equalsIgnoreCase("")){
            group.setName(name);
        }

        if(nos!= 0){
            group.setNumberOfStudents(nos);
        }

        groupDao.edit(group);
    }

    public void add(String name, int count) {
        groupDao.add(new Group(name, count));
    }


}
