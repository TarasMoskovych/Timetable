package ua.moskovych.taras.entity.enums;

/**
 * Created by Taras on 05.04.2017.
 */

public enum  LessonMode {

    NORMAL(1,"Normal"),
    NUMERATOR(2,"Numerator"),
    DENOMINATOR(3,"Denominator");

    private int modeValue;
    private String modeName;

    LessonMode(int modeValue, String modeName) {
        this.modeValue = modeValue;
        this.modeName = modeName;
    }

    public int getModeValue() {
        return modeValue;
    }

    public void setModeValue(int modeValue) {
        this.modeValue = modeValue;
    }

    public String getModeName() {
        return modeName;
    }

    public void setModeName(String modeName) {
        this.modeName = modeName;
    }
}
