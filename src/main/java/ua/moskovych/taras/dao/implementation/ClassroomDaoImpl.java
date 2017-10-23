package ua.moskovych.taras.dao.implementation;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import ua.moskovych.taras.dao.ClassroomDao;
import ua.moskovych.taras.entity.Classroom;
import ua.moskovych.taras.entity.enums.ClassroomType;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

/**
 * Created by Taras on 02.04.2017.
 */

@Repository
public class ClassroomDaoImpl  implements ClassroomDao{

    @PersistenceContext(unitName = "Main")
    private EntityManager entityManager;

    @Transactional
    public List<Classroom> findAll() {
        return entityManager.createQuery("SELECT C FROM Classroom C order by building").getResultList();
    }

    @Transactional
    public void add(Classroom classroom) {
        entityManager.persist(classroom);
    }

    @Transactional
    public Classroom findById(int id) {
        return entityManager.find(Classroom.class, id);
    }

    @Transactional
    public void delete(int id) {
        entityManager.remove(entityManager.find(Classroom.class, id));
    }

    @Transactional
    public void edit(Classroom classroom) {
        entityManager.merge(classroom);
    }

    @Transactional
    public List<Classroom> findByType(ClassroomType classroomType) {
        return entityManager.createQuery("SELECT L FROM Classroom L WHERE L.classroomType = :classroomType ").setParameter("classroomType", classroomType).getResultList();
    }
}
