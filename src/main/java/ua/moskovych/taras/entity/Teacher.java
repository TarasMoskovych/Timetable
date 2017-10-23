package ua.moskovych.taras.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import ua.moskovych.taras.entity.enums.TeacherTitle;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

/**
 * Created by Taras on 02.04.2017.
 */

@Entity
public class Teacher {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String secondName;

    @Column(nullable = false)
    private TeacherTitle teacherTitle;

    @Column(columnDefinition = "int default 500")
    private int hours;

    @JsonIgnore
    @LazyCollection(LazyCollectionOption.FALSE)
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "teacher_lesson", joinColumns = @JoinColumn(name = "teacherId"), inverseJoinColumns = @JoinColumn(name = "lessonId"))
    private List<Lesson> lessonList;

    @JsonIgnore
    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(mappedBy = "teachers")
    @Fetch(value = FetchMode.SUBSELECT)
    private List<Exam> examList;

    @JsonIgnore
    @LazyCollection(LazyCollectionOption.FALSE)
    @ManyToMany
    @JoinTable(name = "subject_teacher", joinColumns = @JoinColumn(name = "teacherId"), inverseJoinColumns = @JoinColumn(name = "subjectId"))
    private Set<Subject> subjects;

    public Teacher() {
    }

    public List<Lesson> getLessonList() {
        return lessonList;
    }

    public void setLessonList(List<Lesson> lessonList) {
        this.lessonList = lessonList;
    }

    public Teacher(String name, String secondName, TeacherTitle teacherTitle) {
        this.name = name;
        this.secondName = secondName;
        this.teacherTitle = teacherTitle;
    }

    public Teacher(String name, String secondName, TeacherTitle teacherTitle, int hours) {
        this.name = name;
        this.secondName = secondName;
        this.teacherTitle = teacherTitle;
        this.hours = hours;
    }

    public int getHours() {
        return hours;
    }

    public void setHours(int hours) {
        this.hours = hours;
    }

    public List<Exam> getExamList() {
        return examList;
    }

    public void setExamList(List<Exam> examList) {
        this.examList = examList;
    }

    public Set<Subject> getSubjects() {
        return subjects;
    }

    public void setSubjects(Set<Subject> subjects) {
        this.subjects = subjects;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSecondName() {
        return secondName;
    }

    public void setSecondName(String secondName) {
        this.secondName = secondName;
    }

    public TeacherTitle getTeacherTitle() {
        return teacherTitle;
    }

    public void setTeacherTitle(TeacherTitle teacherTitle) {
        this.teacherTitle = teacherTitle;
    }

    public String getSubjectString() {
        StringBuilder sb = new StringBuilder();
        for (Subject s : subjects) {
            sb.append(s.toString()).append(", ");
        }
        if (sb.length() > 1) {
            sb.delete(sb.length() - 2, sb.length());
        }
        return sb.toString();
    }

    @Override
    public String toString() {
        return teacherTitle.getTeacherTitleName() + " " + name + " " + secondName;
    }
}
