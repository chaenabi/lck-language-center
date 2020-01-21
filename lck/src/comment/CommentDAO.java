package comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import common.DBManager;

public class CommentDAO {
	
	// DB 연결 클래스
			Connection conn;
			Statement stmt;
			PreparedStatement pstmt;
			ResultSet rs;

	
	// 글 추가
		public void insert(CommentVO cvo, int postId) throws SQLException {

			try {
				conn = DBManager.getConnection();
				stmt = conn.createStatement();
				String sql = "INSERT INTO Comment(comment_post, comment_id, comment_content, comment_date)"
						+ " values(?,?,?,now())";

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, postId);
				pstmt.setString(2, cvo.getCommentId());
				pstmt.setString(3, cvo.getCommentContent());

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
