package ua.moskovych.taras.Formatters;

import ua.moskovych.taras.entity.Group;

/**
 * Created by Taras on 02.04.2017.
 */
public class GroupSearchForm {

    private Group group;

    public GroupSearchForm() {

    }

    public GroupSearchForm(Group group) {
        this.group = group;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }
}
