package ua.moskovych.taras.services.implementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.moskovych.taras.dao.ClassroomDao;
import ua.moskovych.taras.entity.Classroom;
import ua.moskovych.taras.entity.enums.ClassroomType;
import ua.moskovych.taras.services.ClassroomService;

import java.util.List;

/**
 * Created by Taras on 02.04.2017.
 */

@Service
public class ClassroomServiceImpl implements ClassroomService {

    @Autowired
    private ClassroomDao classroomDao;

    public List<Classroom> findAll() {
        return classroomDao.findAll();
    }

    public void add(Classroom classroom) {
        classroomDao.add(classroom);
    }

    public void delete(int id) {
        classroomDao.delete(id);
    }

    public void edit(int id, String building, String room, ClassroomType classroomType) {
        Classroom classroom = classroomDao.findById(id);
        if(building!= null && !building.equalsIgnoreCase("")){
            classroom.setBuilding(building);
        }
        if(room!= null && !room.equalsIgnoreCase("")){
            classroom.setRoom(room);
        }
        classroom.setClassroomType(classroomType);
        classroomDao.edit(classroom);
    }

    public void edit(Classroom classroom) {
        Classroom classroomTemp = classroomDao.findById(classroom.getId());
        classroomTemp.setBuilding(classroom.getBuilding());
        classroomTemp.setRoom(classroom.getRoom());
        classroomTemp.setClassroomType(classroom.getClassroomType());
        classroomDao.edit(classroomTemp);
    }

    public List<Classroom> findByType(ClassroomType classroomType) {
        return classroomDao.findByType(classroomType);
    }
}
