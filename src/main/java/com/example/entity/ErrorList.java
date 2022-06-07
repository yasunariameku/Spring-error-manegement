package com.example.entity;

import lombok.Data;

@Data
public class ErrorList {
	
	private int id;
	private int categoryId;
	private String errorList;
	private String cause;
	private String solution;
	
	private Category category;
	
	public void setCategoryId(int category_id) {
		if (this.category == null) {
			this.category = new Category();
		}
		category.setId(category_id);
	}
	
	public void setCategoryName(String categoryName) {
		if(this.category == null) {
			this.category = new Category();
		}
		category.setName(categoryName);
	}

}
