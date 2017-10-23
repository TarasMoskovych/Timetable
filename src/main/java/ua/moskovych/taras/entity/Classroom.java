package ua.moskovych.taras.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import ua.moskovych.taras.entity.enums.ClassroomType;

import javax.persistence.*;
import java.util.List;

/**
 * Created by Taras on 02.04.2017.
 */

@Entity
public class Classroom {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Column(nullable = false)
    private String building;

    @Column(nullable = false, unique = true)
    private String room;

    @Column
    private ClassroomType classroomType;

    @JsonIgnore
    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(mappedBy = "classrooms")
    private List<Lesson> lessonList;

    @JsonIgnore
    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(mappedBy = "classrooms")
    private List<Exam> examList;


    public Classroom() {
    }

    public Classroom(String building, String room) {
        this.building = building;
        this.room = room;
    }

    public List<Exam> getExamList() {
        return examList;
    }

    public void setExamList(List<Exam> examList) {
        this.examList = examList;
    }

    public Classroom(String building, String room, ClassroomType classroomType) {
        this.building = building;
        this.room = room;
        this.classroomType = classroomType;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBuilding() {
        return building;
    }

    public void setBuilding(String building) {
        this.building = building;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public List<Lesson> getLessonList() {
        return lessonList;
    }

    public void setLessonList(List<Lesson> lessonList) {
        this.lessonList = lessonList;
    }

    public ClassroomType getClassroomType() {
        return classroomType;
    }

    public void setClassroomType(ClassroomType classroomType) {
        this.classroomType = classroomType;
    }

    @Override
    public String toString() {
        return building + "/ " + room;
    }
}
