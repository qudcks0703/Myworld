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
		
	
		//메세지 입력
	public int insertArticle(String id,String friend,String mes) {
		try {
			conn =ds.getConnection();
			String sql ="insert into mes values(?,?,?,0,sysdate)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, friend);
			pstmt.setString(3, mes);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, rs);
		}
		return -1;
	
	}
	
	//메세지 갯수
	public int mes_count(String id,String friend) {
		try {
			conn =ds.getConnection();
			String sql ="select count(*) from mes where (id=? and friend=?) or (friend=? and id=?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, friend);
			pstmt.setString(3, id);
			pstmt.setString(4, friend);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt("count(*)");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, rs);
		}
		return 0;
	}
	
	//메세지 가져오기
	public List selectmes(String id,String friend) {
		List list=new ArrayList();
		try {
			conn =ds.getConnection();
			String sql ="select * from mes where (id=? and friend =?) or (friend=? and id =?) order by reg";
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
				mdto.setReg(rs.getTimestamp("reg"));
				list.add(mdto); 
			}
		}catch(Exception e) {
			e.printStackTrace(); 
		}finally {
			close(conn, pstmt, rs);
		}
		return list;
	}
	
	public MesDTO2 selectmes_max(String id,String friend) {
		try {
			conn =ds.getConnection();
			String sql ="select * from mes where (id=? and friend =?) or (friend=? and id =?) and reg=(select max(reg) from mes)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, friend);
			pstmt.setString(3, id);
			pstmt.setString(4, friend);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				mdto=new MesDTO2();
				mdto.setId(rs.getString(1));
				mdto.setFriend(rs.getString(2));
				mdto.setMes(rs.getString("mes"));
				mdto.setReg(rs.getTimestamp("reg"));
			}
		}catch(Exception e) {
			e.printStackTrace(); 
		}finally {
			close(conn, pstmt, rs);
		}
		return mdto;
	}
	
	//모든 메세지 삭제
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
	
	// 메세지 도착현황 see=0(=아직 안본상태)
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
	
	//메세지 확인시 see=1로 변경 봄
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
	//메세지 갯수확인
	public int count_mes(String id,String friend) {
		try {
			conn =ds.getConnection();
			String sql ="select count(*) from mes where id=? and friend=? and see=0";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, friend);
			pstmt.setString(2, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt("count(*)");
			}
		}catch(Exception e) {
			e.printStackTrace(); 
		}finally {
			close(conn, pstmt, rs);
		}
		return 0;
		
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
