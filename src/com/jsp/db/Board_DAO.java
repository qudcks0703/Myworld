package com.jsp.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Board_DAO {
	
	private static Board_DAO bdao=new Board_DAO(); 
	ResultSet rs;
	PreparedStatement pstmt;
	Connection conn;
	DataSource ds;
	Board_DTO bdto;
	
		//생성자에서 인터넷연결 시도
		private	Board_DAO() {
			try {
				Context ctx=new InitialContext();
				ds=(DataSource)ctx.lookup("java:comp/env/jdbc/orcl");
			}catch(Exception e) {
				System.out.println("생성 실패");
				e.printStackTrace();
			}
		}
		// private 싱글톤 객체 가져오기
		public static Board_DAO getInstance() {
			return bdao;
		}
		
		//게시글 작성
		public int write(Board_DTO dto) {
			try{
				System.out.println("게시판작성 실행");
				conn=ds.getConnection();
				String sql="insert into board values(board_seq.nextval,?,?,?,?,sysdate,?,0,0)";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,dto.getWriter());
				pstmt.setString(2,dto.getFile());
				pstmt.setString(3,dto.getTitle());
				pstmt.setString(4,dto.getContent());
				pstmt.setString(5,dto.getIp());
				return pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("게시판 작성 실패");
			}finally {
				close(conn, pstmt, rs);
			}
			return 0;
		}		
		
		//게시글 수정
		public int update(Board_DTO dto) {
			try{
				System.out.println("게시판수정 실행");
				conn=ds.getConnection();
				String sql="update board set title=?,content=?,bfile=? where num=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,dto.getTitle());
				pstmt.setString(2,dto.getContent());
				pstmt.setString(3,dto.getFile());
				pstmt.setInt(4,dto.getNum());
				return pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("게시판 수정 실패");
			}finally {
				close(conn, pstmt, rs);
			}
			return 0;
		}		

		//각 게시판당 좋아요 갯수 알아오기.
		public int getLikes(int num) {
			int count=0;
			try{
				conn=ds.getConnection();
				String sql1="select count(*) from likes where num=? and count=1";
				pstmt=conn.prepareStatement(sql1);
				pstmt.setInt(1,num);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					count=rs.getInt("count(*)");
				}
				String sql2="update board set likes=? where num=?";
				pstmt=conn.prepareStatement(sql2);
				pstmt.setInt(1, count);
				pstmt.setInt(2, num);
				pstmt.executeUpdate();
				return 1;
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("좋아요 실패");
			}finally {
				close(conn, pstmt, rs);
			}
			System.out.println("좋아요갯수세기 실패");
			return 0;
		}	
		
		public void hits(int num) {
			try{
				conn=ds.getConnection();
				String sql="update board set readcount=readcount+1 where num=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1,num);
				pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("게시글  작성 실패");
			}finally {
				close(conn, pstmt, rs);
			}
		}		
		//게시글 삭제 하기
		public int delete(Board_DTO dto) {
			try{
				System.out.println("게시글 삭제 실행");
				conn=ds.getConnection();
				String sql="delete from board where num=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1,dto.getNum());
				return pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("게시글  작성 실패");
			}finally {
				close(conn, pstmt, rs);
			}
			return 0;
		}		
		
		//전체 리스트 뽑기 검색x
		public List getlist() {
			List list = new ArrayList();
				try {
					conn=ds.getConnection();
					String sql="select * from (select rownum r,num,writer,bfile,title,content,boardreg,ip,readcount,likes from (select * from board) order by num desc)";
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					while(rs.next()) {
						bdto=new Board_DTO();
						bdto.setR(rs.getString("r"));
						bdto.setNum(rs.getInt("num"));
						bdto.setWriter(rs.getString("writer"));
						bdto.setFile(rs.getString("bfile"));
						bdto.setTitle(rs.getString("title"));
						bdto.setContent(rs.getString("content"));
						bdto.setBoardReg(rs.getTimestamp("boardreg"));
						bdto.setIp(rs.getString("ip"));
						bdto.setReadcount(rs.getInt("readcount"));
						bdto.setLikes(rs.getInt("likes"));
						list.add(bdto);
					}
				}catch(Exception e) {
					e.printStackTrace();
					System.out.println("리스트 불러오기 실패");
				}finally {
					close(conn, pstmt, rs);
				}
			
			return list;
		}
		
		//전체 게시글 리스트 뽑기 검색o
		public List getsearchlist(String sel, String search) {
			List list = new ArrayList();
			try {
				conn=ds.getConnection();
				String sql=null;
				if(sel.equals("all")) {
					sql="select * from (select rownum r,num,writer,bfile,title,content,boardreg,ip,readcount,likes from (select * from board where title like '%"+search+"%'or content like '%"+search+"%'or writer like '%"+search+"%' order by num desc))";
				}else {
					sql="select * from (select rownum r,num,writer,bfile,title,content,boardreg,ip,readcount,likes from (select * from board where "+sel+" like '%"+search+"%' order by num desc))";
				}				
				pstmt=conn.prepareStatement(sql);					
				rs=pstmt.executeQuery();
				if(rs.next()) {
					do{
						bdto=new Board_DTO();
						bdto.setR(rs.getString("r"));
						bdto.setNum(rs.getInt("num"));
						bdto.setWriter(rs.getString("writer"));
						bdto.setFile(rs.getString("bfile"));
						bdto.setTitle(rs.getString("title"));
						bdto.setContent(rs.getString("content"));
						bdto.setBoardReg(rs.getTimestamp("boardreg"));
						bdto.setIp(rs.getString("ip"));
						bdto.setReadcount(rs.getInt("readcount"));
						bdto.setLikes(rs.getInt("likes"));
						list.add(bdto);
					}while(rs.next());					
				}
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("리스트 불러오기 실패");
			}finally {
				close(conn, pstmt, rs);
			}
			return list;
		}
		
		//특정 아이디가 올린 게시글 뽑기
		public List getIdlist(String id) {
			List list = new ArrayList();
			try {
				conn=ds.getConnection();
				String sql="select * from (select rownum r,num,writer,bfile,title,content,boardreg,ip,readcount,likes from (select * from board) where writer=? order by num desc)";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					bdto=new Board_DTO();
					bdto.setR(rs.getString("r"));
					bdto.setNum(rs.getInt("num"));
					bdto.setWriter(rs.getString("writer"));
					bdto.setFile(rs.getString("bfile"));
					bdto.setTitle(rs.getString("title"));
					bdto.setContent(rs.getString("content"));
					bdto.setBoardReg(rs.getTimestamp("boardreg"));
					bdto.setIp(rs.getString("ip"));
					bdto.setReadcount(rs.getInt("readcount"));
					bdto.setLikes(rs.getInt("likes"));
					list.add(bdto);
				}
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("리스트 불러오기 실패");
			}finally {
				close(conn, pstmt, rs);
			}
			
			return list;
		}
		
		//특정 아이디가 좋아요 누른 게시글 뽑기
		public List getNumlist(String id,List numlist) {
			List list = new ArrayList();
			try {
				conn=ds.getConnection();
				for(int i=0;i<numlist.size();i++) {
					String sql="select * from (select rownum r,num,writer,bfile,title,content,boardreg,ip,readcount,likes from (select * from board) where num=? order by num desc)";
					pstmt=conn.prepareStatement(sql);
					pstmt.setInt(1, (int)numlist.get(i));
					rs=pstmt.executeQuery();
					if(rs.next()) {
						bdto=new Board_DTO();
						bdto.setR(rs.getString("r"));
						bdto.setNum(rs.getInt("num"));
						bdto.setWriter(rs.getString("writer"));
						bdto.setFile(rs.getString("bfile"));
						bdto.setTitle(rs.getString("title"));
						bdto.setContent(rs.getString("content"));
						bdto.setBoardReg(rs.getTimestamp("boardreg"));
						bdto.setIp(rs.getString("ip"));
						bdto.setReadcount(rs.getInt("readcount"));
						bdto.setLikes(rs.getInt("likes"));
						list.add(bdto);
					}
				}
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("리스트 불러오기 실패");
			}finally {
				close(conn, pstmt, rs);
			}
			
			return list;
		}
		
		//해당 번호의 게시글 뽑기
		public Board_DTO getcontent(int num) {
			List list = new ArrayList();
			try {
				conn=ds.getConnection();
				String sql="select * from board where num=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					bdto=new Board_DTO();
					bdto.setNum(rs.getInt("num"));
					bdto.setWriter(rs.getString("writer"));
					bdto.setFile(rs.getString("bfile"));
					bdto.setTitle(rs.getString("title"));
					bdto.setContent(rs.getString("content"));
					bdto.setBoardReg(rs.getTimestamp("boardreg"));
					bdto.setIp(rs.getString("ip"));
					bdto.setReadcount(rs.getInt("readcount"));
					bdto.setLikes(rs.getInt("likes"));
				}
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("리스트 불러오기 실패");
			}finally {
				close(conn, pstmt, rs);
			}
			
			return bdto;
		}
		
