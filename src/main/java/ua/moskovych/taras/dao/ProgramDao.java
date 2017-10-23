package ua.moskovych.taras.dao;

import ua.moskovych.taras.entity.Program;

import java.util.List;

/**
 * Created by Taras on 13.05.2017.
 */
public interface ProgramDao {

    void add(Program program);
    void edit(Program program);
    void delete(int id);
    List<Program> findAll();
    Program find(int id);
}
