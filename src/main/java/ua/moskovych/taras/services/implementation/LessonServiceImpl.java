package ua.moskovych.taras.services.implementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.moskovych.taras.dao.GroupDao;
import ua.moskovych.taras.dao.LessonDao;
import ua.moskovych.taras.dao.TeacherDao;
import ua.moskovych.taras.entity.*;
import ua.moskovych.taras.entity.enums.*;
import ua.moskovych.taras.services.ClassroomService;
import ua.moskovych.taras.services.LessonService;
import ua.moskovych.taras.services.SubjectService;

import java.util.*;

/**
 * Created by Taras on 02.04.2017.
 */

@Service
public class LessonServiceImpl implements LessonService {

    @Autowired
    private LessonDao lessonDao;
    @Autowired
    private GroupDao groupDao;
    @Autowired
    private TeacherDao teacherDao;
    @Autowired
    private ClassroomService classroomService;
    @Autowired
    private SubjectService subjectService;

    public List<Lesson> findAll() {
        return lessonDao.findAll();
    }

    public void add(Lesson lesson) {
        if(lesson.getClassrooms() == null || lesson.getGroups().isEmpty() || lesson.getSubjects() == null || lesson.getTeachers().isEmpty()) return;
        else lessonDao.add(lesson);
    }

    public List<Lesson> findByGroupId(int id) {
        List<Lesson> lessons = groupDao.findById(id).getLessonList();
        return lessons;
    }

    public List<Lesson> findByTeacherId(int id) {
        List<Lesson> lessons = teacherDao.findById(id).getLessonList();
        return lessons;
    }

    public void delete(int id) {
        lessonDao.delete(id);
    }

    public void generate(List<Group> inputGroupList, List<Subject> inputSubjectList) {

        int i = 0;
        while(i < inputGroupList.size()){
            generation(inputSubjectList, inputGroupList.get(i));
            i++;
        }

    }

