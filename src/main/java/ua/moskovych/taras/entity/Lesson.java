package ua.moskovych.taras.entity;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import ua.moskovych.taras.entity.enums.*;
import ua.moskovych.taras.entity.enums.Day;
import ua.moskovych.taras.entity.enums.LessonMode;
import ua.moskovych.taras.entity.enums.LessonTime;
import ua.moskovych.taras.entity.enums.LessonType;

import javax.persistence.*;
import java.util.List;

/**
 * Created by Taras on 02.04.2017.
 */

@Entity
public class Lesson {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @LazyCollection(LazyCollectionOption.FALSE)
    @ManyToMany
    @JoinTable(name = "group_lesson", joinColumns = @JoinColumn(name = "lessonId"), inverseJoinColumns = @JoinColumn(name = "groupId"))
    private List<Group> groups;

    @LazyCollection(LazyCollectionOption.FALSE)
    @ManyToMany
    @JoinTable(name = "teacher_lesson", joinColumns = @JoinColumn(name = "lessonId"), inverseJoinColumns = @JoinColumn(name = "teacherId"))
    private List<Teacher> teachers;

    @LazyCollection(LazyCollectionOption.FALSE)
    @ManyToOne
    private Subject subjects;

    @LazyCollection(LazyCollectionOption.FALSE)
    @ManyToOne
    private Classroom classrooms;

    @Column
    private Day day;

    @Column
    private LessonTime lessonTime;

    @Column
    private LessonType lessonType;

    @Column
    private LessonMode lessonMode;

    public Lesson() {

    }

    public Lesson(Day day, LessonTime lessonTime, LessonType lessonType, LessonMode lessonMode) {
        this.day = day;
        this.lessonTime = lessonTime;
        this.lessonType = lessonType;
        this.lessonMode = lessonMode;
    }

    public LessonMode getLessonMode() {
        return lessonMode;
    }

    public void setLessonMode(LessonMode lessonMode) {
        this.lessonMode = lessonMode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<Group> getGroups() {
        return groups;
    }

    public void setGroups(List<Group> groups) {
        this.groups = groups;
    }

    public List<Teacher> getTeachers() {
        return teachers;
    }

    public void setTeachers(List<Teacher> teachers) {
        this.teachers = teachers;
    }

    public Classroom getClassrooms() {
        return classrooms;
    }

    public void setClassrooms(Classroom classrooms) {
        this.classrooms = classrooms;
    }

    public Subject getSubjects() {
        return subjects;
    }

    public void setSubjects(Subject subjects) {
        this.subjects = subjects;
    }

    public Day getDay() {
        return day;
    }

    public void setDay(Day day) {
        this.day = day;
    }

    public Day getDayOfWeek() {
        return day;
    }

    public void setDayOfWeek(Day day) {
        this.day = day;
    }

    public LessonTime getLessonTime() {
        return lessonTime;
    }

    public void setLessonTime(LessonTime lessonTime) {
        this.lessonTime = lessonTime;
    }

    public LessonType getLessonType() {
        return lessonType;
    }

    public void setLessonType(LessonType lessonType) {
        this.lessonType = lessonType;
    }

    public String getTeachersString() {
        StringBuilder sb = new StringBuilder();
        for (Teacher t : teachers) {
            sb.append(t.toString()).append(", ");
        }
        if (sb.length() > 1) {
            sb.delete(sb.length() - 2, sb.length());
        }
        return sb.toString();
    }

    public String getClassroomsString() {
        StringBuilder sb = new StringBuilder();
        sb.append(classrooms.toString()).append(", ");

        if (sb.length() > 1) {
            sb.delete(sb.length() - 2, sb.length());
        }
        return sb.toString();
    }

    public String getGroupsString() {
        StringBuilder sb = new StringBuilder();
        for (Group g : groups) {
            sb.append(g.toString()).append(", ");
        }
        if (sb.length() > 1) {
            sb.delete(sb.length() - 2, sb.length());
        }
        return sb.toString();
    }

    public String getSubjectString() {
        StringBuilder sb = new StringBuilder();
        sb.append(subjects.toString()).append(", ");

        if (sb.length() > 1) {
            sb.delete(sb.length() - 2, sb.length());
        }
        return sb.toString();
    }

}
