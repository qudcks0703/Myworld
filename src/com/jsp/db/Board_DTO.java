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
	private int ref;	
	private int re_step;
	private int re_level;
	private String r;
	private int likes;
	private int commen_num;
	private Timestamp commen_reg;
	
	
	public Timestamp getCommen_reg() {
		return commen_reg;
	}
	public void setCommen_reg(Timestamp commen_reg) {
		this.commen_reg = commen_reg;
	}
	public int getCommen_num() {
		return commen_num;
	}
	public void setCommen_num(int commen_num) {
		this.commen_num = commen_num;
	}
	private String commen;
	
	
	
	public String getCommen() {
		return commen;
	}
	public void setCommen(String commen) {
		this.commen = commen;
	}
		
	
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
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}	
}
