package config;

import java.util.List;

import entity.Category;
import entity.Product;
import jakarta.persistence.EntityManager;

public class TestJpa {

    public static void main(String[] args) {
        EntityManager em = JpaConfig.getEntityManager();
        try {
            List<Category> categories = em
                    .createNamedQuery("Category.findAll", Category.class)
                    .getResultList();

            List<Product> products = em
                    .createNamedQuery("Product.findAll", Product.class)
                    .getResultList();

            System.out.println("Kết nối JPA thành công.");
            System.out.println("Số Category: " + categories.size());
            System.out.println("Số Product: " + products.size());

            for (Category c : categories) {
                System.out.println("CATEGORY: " + c);
            }
            for (Product p : products) {
                System.out.println("PRODUCT: " + p.getId() + " | " + p.getName()
                        + " | " + p.getPrice() + " | " + p.getCategory().getName());
            }
        } finally {
            em.close();
            JpaConfig.shutdown();
        }
    }
}
