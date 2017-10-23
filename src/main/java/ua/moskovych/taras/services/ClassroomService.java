package ua.moskovych.taras.services;

import ua.moskovych.taras.entity.Classroom;
import ua.moskovych.taras.entity.enums.ClassroomType;

import java.util.List;

/**
 * Created by Taras on 02.04.2017.
 */

public interface ClassroomService {

    List<Classroom> findByType(ClassroomType classroomType);
    List<Classroom> findAll();
    void add(Classroom classroom);
    void edit(Classroom classroom);
    void edit(int id, String building, String room, ClassroomType classroomType);
    void delete(int id);
}
