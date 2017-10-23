package ua.moskovych.taras.dao;
import ua.moskovych.taras.entity.Group;

import java.util.List;

/**
 * Created by Taras on 02.04.2017.
 */

public interface GroupDao {

    List<Group> findAll();
    String getName(Integer id);
    void add(Group group);
    void delete(int id);
    void edit(Group group);
    Group findByName(String name);
    Group findById(int id);
}
