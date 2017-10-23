package ua.moskovych.taras.Formatters;

import ua.moskovych.taras.entity.Teacher;

import java.util.List;

/**
 * Created by Taras on 02.05.2017.
 */
public class TeacherSearchFormSet {

    private List<Teacher> teachers;

    public TeacherSearchFormSet() {
    }

    public TeacherSearchFormSet(List<Teacher> teachers) {
        this.teachers = teachers;
    }

    public List<Teacher> getTeachers() {
        return teachers;
    }

    public void setTeachers(List<Teacher> teachers) {
        this.teachers = teachers;
    }
}
