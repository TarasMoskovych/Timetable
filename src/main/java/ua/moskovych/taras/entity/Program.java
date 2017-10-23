package ua.moskovych.taras.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.util.List;

/**
 * Created by Taras on 13.05.2017.
 */

@Entity
public class Program {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;

    @Column
    private String name;

    @Column
    private int hours;

    @JsonIgnore
    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(mappedBy = "program", cascade = {CascadeType.ALL})
    private List<Group> groupList;

    public Program() {
    }

    public Program(String name, int hours) {
        this.name = name;
        this.hours = hours;
    }

    public Program(String name, int hours, List<Group> groupList) {
        this.name = name;
        this.hours = hours;
        this.groupList = groupList;
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

    public int getHours() {
        return hours;
    }

    public void setHours(int hours) {
        this.hours = hours;
    }

    public List<Group> getGroupList() {
        return groupList;
    }

    public void setGroupList(List<Group> groupList) {
        this.groupList = groupList;
    }

    public String getGroupsString() {
        StringBuilder sb = new StringBuilder();
        for (Group t : groupList) {
            sb.append(t.toString()).append(", ");
        }
        if (sb.length() > 1) {
            sb.delete(sb.length() - 2, sb.length());
        }
        return sb.toString();
    }

    @Override
    public String toString() {
        return name + " " + hours;
    }
}
