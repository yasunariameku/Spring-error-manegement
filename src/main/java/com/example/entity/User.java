package com.example.entity;

import java.io.Serializable;

import lombok.Data;

@Data
public class User implements Serializable{
	
	private int id;
	private String name;
	private String loginId;
	private String password;
	
	
}
