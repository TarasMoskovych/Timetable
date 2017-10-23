package ua.moskovych.taras.Formatters;

import ua.moskovych.taras.entity.Group;
import ua.moskovych.taras.entity.Subject;

import java.util.List;

/**
 * Created by Taras on 03.05.2017.
 */
public class GroupSubjectSearchFormSet {

    private List<Group> groups;
    private List<Subject> subjects;

    public GroupSubjectSearchFormSet() {
    }

    public GroupSubjectSearchFormSet(List<Group> groups, List<Subject> subjects) {
        this.groups = groups;
        this.subjects = subjects;
    }

    public List<Group> getGroups() {
        return groups;
    }

    public void setGroups(List<Group> groups) {
        this.groups = groups;
    }

    public List<Subject> getSubjects() {
        return subjects;
    }

    public void setSubjects(List<Subject> subjects) {
        this.subjects = subjects;
    }
}
