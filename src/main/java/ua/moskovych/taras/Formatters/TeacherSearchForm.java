package ua.moskovych.taras.Formatters;

import ua.moskovych.taras.entity.Teacher;

/**
 * Created by Тарас on 30.04.2017.
 */
public class TeacherSearchForm {

    private Teacher teacher;

    public TeacherSearchForm() {
    }

    public TeacherSearchForm(Teacher teacher) {
        this.teacher = teacher;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }
}
