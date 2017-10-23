package ua.moskovych.taras.entity.enums;

/**
 * Created by Taras on 05.05.2017.
 */
public enum  ClassroomType {

    LECTURE(1,"Lecture"),
    LABORATORY(2,"Laboratory");

    private int classroomTypeValue;
    private String classroomTypeName;

    ClassroomType(int classroomTypeValue, String classroomTypeName) {
        this.classroomTypeValue = classroomTypeValue;
        this.classroomTypeName = classroomTypeName;
    }

    public int getClassroomTypeValue() {
        return classroomTypeValue;
    }

    public void setClassroomTypeValue(int classroomTypeValue) {
        this.classroomTypeValue = classroomTypeValue;
    }

    public String getClassroomTypeName() {
        return classroomTypeName;
    }

    public void setClassroomTypeName(String classroomTypeName) {
        this.classroomTypeName = classroomTypeName;
    }

    @Override
    public String toString() {
        return classroomTypeName;
    }
}
