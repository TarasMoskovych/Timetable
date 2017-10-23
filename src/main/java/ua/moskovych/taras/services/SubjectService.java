package ua.moskovych.taras.services;

import ua.moskovych.taras.entity.Subject;
import ua.moskovych.taras.entity.Teacher;

import java.util.List;

/**
 * Created by Taras on 02.04.2017.
 */

public interface SubjectService {

    List<Subject> findAll();
    Subject findById(int id);
    void add(Subject subject);
    void add(String name, int hours);
    void addToSubjectNewTeacher(int id, Teacher teacher);
    void edit(int id, String name, int hours);
    void edit(Subject subject);
    void removeTeachers(int id);
    void delete(int id);
}