    public void generation(List<Subject> inputSubjectList, Group group){
        Random r = new Random();

        int hoursP = 0;
        try{
            hoursP = group.getProgram().getHours();
        }catch (Exception e){};
        int rJ = r.nextInt(5);
        int rI = r.nextInt(5);
        int c = 0;
        int l = 0;
        int hours = 0;

        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 5; j++) {
                if(j == rJ && i == rI){
                    i = 100;
                    j = 100;
                   continue;
                }

                if (!(inputSubjectList.isEmpty())) {
                    Subject subject = inputSubjectList.get(r.nextInt(inputSubjectList.size()));
                    while (!(checkForFreeSubject(subject, getDay(j), getLessonTime(i)))){
                        subject = inputSubjectList.get(r.nextInt(inputSubjectList.size()));
                    }
                    try {
                        Lesson lesson = new Lesson();
                        List<Subject> tempSubjectList = new ArrayList<Subject>();
                        List<Teacher> tempTeacherList = new ArrayList<Teacher>();

                        lesson.setLessonTime(getLessonTime(i));
                        lesson.setDayOfWeek(getDay(j));

                        if(subject.getHours() == 100){
                            Classroom classroom = getClassroom(ClassroomType.LABORATORY);
                            while (!(checkForClassroom(classroom, getDay(j), getLessonTime(i)))){
                                classroom = getClassroom(ClassroomType.LABORATORY);
                                System.out.println("Classroom " + classroom);
                            }
                            lesson.setClassrooms(classroom);
                        }
                        else{
                            Classroom classroom = getClassroom(ClassroomType.LECTURE);
                            while (!(checkForClassroom(classroom, getDay(j), getLessonTime(i)))){
                                classroom = getClassroom(ClassroomType.LECTURE);
                            }
                            lesson.setClassrooms(classroom);
                        }

                        lesson.setGroups(getGroups(group));
                        lesson.setSubjects(subject);

                        tempTeacherList.add(subject.getTeachers().get(r.nextInt(subject.getTeachers().size())));
                        lesson.setTeachers(tempTeacherList);

                        if (subject.getHours() == 80) {
                            Random r2 = new Random();
                            lesson.setLessonMode(getLessonMode(r2.nextInt(2)));
                            lesson.setLessonType(LessonType.PRACTICE);
                            hours += 80;
                            deleteSubjectFromList(inputSubjectList, subject);

                        } else if (subject.getHours() == 100) {
                            Random r2 = new Random();
                            lesson.setLessonMode(getLessonMode(r2.nextInt(2)));
                            lesson.setLessonType(LessonType.LABORATORY);
                            hours += 100;
                            l+=1;
                            if(l == 2) deleteSubjectFromList(inputSubjectList, subject);

                        } else if (subject.getHours() == 160) {
                            lesson.setLessonMode(LessonMode.NORMAL);
                            lesson.setLessonType(LessonType.LECTURE);
                            hours += 160;
                            deleteSubjectFromList(inputSubjectList, subject);
                        }
                        else if (subject.getHours() == 200) {
                            lesson.setLessonMode(LessonMode.NORMAL);
                            lesson.setLessonType(LessonType.LECTURE);
                            hours += 200;
                            c += 1;
                            if(c == 2) deleteSubjectFromList(inputSubjectList, subject);
                        }

                        if(hours <= hoursP) {
                            lessonDao.add(lesson);
                        }
                        else break;
                    } catch (Exception e) {}
                }
            }
        }
    }

    private boolean checkForClassroom(Classroom classroom, Day day, LessonTime lessonTime){
        boolean b = true;
        List<Group> groupList = groupDao.findAll();
        List<Lesson> lessonList = new ArrayList<Lesson>();
        for (Group group : groupList) {
            lessonList = group.getLessonList();
            for (Lesson lesson : lessonList) {
                if(lesson.getClassrooms() == classroom && lesson.getDay() == day && lesson.getLessonTime() == lessonTime) b = false;
            }
        }
        return b;
    }

    private boolean checkForFreeSubject(Subject subject, Day day, LessonTime lessonTime){
        boolean b = true;
        List<Group> groupList = groupDao.findAll();
        List<Lesson> lessonList = new ArrayList<Lesson>();
        for (Group group : groupList) {
            lessonList = group.getLessonList();
            for (Lesson lesson : lessonList) {
                if(lesson.getSubjects() == subject && lesson.getDay() == day && lesson.getLessonTime() == lessonTime) b = false;
            }
        }
        return b;
    }


    private void deleteSubjectFromList(List<Subject> subjects, Subject subject) {
        Iterator<Subject> iterator = subjects.iterator();
        while (iterator.hasNext()) {
            Subject subjectTemp = iterator.next();
            if (subjectTemp == subject) {
                iterator.remove();
            }
        }
    }

    private LessonMode getLessonMode(int index) {
        if (index == 0) return LessonMode.DENOMINATOR;
        if (index == 1) return LessonMode.NUMERATOR;
        else return LessonMode.NORMAL;
    }

    public LessonTime getLessonTime(int index) {
        if (index == 0) return LessonTime.FIRST;
        if (index == 1) return LessonTime.SECOND;
        if (index == 2) return LessonTime.THIRD;
        if (index == 3) return LessonTime.FOURTH;
        if (index == 4) return LessonTime.FIFTH;
        else return null;
    }

    private Day getDay(int index) {
        if (index == 0) return Day.MONDAY;
        if (index == 1) return Day.TUESDAY;
        if (index == 2) return Day.WEDNESDAY;
        if (index == 3) return Day.THURSDAY;
        if (index == 4) return Day.FRIDAY;
        else return null;
    }

    private List<Group> getGroups(Group group) {
        List<Group> groupList = new ArrayList<Group>();
        groupList.add(group);
        return groupList;
    }

    public Classroom getClassroom(ClassroomType classroomType) {
        List<Classroom> classroomList = classroomService.findByType(classroomType);
        Random r = new Random();
        Classroom classroom = classroomList.get(r.nextInt(classroomList.size()));
        return classroom;
    }

    public boolean checkForFreeLesson(Lesson lesson) {
        Group group = lesson.getGroups().get(0);
        List<Lesson> lessonList = group.getLessonList();
        for (Lesson temp : lessonList) {
            if(temp.getLessonTime() == lesson.getLessonTime() && temp.getDay() == lesson.getDay()) return false;
        }
        return true;
    }
}
