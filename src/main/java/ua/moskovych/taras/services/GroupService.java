package ua.moskovych.taras.services;

import ua.moskovych.taras.entity.Group;

import java.util.List;

/**
 * Created by Taras on 02.04.2017.
 */

public interface GroupService {

    List<Group> findAll();
    String getName(int id);
    void add(Group group);
    void add(String name, int count);
    void delete(int id);
    void edit(int id, String name, int nos);
    Group findByName(String name);
    Group findById(int id);
}
