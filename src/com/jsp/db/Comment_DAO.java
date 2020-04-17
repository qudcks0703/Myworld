package com.jsp.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Comment_DAO {
	
	private static Comment_DAO cdao=new Comment_DAO(); 
	ResultSet rs;
	PreparedStatement pstmt;
	Connection conn;
	DataSource ds;
	Comment_DTO cdto;
	
		//생성자에서 인터넷연결 시도
		private	Comment_DAO() {
			try {
				Context ctx=new InitialContext();
				ds=(DataSource)ctx.lookup("java:comp/env/jdbc/orcl");
			}catch(Exception e) {
				System.out.println("생성 실패");
				e.printStackTrace();
			}
		}
		// private 싱글톤 객체 가져오기
		public static Comment_DAO getInstance() {
			return cdao;
		}
		
		//댓글 작성
		public int write(Comment_DTO dto) {
			try{
				conn=ds.getConnection();
				String sql="insert into comment1 values(comment1_seq.nextval,?,?,?,sysdate)";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1,dto.getBoard_num());
				pstmt.setString(2,dto.getWriter());
				pstmt.setString(3,dto.getComment());
				return pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("게시판 작성 실패");
			}finally {
				close(conn, pstmt, rs);
			}
			return 0;
		}		
		
		//댓글 가져오기
		public List select(int board_num) {
			List list=new ArrayList();
			try{
				conn=ds.getConnection();
				String sql="select * from comment1 where board_num=? order by reg desc";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1,board_num);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					cdto=new Comment_DTO();
					cdto.setWriter(rs.getString("writer"));
					cdto.setComment(rs.getString("comment1"));
					cdto.setReg(rs.getTimestamp("reg"));
					cdto.setNum(rs.getInt("num"));
					cdto.setBoard_num(rs.getInt("board_num"));
					list.add(cdto);
				}
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("게시판 작성 실패");
			}finally {
				close(conn, pstmt, rs);
			}
			return list;
		}
		
		//댓글 삭제
		public int delete(int board_num,String id,int num) {
			try{
				conn=ds.getConnection();
				String sql="delete from comment1 where num=? and writer =? and board_num=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1,num);
				pstmt.setString(2,id);
				pstmt.setInt(3,board_num);
				return pstmt.executeUpdate(); 
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("게시판 작성 실패");
			}finally {
				close(conn, pstmt, rs);
			}
			return 0;
		}
		
		//댓글 수 세기
	public int count_comment(int board_num) {
			try{
				conn=ds.getConnection();
				String sql="select count(*) from comment1 where board_num=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1,board_num);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					return rs.getInt("count(*)");
				}
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("게시판 작성 실패");
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
