﻿package forum;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.DBManager;
import common.Paging;

public class ForumDAO {

	// DB 연결 클래스
		Connection conn;
		Statement stmt;
		PreparedStatement pstmt;
		ResultSet rs;

		// 글 리스트 순차조회+페이징 처리
		public ArrayList<ForumVO> getForumList(Paging paging) throws SQLException {
			ArrayList<ForumVO> list = new ArrayList<ForumVO>();
			try {
				conn = DBManager.getConnection();
				// 1번 페이지 1~10
				// 2번 페이지 11~20
				int startNum = paging.getStartNum();
				int pageRow = paging.getEndNum();
				
				System.out.println("startNum: " +startNum);
				 System.out.println("pageRow: " +pageRow);

				String sql = "select F1.* FROM(SELECT * FROM Forum order by post_date asc) F1" 
						+ " LIMIT ? OFFSET ?"; // LIMIT 10페이지씩, 0번째부터.

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, pageRow);
				// offset 0부터 시작
				pstmt.setInt(2, startNum-1);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					ForumVO fvo = new ForumVO();
					fvo.setPostId(rs.getInt("post_id"));
					fvo.setPostSubject(rs.getString("post_subject"));
					fvo.setPostContent(rs.getString("post_content"));
					fvo.setPostFile(rs.getString("post_file"));
					fvo.setSawCount(rs.getInt("saw_count"));
					fvo.setPostDate(rs.getDate("post_date"));

					list.add(fvo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBclose();
			}
			return list;
		}

		// 페이징 처리를 위한 Forum 테이블의 전체 데이터 갯수 조회 (row 갯수)
		public int getAllCount() throws SQLException {
			String sql = "SELECT COUNT(post_id) as count FROM Forum";
			conn = DBManager.getConnection();
			int count = 0;
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					count = rs.getInt("count");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBclose();
			}
			return count;
		}
		
		
	// 글 추가
	public void insert(ForumVO fvo) throws SQLException {

		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			String sql = "INSERT INTO Forum(post_id, post_subject, post_content, post_file, post_date)"
					+ " values(?,?,?,?,now())";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fvo.getPostId());
			pstmt.setString(2, fvo.getPostSubject());
			pstmt.setString(3, fvo.getPostContent());
			pstmt.setString(4, fvo.getPostFile());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBclose();
		}
	}

	private void DBclose() throws SQLException {
		DBManager.close(conn);

	}

}
