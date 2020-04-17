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

public class Likes_DAO {

	
	private static Likes_DAO mdao=new Likes_DAO(); 
	ResultSet rs;
	PreparedStatement pstmt;
	Connection conn;
	DataSource ds;
	Likes_DTO ldto;
	
		//생성자에서 인터넷연결 시도
		private Likes_DAO() {
			try {
				Context ctx=new InitialContext();
				ds=(DataSource)ctx.lookup("java:comp/env/jdbc/orcl");
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("생성 실패");
			}
		}
		// private 싱글톤 객체 가져오기
		public static Likes_DAO getInstance() {
			return mdao;
		}
		
		//중복값이 있냐 없냐에 따라 db에 id,num,count 입력하기
		public void insert(Likes_DTO ldto) {
			try {
				int result=1;
				conn=ds.getConnection();
				String sql1="select num from likes where id=?";
				pstmt=conn.prepareStatement(sql1);
				pstmt.setString(1, ldto.getId());
				rs=pstmt.executeQuery();
				while(rs.next()) {
					if(rs.getInt("num")==ldto.getNum()) {
						result=0;
					}else{
					}
				}
				if(result==1) {
					String sql2="insert into likes values(?,?,0)";
					pstmt=conn.prepareStatement(sql2);
					pstmt.setString(1,ldto.getId());
					pstmt.setInt(2,ldto.getNum());
					pstmt.executeUpdate();
				}
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("가입 실패");
			}finally {
				close(conn, pstmt, rs);
			}
		}
		
		//count의 갯수 1,0으로 변경시켜주기(1=좋아요 상태 , 0=좋아요 미상태)
		public int updatelikes(Likes_DTO ldto,int count) {
			try{
				System.out.println("좋아요 ");
				conn=ds.getConnection();
				String sql="update likes set count=? where num=? and id=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1,count);
				pstmt.setInt(2,ldto.getNum());
				pstmt.setString(3,ldto.getId());
				return pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("좋아요 실패");
			}finally {
				close(conn, pstmt, rs);
			}
			return 0;
		}		
		
		//db에서 id와  num값을 가진 데이터 뽑아오기
		public Likes_DTO getdto(Likes_DTO ldto) {
			
			try {
				conn=ds.getConnection();
				String sql="select * from likes where id =? and num=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, ldto.getId());
				pstmt.setInt(2, ldto.getNum());
				rs=pstmt.executeQuery(); 
				if(rs.next()) {
					ldto=new Likes_DTO();
					ldto.setId(rs.getString("id"));
					ldto.setNum(rs.getInt("num"));
					ldto.setCount(rs.getInt("count"));
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("좋아요 정보 가져오기 실패");
			}finally {
				close(conn, pstmt, rs);
			}
			return ldto;
		}
		
		//특정 id가 좋아요 누른 게시글 번호 알아오기
		public List getlikedto(String id) {
			List list=new ArrayList();
			try {
				conn=ds.getConnection();
				String sql="select num from likes where id =? and count=1";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery(); 
				while(rs.next()) {
					list.add(rs.getInt("num"));
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("좋아요 정보 가져오기 실패");
			}finally {
				close(conn, pstmt, rs);
			}
			return list;
		}
		
		//누가 좋아요 눌렀는지 확인함
		public List wholike(int num) {
			List list=new ArrayList();
			try {
				conn=ds.getConnection();
				String sql="select id,rownum r from likes where num=? and count=1 order by r desc";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs=pstmt.executeQuery(); 
				while(rs.next()) {
					list.add(rs.getString("id"));
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("좋아요 정보 가져오기 실패");
			}finally {
				close(conn, pstmt, rs);
			}
			return list;
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
