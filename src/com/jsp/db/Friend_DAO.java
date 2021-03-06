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

public class Friend_DAO {

	
	private static Friend_DAO mdao=new Friend_DAO(); 
	ResultSet rs;
	PreparedStatement pstmt;
	Connection conn;
	DataSource ds;
	Likes_DTO ldto;
	
		//생성자에서 인터넷연결 시도
		private Friend_DAO() {
			try {
				Context ctx=new InitialContext();
				ds=(DataSource)ctx.lookup("java:comp/env/jdbc/orcl");
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("생성 실패");
			}
		}
		// private 싱글톤 객체 가져오기
		public static Friend_DAO getInstance() {
			return mdao;
		}
		
		
			// 친구 추가 가능한지 여부.
				public int search_member(String search_id,String id) {//rhruf,qudcks0703
					int result = 0;
					try {
						conn=ds.getConnection();
						String sql = "select id from member where id= ?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, search_id);				
						rs = pstmt.executeQuery();//아이디 존재여부
						if(rs.next()) { //아이디 10개면 10번 반복
							if(rs.getString("id").equals(search_id)) { //아이디 일단 존재함. //뺀아이디랑 검색아이디랑같으지확
								String sql1="select id from friend where friend_id=? and id=?";
								pstmt=conn.prepareStatement(sql1);
								pstmt.setString(1, id);
								pstmt.setString(2, search_id);
								rs=pstmt.executeQuery();
								if(rs.next()) {
									if(rs.getString("id").equals(search_id)) {
										return 0; // 친구신청이 이미온상태
									}
								}
								String sql3="select friend_id from friend where friend_id=? and id=?";
								pstmt=conn.prepareStatement(sql3);
								pstmt.setString(1, search_id);
								pstmt.setString(2, id);
								rs=pstmt.executeQuery();
								if(rs.next()) {
									if(rs.getString("friend_id").equals(search_id)) {
										return 0; // 친구신청이 이미온상태
									}
								}else {
									return 1;
								}
							}
						}
					}catch (Exception e) {
						e.printStackTrace();
					}finally {
						close(conn, pstmt, rs);
					}
					return -1; //아이디가 아에 존재x
				}		
				
				//친구 추가
				public int add_friend(String id, String search_id) {
					try {
						conn=ds.getConnection();
						String sql2 = "insert into friend values(?, ?, 1, 0)";
						pstmt =conn.prepareStatement(sql2);
						pstmt.setString(1, id);
						pstmt.setString(2, search_id);
						return pstmt.executeUpdate();
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						close(conn, pstmt, rs);
					}
					return 0;
				}
				
				//친구이거나 친추왔거나 친추를 걸었는지 체크기능
				public int friend_check(String id, String search_id) {
					try {
						conn=ds.getConnection();
						String sql2 = "select * from friend where (id=?  and friend_id =?) or (friend_id=?  and id =?)";
						pstmt =conn.prepareStatement(sql2);
						pstmt.setString(1, id);
						pstmt.setString(2, search_id);
						pstmt.setString(3, id);
						pstmt.setString(4, search_id);
						rs=pstmt.executeQuery();
						if(rs.next()) {
							return 1;
						}
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						close(conn, pstmt, rs);
					}
					return 0;
				}
				
