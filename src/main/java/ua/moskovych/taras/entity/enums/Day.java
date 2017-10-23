package ua.moskovych.taras.entity.enums;

/**
 * Created by Taras on 02.04.2017.
 */

public enum Day {

    MONDAY(1, "Monday"),
    TUESDAY(2, "Tuesday"),
    WEDNESDAY(3, "Wednesday"),
    THURSDAY(4, "Thursday"),
    FRIDAY(5, "Friday");

    private int dayValue;
    private String dayName;


    Day(int dayValue, String dayName) {
        this.dayName = dayName;
        this.dayValue = dayValue;
    }

    public String getDayName() {
        return dayName;
    }

    public void setDayName(String dayName) {
        this.dayName = dayName;
    }

    public int getDayValue() {
        return dayValue;
    }

    public void setDayValue(int dayValue) {
        this.dayValue = dayValue;
    }
}
