package com.jsp.db;

import java.sql.Timestamp;

public class Board_DTO {

	private int num;
	private String writer;			
	private String title;			
	private String content;	
	private String file;
	private Timestamp boardReg;
	private int readcount;	
	private String ip;
	private String r;
	private int likes;
	
	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public String getR() {
		return r;
	}

	public void setR(String r) {
		this.r = r;
	}

	public Board_DTO() {
	}
		
	public String getFile() {
		return file;
	}
	
	public void setFile(String file) {
		this.file = file;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getBoardReg() {
		return boardReg;
	}
	public void setBoardReg(Timestamp boardReg) {
		this.boardReg = boardReg;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
  }
