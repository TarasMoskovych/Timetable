package ua.moskovych.taras.dao;

import ua.moskovych.taras.entity.Classroom;
import ua.moskovych.taras.entity.enums.ClassroomType;

import java.util.List;

/**
 * Created by Taras on 02.04.2017.
 */

public interface ClassroomDao {

    List<Classroom> findByType(ClassroomType classroomType);
    List<Classroom> findAll();
    void add(Classroom classroom);
    void edit(Classroom classroom);
    void delete(int id);
    Classroom findById(int id);
}
