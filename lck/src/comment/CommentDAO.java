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

	// 댓글 추가
	public void insert(CommentVO cvo, int postId) throws SQLException {

		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			String sql = "INSERT INTO Comment(comment_post, comment_id, comment_content, comment_password,comment_date)"
					+ " values(?,?,?,?,now())";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postId);
			pstmt.setString(2, cvo.getCommentId());
			pstmt.setString(3, cvo.getCommentContent());
			pstmt.setString(4, cvo.getCommentPassword());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBclose();
		}
	}

	// 댓글 수정
	public boolean update(int commentnum, String password, String cid) throws SQLException {
			//boolean flag = IsThereValidData(commentnum, password, cid);			
			//if(!flag) {return false;}
			//else {
				try {
		
					conn = DBManager.getConnection();
					
					String sql = "UPDATE comment SET comment_content = ? WHERE comment_num = ? AND comment_password = ?";
					pstmt = conn.prepareStatement(sql);
	
//					pstmt.setString(1, cvo.get());
//					pstmt.setString(2, cvo.getAddress());
//					pstmt.setInt(3, cvo.getTelNumber());

	
					pstmt.executeUpdate();
					
					while(rs.next()) {
						
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					DBclose();
				}

			return true;
			//}
		}

	public boolean IsThereValidData(int commentnum, String password, String cid) throws SQLException {
		try {
			conn = DBManager.getConnection();

			String sql = "SELECT comment.comment_id FROM comment WHERE comment_num = ? AND comment_id = ? AND comment_password = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, commentnum);
			pstmt.setString(2, cid);
			pstmt.setString(3, password);

			rs = pstmt.executeQuery();

			if (!rs.next())
				return false;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBclose();
		}

		return true;
	}

	// 댓글 삭제
	public boolean delete(int midForDelete) throws SQLException {
		// 이름과 전화번호가 일치한 멤버를 삭제한다. (null 처리)
		// 그러나 이름은 null 처리하지 않는다
		try {
			conn = DBManager.getConnection();
			String sql = "UPDATE member SET address = ?, tel_number = ?, tel_number2 = ?, tel_number3 = ?, baptized_date = ?, "
					+ "birthday = ?, gender = ?, m_status = ?, m_class = ?, reg_date = ?, anointed = ? "
					+ "where m_id ='" + midForDelete + "'";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, null);
			pstmt.setString(2, null);
			pstmt.setString(3, null);
			pstmt.setString(4, null);
			pstmt.setDate(5, null);
			pstmt.setDate(6, null);
			pstmt.setString(7, null);
			pstmt.setString(8, null);
			pstmt.setString(9, null);
			pstmt.setDate(10, null);
			pstmt.setString(11, null);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBclose();
		}
		return true;
	}

	private void DBclose() throws SQLException {
		DBManager.close(conn);

	}
}
