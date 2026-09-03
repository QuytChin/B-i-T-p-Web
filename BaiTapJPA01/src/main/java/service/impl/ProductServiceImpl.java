package service.impl;

import java.util.List;

import dao.ProductDao;
import dao.impl.ProductDaoImpl;
import entity.Product;
import service.ProductService;

public class ProductServiceImpl
        implements ProductService {

    private final ProductDao productDao =
            new ProductDaoImpl();

    @Override
    public void insert(Product product) {
        productDao.insert(product);
    }

    @Override
    public void update(Product product) {
        productDao.update(product);
    }

    @Override
    public void delete(int id) {
        productDao.delete(id);
    }

    @Override
    public Product get(int id) {
        return productDao.get(id);
    }

    @Override
    public List<Product> getAll() {
        return productDao.getAll();
    }

    @Override
    public List<Product> getLatest(int limit) {
        return productDao.getLatest(limit);
    }

    @Override
    public List<Product> getPage(
            int page,
            int pageSize) {

        return productDao.getPage(
                page,
                pageSize);
    }

    @Override
    public int count() {
        return (int) productDao.count();
    }
}