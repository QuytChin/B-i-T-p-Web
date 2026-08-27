package dao.impl;

import java.util.List;

import config.JpaConfig;
import dao.UserDao;
import entity.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

public class UserDaoImpl implements UserDao {

    @Override
    public void insert(User user) {
        EntityManager em = JpaConfig.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(user);
            trans.commit();
        } catch (RuntimeException e) {
            if (trans.isActive()) trans.rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    @Override
    public User get(String username) {
        if (username == null || username.isBlank()) return null;

        EntityManager em = JpaConfig.getEntityManager();
        try {
            TypedQuery<User> query = em.createQuery(
                    "SELECT u FROM AppUser u WHERE u.username = :username", User.class);
            query.setParameter("username", username);
            List<User> result = query.setMaxResults(1).getResultList();
            return result.isEmpty() ? null : result.get(0);
        } finally {
            em.close();
        }
    }

    @Override
    public boolean checkExistEmail(String email) {
        return existsByField("email", email);
    }

    @Override
    public boolean checkExistUsername(String username) {
        return existsByField("username", username);
    }

    @Override
    public boolean checkExistPhone(String phone) {
        return existsByField("phone", phone);
    }

    private boolean existsByField(String field, String value) {
        if (value == null || value.isBlank()) return false;

        EntityManager em = JpaConfig.getEntityManager();
        try {
            Long count = em.createQuery(
                    "SELECT COUNT(u) FROM AppUser u WHERE u." + field + " = :value", Long.class)
                    .setParameter("value", value)
                    .getSingleResult();
            return count > 0;
        } finally {
            em.close();
        }
    }
}
