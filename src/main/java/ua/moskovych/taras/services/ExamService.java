package ua.moskovych.taras.services;

import ua.moskovych.taras.entity.Exam;
import ua.moskovych.taras.entity.Group;
import ua.moskovych.taras.entity.Subject;

import java.util.List;

/**
 * Created by Taras on 14.05.2017.
 */
public interface ExamService {

    List<Exam> findAll();
    void add(Exam exam);
    List<Exam> findByGroupId(int id);
    List<Exam> findByTeacherId(int id);
    void delete(int id);
    void examGeneration(List<Group> inputGroupList, List<Subject> inputSubjectList, String date1, String date2);
}
