package ua.moskovych.taras.entity.enums;

/**
 * Created by Taras on 05.04.2017.
 */
public enum  LessonDivide {

    ALL(1,"Whole group"),
    GROUP_A(2,"Group a"),
    GROUP_B(3,"Group b");

    private int divideValue;
    private String divideName;

    LessonDivide(int divideValue, String divideName) {
        this.divideValue = divideValue;
        this.divideName = divideName;
    }

    public int getDivideValue() {
        return divideValue;
    }

    public void setDivideValue(int divideValue) {
        this.divideValue = divideValue;
    }

    public String getDivideName() {
        return divideName;
    }

    public void setDivideName(String divideName) {
        this.divideName = divideName;
    }
}
