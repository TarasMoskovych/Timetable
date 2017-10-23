package ua.moskovych.taras.dao;

import ua.moskovych.taras.entity.Subject;

import java.util.List;

/**
 * Created by Taras on 02.04.2017.
 */

public interface SubjectDao {

    List<Subject> findAll();
    void add(Subject subject);
    void delete(int id);
    void edit(Subject subject);
    Subject findById(int id);
}
