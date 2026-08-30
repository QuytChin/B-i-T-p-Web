package service;

import java.util.List;

import entity.Product;

public interface ProductService {
    void insert(Product product);
    void update(Product product);
    void delete(int id);
    Product get(int id);
    List<Product> getAll();
    List<Product> getLatest(int limit);
    List<Product> getPage(int page, int pageSize);
    long count();
}
