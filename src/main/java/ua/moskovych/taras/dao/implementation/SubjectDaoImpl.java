package ua.moskovych.taras.dao.implementation;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import ua.moskovych.taras.dao.SubjectDao;
import ua.moskovych.taras.entity.Subject;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

/**
 * Created by Taras on 02.04.2017.
 */

@Repository
public class SubjectDaoImpl implements SubjectDao{

    @PersistenceContext(unitName = "Main")
    private EntityManager entityManager;

    @Transactional
    public List<Subject> findAll() {
        return entityManager.createQuery("SELECT s FROM Subject s order by name").getResultList();
    }

    @Transactional
    public void add(Subject subject) {
        entityManager.persist(subject);
    }

    @Transactional
    public Subject findById(int id) {
        return entityManager.find(Subject.class, id);
    }

    @Transactional
    public void delete(int id) {
       entityManager.remove(entityManager.find(Subject.class, id));
    }

    @Transactional
    public void edit(Subject subject) {
        entityManager.merge(subject);
    }

    @Transactional

    public void addToSubjectNewTeacher(Subject subject) {
        entityManager.merge(subject);
    }
}
