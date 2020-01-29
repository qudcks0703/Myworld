package com.jsp.db;

import java.sql.Timestamp;

public class Likes_DTO {

	private int num;
	private String id;			
	private int count;
	
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Likes_DTO() {
	}
}
