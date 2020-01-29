package com.jsp.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Member_DAO {

	
	private static Member_DAO mdao=new Member_DAO(); 
	ResultSet rs;
	PreparedStatement pstmt;
	Connection conn;
	DataSource ds;
	Member_DTO mdto;
	
		//생성자에서 인터넷연결 시도
		private Member_DAO() {
			try {
				Context ctx=new InitialContext();
				ds=(DataSource)ctx.lookup("java:comp/env/jdbc/orcl");
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("생성 실패");
			}
		}
		// private 싱글톤 객체 가져오기
		public static Member_DAO getInstance() {
			return mdao;
		}
		
		//로그인 기능
		public int login(String id,String pw) {
			
			try {
				conn=ds.getConnection();
				String sql="select pw from member where id=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					if(rs.getString("pw").equals(pw)) {
						return 1;  //로그인 성공
					}else {
						return 0;
					}
				}
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("로그인 실패");
			}finally {
				close(conn, pstmt, rs);
			}
			return -1; //아이디가 없어 로그인 실패
		}
		
		//회원가입
		public int siunup(Member_DTO mdto) {
			try {
				conn=ds.getConnection();
				String sql="insert into member values(?,?,?,?,?,?)";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, mdto.getId());
				pstmt.setString(2, mdto.getPw());
				pstmt.setString(3, mdto.getName());
				pstmt.setString(4, mdto.getRrn1()+"-"+mdto.getRrn2());
				pstmt.setString(5, mdto.getEmail());
				pstmt.setString(6, mdto.getPhone1()+"-"+mdto.getPhone2()+"-"+mdto.getPhone3());
				return pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("가입 실패");
			}finally {
				close(conn, pstmt, rs);
			}
			return 0;
		}
		
		//해당 id의 정보 가져오기
		public Member_DTO getdto(String id) {
			
			try {
				conn=ds.getConnection();
				String sql="select * from member where id =?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery(); 
				if(rs.next()) {
					mdto=new Member_DTO();
					mdto.setId(rs.getString("id"));
					mdto.setPw(rs.getString("pw"));
					mdto.setName(rs.getString("name"));
					String[] a=rs.getString("rrn").split("-");
					mdto.setRrn1(a[0]);
					mdto.setRrn2(a[1]);
					mdto.setEmail(rs.getString("email"));
					String[] b=rs.getString("phone").split("-");
					mdto.setPhone1(b[0]);
					mdto.setPhone2(b[1]);
					mdto.setPhone3(b[2]);
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("아이디 정보 가져오기 실패");
			}finally {
				close(conn, pstmt, rs);
			}
			return mdto;
		}
		
		// 아이디 수정하기
		public int update(Member_DTO dto) {
			try {
				conn=ds.getConnection();
				String sql="update member set pw=?,email=?,phone=? where id=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, dto.getPw());
				pstmt.setString(2, dto.getEmail());
				pstmt.setString(3, dto.getPhone1()+"-"+dto.getPhone2()+"-"+dto.getPhone3());
				pstmt.setString(4, dto.getId());
				return pstmt.executeUpdate();  //성공
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("아이디 수정 실패");
			}finally {
				close(conn, pstmt, rs);
			}
			
			return 0;  //실패
		}
		
		
		//아이디 삭제
		public void delete(String id) {
			try {
				conn=ds.getConnection();
				
				String sql="delete from member where id=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate(); //삭제 성공
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("아이디 삭제 실패");
			}finally{
				close(conn, pstmt, rs);
			}
		}
		
		public boolean checkid(String id) {
			try {
				conn=ds.getConnection();
				String sql="select id from member where id=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					return true;
				}
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("아이디 삭제 실패");
			}finally{
				close(conn, pstmt, rs);
			}
			return false;
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
