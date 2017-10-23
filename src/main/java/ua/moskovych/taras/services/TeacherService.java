package ua.moskovych.taras.services;

import ua.moskovych.taras.entity.Teacher;
import ua.moskovych.taras.entity.enums.TeacherTitle;

import java.util.List;

/**
 * Created by Taras on 02.04.2017.
 */

public interface TeacherService {

    List<Teacher> findAll();
    List<Teacher> findTeacherBySubjectId(int id);
    String getName(int id);
    void add(Teacher teacher);
    void add(String name, String secondName, TeacherTitle teacherTitle);
    void edit(int id, String name, String secondName, TeacherTitle teacherTitle);
    void edit(int id, String name, String secondName, TeacherTitle teacherTitle, int hours);
    void delete(int id);
    Teacher findByName(String name);
    Teacher findById(int id);
}
