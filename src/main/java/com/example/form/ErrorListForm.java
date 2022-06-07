package com.example.form;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class ErrorListForm {
	
	private int id;
	
	@NotNull
	private int categoryId;
	
	@NotBlank
	private String errorList;
	
	@NotBlank
	private String cause;
	
	@NotBlank
	private String solution;

}
