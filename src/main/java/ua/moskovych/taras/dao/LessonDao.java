package ua.moskovych.taras.dao;

import ua.moskovych.taras.entity.Lesson;

import java.util.List;

/**
 * Created by Taras on 02.04.2017.
 */

public interface LessonDao {

    List<Lesson> findAll();
    void add(Lesson lesson);
    void delete(int id);
}
