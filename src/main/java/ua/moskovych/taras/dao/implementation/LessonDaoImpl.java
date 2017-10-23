package ua.moskovych.taras.dao.implementation;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import ua.moskovych.taras.dao.LessonDao;
import ua.moskovych.taras.entity.Lesson;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

/**
 * Created by Taras on 02.04.2017.
 */

@Repository
public class LessonDaoImpl implements LessonDao {

    @PersistenceContext(unitName = "Main")
    private EntityManager entityManager;

    @Transactional
    public List<Lesson> findAll() {
        return entityManager.createQuery("SELECT l FROM Lesson l").getResultList();
    }

    @Transactional
    public void add(Lesson lesson) {
        entityManager.persist(lesson);
    }

    @Transactional
    public void delete(int id) {
        entityManager.remove(entityManager.find(Lesson.class, id));
    }
}