///////////////////////////////////////////////////////////////////////////////////////////////////////////		

		// 댓글 달기
		public void insertComment (Board_DTO dto) {
			int commen_num = dto.getCommen_num();
			int ref = dto.getRef();
			int re_step = dto.getRe_step();		
			int re_level = dto.getRe_level();
			String sql = "";
			try {
				conn = ds.getConnection();
				
				if(commen_num != 0) {
					sql = "update commen set re_step=re_step+1 where ref=? and re_step > ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, ref);
					pstmt.setInt(2, re_step);
					pstmt.executeUpdate();
					re_step += 1;
					re_level += 1;
				}else {
					re_step = 0;
					re_level = 0;
				}
				sql = "insert into commen values(commen_seq.nextVal,?,?,?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql);				
				pstmt.setInt(1, dto.getNum());				
				pstmt.setString(2, dto.getWriter());
				pstmt.setString(3, dto.getCommen());
				pstmt.setInt(4, re_step);
				pstmt.setInt(5, re_level);
				pstmt.setInt(6, ref);				
				pstmt.setTimestamp(7, dto.getCommen_reg());
				
				pstmt.executeUpdate();					
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close(conn, pstmt, rs);
			}
		}
		// 댓글단 게시물의 수 확인
		public int getCommentCount(int num) {
			int x = 0;
			try {
				conn = ds.getConnection();
				String sql = "select count(*) from commen where num = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					x = rs.getInt(1);
				}			
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close(conn, pstmt, rs);
			}
			return x;
		}
		// 댓글 확인하여 보여주기
		public List getComment(int num) {
			List commenList = null;
			try {
				conn = ds.getConnection();
				
				String sql = "select * from (select commen_num,num, writer, commen, re_step, re_level, ref, commenreg from (select * from commen where num = ? by num desc)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					commenList = new ArrayList();
					do {
						Board_DTO dto = new Board_DTO();
						dto.setCommen_num(rs.getInt("commen_num"));
						dto.setNum(rs.getInt("num"));
						dto.setWriter(rs.getString("writer"));
						dto.setCommen(rs.getString("commen"));
						dto.setRe_step(rs.getInt("re_step"));
						dto.setRe_level(rs.getInt("re_level"));
						dto.setRef(rs.getInt("ref"));
						dto.setCommen_reg(rs.getTimestamp("commen_reg"));
						commenList.add(dto);
					}while(rs.next());
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close(conn, pstmt, rs);
			}
			return commenList;
		}
		
		// 댓글 삭제 하기
		
				public void delete_commen(Board_DTO dto) {
					try{
						conn=ds.getConnection();
						String sql="delete from commen where commen_num=? and num =?";
						pstmt=conn.prepareStatement(sql);
						pstmt.setInt(1,dto.getCommen_num());
						pstmt.setInt(2, dto.getNum());
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
