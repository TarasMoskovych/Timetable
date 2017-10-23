package ua.moskovych.taras.entity.enums;

/**
 * Created by Taras on 02.04.2017.
 */
public enum  LessonType {

    LECTURE(1,"lecture"),
    PRACTICE(2,"practice"),
    LABORATORY(3,"lab");

    private int typeValue;
    private String typeName;

    LessonType(int typeValue, String typeName) {
        this.typeValue = typeValue;
        this.typeName = typeName;
    }

    public int getTypeValue() {
        return typeValue;
    }

    public void setTypeValue(int typeValue) {
        this.typeValue = typeValue;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
}
