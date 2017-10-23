package ua.moskovych.taras.services;

import ua.moskovych.taras.entity.Group;
import ua.moskovych.taras.entity.Lesson;
import ua.moskovych.taras.entity.Subject;

import java.util.List;

/**
 * Created by Taras on 02.04.2017.
 */

public interface LessonService {

    List<Lesson> findAll();
    void add(Lesson lesson);
    void generate(List<Group> inputGroupList, List<Subject> inputSubjectList);
    void generation(List<Subject> inputSubjectList, Group group);
    boolean checkForFreeLesson(Lesson lesson);
    List<Lesson> findByGroupId(int id);
    List<Lesson> findByTeacherId(int id);
    void delete(int id);
}
