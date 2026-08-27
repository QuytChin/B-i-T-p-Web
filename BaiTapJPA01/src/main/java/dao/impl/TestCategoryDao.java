package dao.impl;

import java.util.List;

import dao.CategoryDao;
import entity.Category;

public class TestCategoryDao {

	public static void main(String[] args) {

	    CategoryDao dao =
	            new CategoryDaoImpl();

	    List<Category> list =
	            dao.search("Điện");

	    for (Category category : list) {

	        System.out.println(
	                category.getId()
	                + " - "
	                + category.getName());
	    }
	}
}