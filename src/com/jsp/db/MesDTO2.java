package com.jsp.db;

import java.sql.Timestamp;

public class MesDTO2 {

	private String mes;
	private String id;
	private String friend;
	private Timestamp reg;
	
	
	
	
	public Timestamp getReg() {
		return reg;
	}
	public void setReg(Timestamp reg) {
		this.reg = reg;
	}
	public String getMes() {
		return mes;
	}
	public void setMes(String mes) {
		this.mes = mes;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFriend() {
		return friend;
	}
	public void setFriend(String friend) {
		this.friend = friend;
	}

	
}
