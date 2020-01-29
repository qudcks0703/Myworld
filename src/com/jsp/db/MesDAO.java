package com.jsp.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MesDAO {
	
		private static MesDAO mdao=new MesDAO(); 
		ResultSet rs;
		PreparedStatement pstmt;
		Connection conn;
		DataSource ds;
		Board_DTO bdto;
		MesDTO2 mdto;
		
		//생성자에서 인터넷연결 시도
		private	MesDAO() {
			try {
				Context ctx=new InitialContext();
				ds=(DataSource)ctx.lookup("java:comp/env/jdbc/orcl");
			}catch(Exception e) {
				System.out.println("생성 실패");
				e.printStackTrace();
			}
		}
		// private 싱글톤 객체 가져오기
		public static MesDAO getInstance() {
			return mdao;
		}
		
	
	public void insertArticle(String id,String friend,String mes) {
		try {
			conn =ds.getConnection();
			String sql ="insert into mes values(?,?,?,0)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, friend);
			pstmt.setString(3, mes);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, rs);
		}
	
	}
	
	public List selectmes(String id,String friend) {
		List list=new ArrayList();
		try {
			conn =ds.getConnection();
			String sql ="select * from mes where (id=? and friend =?) or (friend=? and id =?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, friend);
			pstmt.setString(3, id);
			pstmt.setString(4, friend);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				mdto=new MesDTO2();
				mdto.setId(rs.getString(1));
				mdto.setFriend(rs.getString(2));
				mdto.setMes(rs.getString("mes"));
				list.add(mdto);
			}
		}catch(Exception e) {
			e.printStackTrace(); 
		}finally {
			close(conn, pstmt, rs);
		}
		return list;
		
	}
	public void deletemes(String id,String friend) {
		try {
			conn =ds.getConnection();
			String sql ="delete from mes where (id=? and friend =?) or (friend=? and id =?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, friend);
			pstmt.setString(3, id);
			pstmt.setString(4, friend);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace(); 
		}finally {
			close(conn, pstmt, rs);
		}
		
	}
	public String check(String id) {
		List list=new ArrayList();
		String friend="";
		try {
			conn =ds.getConnection();
			String sql ="select * from mes where friend=? and see=0";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				friend=rs.getString("id");
			}
		}catch(Exception e) {
			e.printStackTrace(); 
		}finally {
			close(conn, pstmt, rs);
		}
		return friend;
		
	}
	public void check_ok(String id,String friend) {
		try {
			conn =ds.getConnection();
			String sql ="update mes set see=1 where friend=? and id=? and see=0";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, friend);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace(); 
		}finally {
			close(conn, pstmt, rs);
		}
		
	}
	
	
	//전체 닫기
	public void close(Connection conn,PreparedStatement pstmt,ResultSet rs) {
		
		if(rs!=null) {
			try {
				rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		if(pstmt!=null) {
			try {
				pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		if(conn!=null) {
			try {
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	
}
