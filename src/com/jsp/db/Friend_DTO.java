package com.jsp.db;

import java.sql.Timestamp;

public class Friend_DTO {

	private String id;
	private String friend_id;
	private int my_num;
	private int friend_num;
	
	public Friend_DTO() {
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFriend_id() {
		return friend_id;
	}

	public void setFriend_id(String friend_id) {
		this.friend_id = friend_id;
	}

	public int getMy_num() {
		return my_num;
	}

	public void setMy_num(int my_num) {
		this.my_num = my_num;
	}

	public int getFriend_num() {
		return friend_num;
	}

	public void setFriend_num(int friend_num) {
		this.friend_num = friend_num;
	}
	
	
	
}
