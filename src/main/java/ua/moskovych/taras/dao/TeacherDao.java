package ua.moskovych.taras.dao;

import ua.moskovych.taras.entity.Teacher;

import java.util.List;

/**
 * Created by Taras on 02.04.2017.
 */

public interface TeacherDao {

    List<Teacher> findAll();
    List<Teacher> findTeacherBySubjectId(int id);
    String getName(int id);
    void add(Teacher teacher);
    void delete(int id);
    void edit(Teacher teacher);
    Teacher findByName(String name);
    Teacher findById(int id);

}
