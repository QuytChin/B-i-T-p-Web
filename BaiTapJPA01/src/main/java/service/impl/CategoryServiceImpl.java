package service.impl;

import java.util.List;

import dao.CategoryDao;
import dao.impl.CategoryDaoImpl;
import entity.Category;
import service.CategoryService;

public class CategoryServiceImpl
        implements CategoryService {

    private CategoryDao categoryDao =
            new CategoryDaoImpl();

    // ==========================
    // INSERT
    // ==========================

    @Override
    public void insert(Category category) {

        categoryDao.insert(category);
    }

    // ==========================
    // EDIT
    // ==========================

    @Override
    public void edit(Category newCategory) {

        Category oldCategory =
                categoryDao.get(
                        newCategory.getId());

        if (oldCategory == null) {
            return;
        }

        oldCategory.setName(
                newCategory.getName());

        // Nếu có icon mới
        if (newCategory.getIcon() != null
                && !newCategory.getIcon().isBlank()) {

            oldCategory.setIcon(
                    newCategory.getIcon());
        }

        categoryDao.edit(oldCategory);
    }

    // ==========================
    // DELETE
    // ==========================

    @Override
    public void delete(int id) {

        categoryDao.delete(id);
    }

    // ==========================
    // GET ID
    // ==========================

    @Override
    public Category get(int id) {

        return categoryDao.get(id);
    }

    // ==========================
    // GET NAME
    // ==========================

    @Override
    public Category get(String name) {

        return categoryDao.get(name);
    }

    // ==========================
    // GET ALL
    // ==========================

    @Override
    public List<Category> getAll() {

        return categoryDao.getAll();
    }

    // ==========================
    // SEARCH
    // ==========================

    @Override
    public List<Category> search(
            String keyword) {

        return categoryDao.search(keyword);
    }
}