package ua.moskovych.taras.services.implementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.moskovych.taras.dao.TeacherDao;
import ua.moskovych.taras.entity.Teacher;
import ua.moskovych.taras.entity.enums.TeacherTitle;
import ua.moskovych.taras.services.TeacherService;

import java.util.List;

/**
 * Created by Taras on 02.04.2017.
 */

@Service
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    private TeacherDao teacherDao;

    public List<Teacher> findAll() {
        return teacherDao.findAll();
    }

    public String getName(int id) {
        return teacherDao.getName(id);
    }

    public void add(Teacher teacher) {
        teacherDao.add(teacher);
    }

    public Teacher findByName(String name) {
        return teacherDao.findByName(name);
    }

    public Teacher findById(int id) {
        return teacherDao.findById(id);
    }

    public void delete(int id) {
        teacherDao.delete(id);
    }

    public void add(String name, String secondName, TeacherTitle teacherTitle) {
        teacherDao.add(new Teacher(name, secondName, teacherTitle));
    }

    public void edit(int id, String name, String secondName, TeacherTitle teacherTitle) {
        Teacher teacher = teacherDao.findById(id);
        if(name!= null && !name.equalsIgnoreCase("")){
            teacher.setName(name);
        }
        if(secondName!= null && !secondName.equalsIgnoreCase("")){
            teacher.setSecondName(secondName);
        }

        teacher.setTeacherTitle(teacherTitle);

        teacherDao.edit(teacher);
    }

    public void edit(int id, String name, String secondName, TeacherTitle teacherTitle, int hours) {
        Teacher teacher = teacherDao.findById(id);
        if(name!= null && !name.equalsIgnoreCase("")){
            teacher.setName(name);
        }
        if(secondName!= null && !secondName.equalsIgnoreCase("")){
            teacher.setSecondName(secondName);
        }

        teacher.setTeacherTitle(teacherTitle);
        if(hours >= 0) teacher.setHours(hours);

        teacherDao.edit(teacher);
    }

    public List<Teacher> findTeacherBySubjectId(int id) {
        return teacherDao.findTeacherBySubjectId(id);
    }

//    public void addSubject(int id, Subject subject) {
//        Teacher teacher = teacherDao.findById(id);
//        teacher.setSubject(subject);
//        teacherDao.edit(teacher);
//    }
}
