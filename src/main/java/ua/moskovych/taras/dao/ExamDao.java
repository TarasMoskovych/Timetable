package ua.moskovych.taras.dao;

import ua.moskovych.taras.entity.Exam;

import java.util.List;

/**
 * Created by Taras on 14.05.2017.
 */
public interface ExamDao {

    List<Exam> findAll();
    void add(Exam exam);
    void delete(int id);
}