				// 친구 목록 보기
				public List list_firend(String id) {
					List list=new ArrayList();
					try {
						conn=ds.getConnection();
						String sql1 = "select id from friend where friend_id =? and my_num = 1 and friend_num = 1";
						pstmt = conn.prepareStatement(sql1);
						pstmt.setString(1, id);
						rs = pstmt.executeQuery();
						while(rs.next()) {
							list.add(rs.getString("id"));
						}
						String sql2 = "select friend_id from friend where id =? and my_num = 1 and friend_num = 1";
						pstmt = conn.prepareStatement(sql2);
						pstmt.setString(1, id);
						rs = pstmt.executeQuery();
						while(rs.next()) {
							list.add(rs.getString("friend_id"));
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						close(conn, pstmt, rs);
					}
					return list;
				}
				
				//친구 목록 뽑아오기
				public List list_firend_search(String id,String search) {
					List list=new ArrayList();
					try {
						conn=ds.getConnection();
						String sql1 = "select id from friend where friend_id=? and id like ? and my_num = 1 and friend_num = 1";
						pstmt = conn.prepareStatement(sql1);
						pstmt.setString(1, id);
						pstmt.setString(2,"%"+search+"%");
						rs = pstmt.executeQuery();
						while(rs.next()) {
							list.add(rs.getString("id"));
						}
						String sql2 = "select friend_id from friend where  id =? and friend_id like ? and my_num = 1 and friend_num = 1";
						pstmt = conn.prepareStatement(sql2);
						pstmt.setString(1,id);
						pstmt.setString(2,"%"+search+"%");
						rs = pstmt.executeQuery();
						while(rs.next()) {
							list.add(rs.getString("friend_id"));
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						close(conn, pstmt, rs);
					}
					return list;
				}
				
				//친구 찾기 목록
				public List list_search(String id,String search) {
					List list=new ArrayList();
					try {
						conn=ds.getConnection();
						String sql1 = "select id from member where id like ? and id != ? and id not in (select friend_id from friend where id=?) and id not in (select id from friend where friend_id=?)";
						pstmt = conn.prepareStatement(sql1);
						pstmt.setString(1,"%"+search+"%");
						pstmt.setString(2, id);
						pstmt.setString(3, id);
						pstmt.setString(4, id);
						rs = pstmt.executeQuery();
						while(rs.next()) {
							list.add(rs.getString("id"));
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						close(conn, pstmt, rs);
					}
					return list;
				}
				
				

				// 친구 나를 신청한 친구 목록
				public List list_firend_you(String id) {
					List list=new ArrayList();
					try {
						conn=ds.getConnection();
						String sql = "select id from friend where friend_id =? and my_num = 1 and friend_num = 0";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, id);
						rs = pstmt.executeQuery();
						while(rs.next()) {
							list.add(rs.getString("id"));
						}
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						close(conn, pstmt, rs);
					}
					return list;
				}
				
				// 친구 수락 //친구 넘을 변경해야할듯
				public int ok_friend(String id,String friend) {
					try {
						conn = ds.getConnection();
						String sql = "update friend set friend_num=1 where friend_id = ? and id=?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, id);
						pstmt.setString(2, friend);
						return pstmt.executeUpdate();
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						close(conn, pstmt, rs);
					}
					return 0;
				}
				
				// 친구추가 온 갯수
				public int count_friend(String id) {
					try {
						conn = ds.getConnection();
						String sql = "select count(*) from friend where friend_id=? and my_num=1 and friend_num=0";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, id);
						rs=pstmt.executeQuery();
						if(rs.next()) {
							return rs.getInt("count(*)");
						}
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						close(conn, pstmt, rs);
					}
					return 0;
				}
				
				//친구 거절~
				public int  no_friend(String id,String friend) {
					try {
						conn = ds.getConnection();
						String sql = "delete from friend where id=? and friend_id=?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, friend);
						pstmt.setString(2, id);
						return pstmt.executeUpdate();
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						close(conn, pstmt, rs);
					}
					return 0;
				}		
				
				//친구 삭제
				public int  friend_delete(String id,String friend) {
					try {
						conn = ds.getConnection();
						String sql = "delete from friend where (id=? and friend_id=?) or (friend_id=? and id=?)";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, friend);
						pstmt.setString(2, id);
						pstmt.setString(3, friend);
						pstmt.setString(4, id);
						return pstmt.executeUpdate();
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						close(conn, pstmt, rs);
					}
					return 0;
				}		
				
				/**
								// 내가 신청한 친구 목록
				public List list_firend_me(String id) {
					List list=new ArrayList();
					try {
						conn=ds.getConnection();
						String sql = "select friend_id from friend where id =? and my_num = 1 and friend_num = 0";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, id);
						rs = pstmt.executeQuery();
						while(rs.next()) {
							list.add(rs.getString("friend_id"));
						}
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						close(conn, pstmt, rs);
					}
					return list;
				}
								// 친구 삭제, 친구요청 취소

		*/
		
		
		
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
