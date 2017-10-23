package ua.moskovych.taras.dao.implementation;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import ua.moskovych.taras.dao.GroupDao;
import ua.moskovych.taras.entity.Group;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

/**
 * Created by Taras on 02.04.2017.
 */

@Repository
public class GroupDaoImpl implements GroupDao {

    @PersistenceContext(unitName = "Main")
    private EntityManager entityManager;

    @Transactional
    public List<Group> findAll() {
        return entityManager.createQuery("SELECT G FROM Groups G order by name").getResultList();
    }

    @Transactional
    public String getName(Integer id) {
        Group group = entityManager.find(Group.class, id);
        return group.getName();
    }

    @Transactional
    public void add(Group group) {
        entityManager.persist(group);
    }

    @Transactional
    public Group findByName(String name) {
        return entityManager.find(Group.class, name);
    }

    @Transactional
    public Group findById(int id) {
        return entityManager.find(Group.class, id);
    }

    @Transactional
    public void delete(int id) {
        entityManager.remove(entityManager.find(Group.class, id));
    }

    @Transactional
    public void edit(Group group) {
        entityManager.merge(group);
    }
}
