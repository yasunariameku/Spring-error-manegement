package com.example.entity;

import lombok.Data;

@Data
public class ErrorList {
	
	private int id;
	private int category_Id;
	private String errorList;
	private String cause;
	private String solution;
	
	private Category category;
	
	public void setCategory_Id(int category_id) {
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
