package ua.moskovych.taras.entity.enums;

/**
 * Created by Taras on 10.05.2017.
 */
public enum  TeacherTitle {

    ASSISTANT(1, "Assistant"),
    TEACHER_J(2, "Junior teacher"),
    TEACHER_S(3, "Teacher"),
    DOCENT(4, "Docent"),
    PROFESSOR(5, "Professor");

    private int teacherTitleValue;
    private String teacherTitleName;

    TeacherTitle(int teacherTitleValue, String teacherTitleName) {
        this.teacherTitleValue = teacherTitleValue;
        this.teacherTitleName = teacherTitleName;
    }

    public int getTeacherTitleValue() {
        return teacherTitleValue;
    }

    public void setTeacherTitleValue(int teacherTitleValue) {
        this.teacherTitleValue = teacherTitleValue;
    }

    public String getTeacherTitleName() {
        return teacherTitleName;
    }

    public void setTeacherTitleName(String teacherTitleName) {
        this.teacherTitleName = teacherTitleName;
    }
}
