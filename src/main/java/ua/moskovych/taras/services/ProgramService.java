package ua.moskovych.taras.services;

import ua.moskovych.taras.entity.Group;
import ua.moskovych.taras.entity.Program;

import java.util.List;

/**
 * Created by Taras on 13.05.2017.
 */

public interface ProgramService {

    void add(Program program);
    void edit(int id, String name, int hours);
    void delete(int id);
    List<Program> findAll();
    Program find(int id);
    void addGroups(int id, Group group);
    void removeGroups(int id);
}
