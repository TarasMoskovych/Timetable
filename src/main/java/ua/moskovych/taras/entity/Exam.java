package ua.moskovych.taras.entity;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import ua.moskovych.taras.entity.enums.LessonTime;

import javax.persistence.*;

/**
 * Created by Taras on 02.04.2017.
 */

@Entity
public class Exam {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @LazyCollection(LazyCollectionOption.FALSE)
    @ManyToOne
    private Group groups;

    @LazyCollection(LazyCollectionOption.FALSE)
    @ManyToOne
    private Teacher teachers;

    @LazyCollection(LazyCollectionOption.FALSE)
    @ManyToOne
    private Subject subjects;

    @LazyCollection(LazyCollectionOption.FALSE)
    @ManyToOne
    private Classroom classrooms;

    @Column
    private LessonTime lessonTime;

    @Column
    private String date;

    public Exam() {

    }

    public Exam(LessonTime lessonTime, String date) {
        this.lessonTime = lessonTime;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Group getGroups() {
        return groups;
    }

    public void setGroups(Group groups) {
        this.groups = groups;
    }

    public Teacher getTeachers() {
        return teachers;
    }

    public void setTeachers(Teacher teachers) {
        this.teachers = teachers;
    }

    public Subject getSubjects() {
        return subjects;
    }

    public void setSubjects(Subject subjects) {
        this.subjects = subjects;
    }

    public Classroom getClassrooms() {
        return classrooms;
    }

    public void setClassrooms(Classroom classrooms) {
        this.classrooms = classrooms;
    }

    public LessonTime getLessonTime() {
        return lessonTime;
    }

    public void setLessonTime(LessonTime lessonTime) {
        this.lessonTime = lessonTime;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTeachersString() {
        StringBuilder sb = new StringBuilder();
           sb.append(teachers.toString()).append(", ");

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
           sb.append(groups.toString()).append(", ");

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
