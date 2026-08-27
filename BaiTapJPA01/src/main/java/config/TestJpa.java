package config;

import java.util.List;

import entity.Category;
import jakarta.persistence.EntityManager;

public class TestJpa {

    public static void main(String[] args) {
        EntityManager em = JpaConfig.getEntityManager();
        try {
            List<Category> categories = em
                    .createNamedQuery("Category.findAll", Category.class)
                    .getResultList();

            System.out.println("Kết nối JPA thành công. Số Category: " + categories.size());
            for (Category c : categories) {
                System.out.println(c);
            }
        } finally {
            em.close();
            JpaConfig.shutdown();
        }
    }
}
