package ua.moskovych.taras.dao.implementation;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import ua.moskovych.taras.dao.TeacherDao;
import ua.moskovych.taras.entity.Subject;
import ua.moskovych.taras.entity.Teacher;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

/**
 * Created by Taras on 02.04.2017.
 */

@Repository
public class TeacherDaoImpl implements TeacherDao {

    @PersistenceContext(unitName = "Main")
    private EntityManager entityManager;

    @Transactional
    public List<Teacher> findAll() {
        return entityManager.createQuery("SELECT t FROM Teacher t order by secondName").getResultList();
    }

    @Transactional
    public String getName(int id) {
        Teacher teacher = entityManager.find(Teacher.class, id);
        return teacher.getName();
    }

    @Transactional
    public void add(Teacher teacher) {
        entityManager.persist(teacher);
    }

    @Transactional
    public Teacher findByName(String name) {
        return entityManager.find(Teacher.class, name);
    }

    @Transactional
    public Teacher findById(int id) {
        return entityManager.find(Teacher.class, id);
    }

    @Transactional
    public void delete(int id) {
      entityManager.remove(entityManager.find(Teacher.class, id));
    }

    @Transactional
    public void edit(Teacher teacher) {
        entityManager.merge(teacher);
    }

    @Transactional
    public List<Teacher> findTeacherBySubjectId(int id) {
        Subject subjectObj = entityManager.find(Subject.class, id);
        List<Teacher> teacherList =  entityManager.createQuery("SELECT Teacher FROM Teacher t WHERE t.subject.id = :id").setParameter("id", subjectObj.getId()).getResultList();
        return teacherList;
    }
}
