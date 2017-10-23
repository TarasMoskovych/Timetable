package ua.moskovych.taras.Formatters;

import ua.moskovych.taras.entity.Group;

import java.util.List;

/**
 * Created by Taras on 15.05.2017.
 */
public class GroupSearchFormList {

    private List<Group> groupList;

    public GroupSearchFormList() {
    }

    public GroupSearchFormList(List<Group> groupList) {
        this.groupList = groupList;
    }

    public List<Group> getGroupList() {
        return groupList;
    }

    public void setGroupList(List<Group> groupList) {
        this.groupList = groupList;
    }
}
