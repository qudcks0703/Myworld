package com.jsp.db;

import java.sql.Timestamp;

public class Member_DTO {

	private String id;
	private String pw;
	private String name;
	private String rrn1;
	private String rrn2;
	private String email;
	private String phone1;
	private String phone2;
	private String phone3;
	
	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public Member_DTO() {
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getRrn1() {
		return rrn1;
	}

	public void setRrn1(String rrn1) {
		this.rrn1 = rrn1;
	}

	public String getRrn2() {
		return rrn2;
	}

	public void setRrn2(String rrn2) {
		this.rrn2 = rrn2;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
