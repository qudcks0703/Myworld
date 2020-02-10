package com.jsp.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

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
				String sql="insert into member values(?,?,?,?,?,?,?,?)";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, mdto.getId());
				pstmt.setString(2, mdto.getPw());
				pstmt.setString(3, mdto.getName());
				pstmt.setString(4, mdto.getRrn());
				pstmt.setString(5, mdto.getEmail());
				pstmt.setString(6, mdto.getPhone());
				pstmt.setString(7, mdto.getHome());
				pstmt.setString(8, mdto.getFile());
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
					mdto.setRrn(rs.getString("rrn"));
					mdto.setPhone(rs.getString("phone"));
					mdto.setEmail(rs.getString("email"));
					mdto.setHome(rs.getString("home"));
					mdto.setFile(rs.getString("mfile"));
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("아이디 정보 가져오기 실패");
			}finally {
				close(conn, pstmt, rs);
			}
			return mdto;
		}
		//전체 아이디 목록가져오기
		public List getAlldto() {
			List list=new ArrayList();
			try {
				conn=ds.getConnection();
				String sql="select * from member";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery(); 
				while(rs.next()) {
					mdto=new Member_DTO();
					mdto.setId(rs.getString("id"));
					mdto.setPw(rs.getString("pw"));
					mdto.setName(rs.getString("name"));
					mdto.setRrn(rs.getString("rrn"));
					mdto.setPhone(rs.getString("phone"));
					mdto.setEmail(rs.getString("email"));
					list.add(mdto);
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("아이디 정보 가져오기 실패");
			}finally {
				close(conn, pstmt, rs);
			}
			return list;
		}
		
		// 아이디 수정하기
		public int update(Member_DTO dto) {
			try {
				conn=ds.getConnection();
				String sql="update member set pw=?,email=?,phone=?,home=?,mfile=? where id=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, dto.getPw());
				pstmt.setString(2, dto.getEmail());
				pstmt.setString(3, dto.getPhone());
				pstmt.setString(4, dto.getHome());
				pstmt.setString(5, dto.getFile());
				pstmt.setString(6, dto.getId());
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
				String sql1="delete from friend where id=? or friend_id=?";
				pstmt=conn.prepareStatement(sql1);
				pstmt.setString(1, id);
				pstmt.setString(2, id);
				pstmt.executeUpdate();
				
				String sql2="delete from mes where id=? or friend=?";
				pstmt=conn.prepareStatement(sql2);
				pstmt.setString(1, id);
				pstmt.setString(2, id);
				pstmt.executeUpdate();
				
				String sql3="delete from board where writer=?";
				pstmt=conn.prepareStatement(sql3);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				
				String sql4="delete from likes where id=?";
				pstmt=conn.prepareStatement(sql4);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				
				String sql5="delete from comment1 where writer=?";
				pstmt=conn.prepareStatement(sql5);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				
				String sql6="delete from member where id=?";
				pstmt=conn.prepareStatement(sql6);
				pstmt.setString(1, id);
				pstmt.executeUpdate(); //삭제 성공
				
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("아이디 삭제 실패");
			}finally{
				close(conn, pstmt, rs);
			}
		}
		
		//중복 검사
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
		
		// profile보기 메서드 만들기
		
		// 해당 아이디에 대한 친구수 찾기
		public int getProfileFriendCount(String id) {
			int result = 0;
			try {
				conn=ds.getConnection();
				String sql = "select count(*) from friend where (id=? and my_num=1 and friend_num=1) or (friend_id=? and my_num=1 and friend_num=1)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, id);
				rs = pstmt.executeQuery();
				if(rs.next()) {	
					result = rs.getInt("count(*)");
				}
			} catch (Exception e) {
				e.printStackTrace();
				result = -1;
			}finally{
				close(conn, pstmt, rs);
			}
			return result;
		}
		
		// 해당 아이디에 대한 게시글 수
		public int getProfileBoardCount(String id) {
			int result = 0;
			try {
				conn=ds.getConnection();
				String sql = "select count(num) from board where writer = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if(rs.next()) {					
					result = rs.getInt("count(num)");
				}
			} catch (Exception e) {
				e.printStackTrace();
				result = -1;
			}finally{
				close(conn, pstmt, rs);
			}
			return result;
		}
		
		// 해당 아이디에 대한 사진 가져오기
		public String getProfilePhoto(String id) {
			String result = "";
			try {
				conn=ds.getConnection();
				String sql = "select photoFile from member where id = ?";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {		
					result = rs.getString("photoFile");
				}
			} catch (Exception e) {
				e.printStackTrace();
				result = "false";
			}finally{
				close(conn, pstmt, rs);
			}
			return result;
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
