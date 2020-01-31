package forum;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import comment.CommentVO;
import common.DBManager;
import common.Paging;

public class ForumDAO {

	// DB 연결 클래스
	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;

	public ArrayList<ForumVO> search(String postSubject) throws SQLException {
		ArrayList<ForumVO> flist = new ArrayList<ForumVO>();
		try {
			conn = DBManager.getConnection();
			String sql = "SELECT DISTINCT forum.*, USER.identity_photo as photo FROM forum, user WHERE post_subject LIKE ? "
					+ "AND post_id = user.userid "
					+ "ORDER BY forum.forum_num desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + postSubject + "%");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ForumVO fvo = new ForumVO();
				fvo.setForumNum(rs.getInt("forum_num"));
				fvo.setPostId(rs.getInt("post_id"));
				fvo.setIdentityPhoto(rs.getString("photo"));
				fvo.setPostSubject(rs.getString("post_subject"));
				fvo.setPostContent(rs.getString("post_content"));
				fvo.setPostPhoto(rs.getString("post_photo"));
				fvo.setPostVideo(rs.getString("post_video"));
				fvo.setSawCount(rs.getInt("saw_count"));
				fvo.setPostDate(rs.getDate("post_date"));
				flist.add(fvo);
			}

			String howmanycomments = "SELECT count(comment_post) as cnt "
								   + "FROM COMMENT, forum "
				         		   + "WHERE forum.forum_num = comment.comment_post";
				pstmt.clearParameters();
				pstmt = conn.prepareStatement(howmanycomments);
				rs = pstmt.executeQuery();
				rs.next();
				int commentCnt = rs.getInt("cnt");
				
				flist.get(0).setHowmanycomments(commentCnt);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBclose();
		}
		return flist;
	}
	
	
	// 글 리스트 순차조회+페이징 처리
	public ArrayList<ForumVO> getForumList(Paging paging, int page) throws SQLException {
		ArrayList<ForumVO> list = new ArrayList<ForumVO>();
		try {
			conn = DBManager.getConnection();
			// 1번 페이지 1~10
			// 2번 페이지 11~20
			int startNum = (page - 1) * 10 + 1;
			int pageRow = page * 10;

			// int startNum = paging.getStartNum();
			// int pageRow = paging.getEndNum();

			// System.out.println("startNum: " +startNum);
			// System.out.println("pageRow: " +pageRow);

			String sql = "SELECT distinct F1.*, USER.identity_photo as photo "
					+ "FROM USER, (SELECT * FROM Forum order by post_date asc) F1 " + "WHERE USER.userid = post_id order by post_date desc "
					+ "LIMIT ? OFFSET ?"; // LIMIT 10페이지씩, 0번째부터.

			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pageRow);
			// offset 0부터 시작
			pstmt.setInt(2, startNum - 1);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ForumVO fvo = new ForumVO();
				fvo.setForumNum(rs.getInt("forum_num"));
				fvo.setPostId(rs.getInt("post_id"));
				fvo.setIdentityPhoto(rs.getString("photo"));
				fvo.setPostSubject(rs.getString("post_subject"));
				fvo.setPostContent(rs.getString("post_content"));
				fvo.setPostPhoto(rs.getString("post_photo"));
				fvo.setPostVideo(rs.getString("post_video"));
				fvo.setSawCount(rs.getInt("saw_count"));
				fvo.setPostDate(rs.getDate("post_date"));

				list.add(fvo);
			}
			
			String howmanycomments = "SELECT count(comment_post) as cnt "
								   + "FROM COMMENT, forum "
		                		   + "WHERE forum.forum_num = comment.comment_post";
			
			
			pstmt.clearParameters();
			pstmt = conn.prepareStatement(howmanycomments);
			rs = pstmt.executeQuery();
			rs.next();
			int commentCnt = rs.getInt("cnt");
			
			list.get(0).setHowmanycomments(commentCnt);
			
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
	
	public int increaseSawCnt(int cnt, int forumNum) throws SQLException {
		
		++cnt;
		conn = DBManager.getConnection();
		
		String updateSql = "UPDATE FORUM SET saw_count = ? where forum_num = ?";
		String selectSql = "SELECT saw_count "
						 + "FROM FORUM, comment "
						 + "WHERE forum_num = ? ";
		try {

			pstmt = conn.prepareStatement(updateSql);
			pstmt.setInt(1, cnt);
			pstmt.setInt(2, forumNum);
			pstmt.executeUpdate();
			pstmt.clearParameters();
			pstmt = conn.prepareStatement(selectSql);
			pstmt.setInt(1, forumNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt("saw_count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBclose();
		}
		
		return cnt;
	}
	

	public ForumVO selectOne(int forum_num) throws SQLException {
		ForumVO fvo = new ForumVO();
		List<CommentVO> list = new ArrayList<>();
		// String sql = "SELECT forum.*, user.identity_photo as photo FROM forum, user
		// WHERE forum_num = ? AND forum.post_id = user.userid";

		String sql = "SELECT forum.*, user.identity_photo as photo, comment.* " + "FROM forum, comment, user "
				+ "WHERE forum_num = ? " + "AND forum.post_id = user.userid "
				+ "AND forum.forum_num = comment.comment_post";
		try {

			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, forum_num);
			rs = pstmt.executeQuery();
			

			if (!rs.next()) { // if 0 row selected. meanwhile, if there's no any comment at the post.
				sql = "SELECT forum.*, user.identity_photo as photo FROM forum, user WHERE forum_num = ? AND forum.post_id = user.userid";
				pstmt.clearParameters();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, forum_num);
				rs = pstmt.executeQuery();
				rs.next();
			}
			fvo.setForumNum(rs.getInt("forum_num"));
			fvo.setPostId(rs.getInt("post_id"));
			fvo.setIdentityPhoto(rs.getString("photo"));
			fvo.setPostSubject(rs.getString("post_subject"));
			fvo.setPostContent(rs.getString("post_content"));
			fvo.setPostPhoto(rs.getString("post_photo"));
			fvo.setPostVideo(rs.getString("post_video"));
			fvo.setSawCount(rs.getInt("saw_count"));
			fvo.setPostDate(rs.getDate("post_date"));

		
			while (rs.next()) {

				CommentVO cvo = new CommentVO();
				cvo.setCommentNum(rs.getInt("comment_num"));
				cvo.setCommentPost(rs.getInt("comment_post"));
				cvo.setCommentContent(rs.getString("comment_content"));
				cvo.setCommentId(rs.getString("comment_id"));
				cvo.setCommentDate(rs.getDate("comment_date"));

				list.add(cvo);
			
			}
			
			System.out.println("list : " +list);
			
			
			fvo.setComment(list);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBclose();
		}

		return fvo;
	}
	

	

	// 글 추가
	public void insert(ForumVO fvo) throws SQLException {

		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			String sql = "INSERT INTO Forum(post_id, post_subject, post_content, post_photo, post_video, post_date)"
					+ " values(?,?,?,?,?,now())";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fvo.getPostId());
			pstmt.setString(2, fvo.getPostSubject());
			pstmt.setString(3, fvo.getPostContent());
			pstmt.setString(4, fvo.getPostPhoto());
			pstmt.setString(5, fvo.getPostVideo());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBclose();
		}
	}
	
	// 글 추가
		public void update(int postNum, String postContentSub, String postContentText, String postPhoto, String postVideo) throws SQLException {

			try {
				conn = DBManager.getConnection();
				stmt = conn.createStatement();
				String sql = "UPDATE FORUM SET post_subject = ?, post_content = ?, post_photo = ?, post_video = ? WHERE forum_num = ?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, postContentSub);
				pstmt.setString(2, postContentText);
				pstmt.setString(3, postPhoto);
				pstmt.setString(4, postVideo);

				pstmt.setInt(5, postNum);
				
				pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBclose();
			}
		}
		
		// 글 추가
		public void delete(int postNum) throws SQLException {

			try {
				conn = DBManager.getConnection();
				stmt = conn.createStatement();
				String sql = "DELETE FROM FORUM WHERE forum_num = ?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, postNum);

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
