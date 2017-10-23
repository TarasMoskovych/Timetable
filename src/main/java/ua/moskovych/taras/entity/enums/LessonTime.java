package ua.moskovych.taras.entity.enums;

/**
 * Created by Taras on 02.04.2017.
 */

public enum  LessonTime {

    FIRST(1,"1 (8:30 - 10:05)"),
    SECOND(2, "2 (10:20 - 11:55)"),
    THIRD(3, "3 (12:10 - 13:45)"),
    FOURTH(4, "4 (14:15 - 15:50)"),
    FIFTH(5, "5 (16:00 - 17:35)");

    private int timeValue;
    private String timeName;


    LessonTime(int timeValue, String timeName) {
        this.timeName = timeName;
        this.timeValue = timeValue;
    }

    public String getTimeName() {
        return timeName;
    }

    public void setTimeName(String timeName) {
        this.timeName = timeName;
    }

    public int getTimeValue() {
        return timeValue;
    }

    public void setTimeValue(int timeValue) {
        this.timeValue = timeValue;
    }
}
