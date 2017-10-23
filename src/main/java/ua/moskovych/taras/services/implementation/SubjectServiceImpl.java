package ua.moskovych.taras.services.implementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.moskovych.taras.dao.SubjectDao;
import ua.moskovych.taras.entity.Subject;
import ua.moskovych.taras.entity.Teacher;
import ua.moskovych.taras.services.SubjectService;

import java.util.List;

/**
 * Created by Taras on 02.04.2017.
 */

@Service
public class SubjectServiceImpl implements SubjectService {

    @Autowired
    private SubjectDao subjectDao;

    public List<Subject> findAll() {
        return subjectDao.findAll();
    }

    public void add(Subject subject) {
        subjectDao.add(subject);
    }

    public void delete(int id) {
        subjectDao.delete(id);
    }

    public void add(String name, int hours) {
        subjectDao.add(new Subject(name, hours));
    }

    public void edit(int id, String name, int hours) {
        Subject subject = subjectDao.findById(id);
        if(name!= null && !name.equalsIgnoreCase("")){
            subject.setName(name);
        }
        if(hours >= 0){
            subject.setHours(hours);
        }

        subjectDao.edit(subject);
    }

    public Subject findById(int id) {
        return subjectDao.findById(id);
    }

    public void addToSubjectNewTeacher(int id, Teacher teacher) {
        Subject subject = subjectDao.findById(id);
        List<Teacher> tempList = subject.getTeachers();
        tempList.add(teacher);
        subjectDao.edit(subject);
    }

    public void removeTeachers(int id) {
        Subject subject = subjectDao.findById(id);
        subject.getTeachers().clear();
        subjectDao.edit(subject);
    }

    public void edit(Subject subject) {
        Subject tempSubject = subjectDao.findById(subject.getId());
        tempSubject.setName(subject.getName());
        tempSubject.setHours(subject.getHours());
        subjectDao.edit(tempSubject);
    }
}
