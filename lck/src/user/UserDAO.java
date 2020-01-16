package user;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import common.DBManager;

public class UserDAO {

	// DB 연결 클래스
		Connection conn;
		Statement stmt;
		PreparedStatement pstmt;
		ResultSet rs;
		
	// 멤버 추가
		public void insert(UserVO uvo) throws SQLException {

			try {
				conn = DBManager.getConnection();
				stmt = conn.createStatement();
				String sql = "INSERT INTO User(name, password, phone, position, address, identity_photo, reg_date)"
						+ " values(?,?,?,?,?,?,now())";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, uvo.getName());
				pstmt.setString(2, uvo.getPassword());
				pstmt.setString(3, uvo.getPhone() +"-"+uvo.getPhonemid()+"-"+uvo.getPhoneend());
				pstmt.setString(4, uvo.getPosition());
				pstmt.setString(5, uvo.getAddress());
				pstmt.setString(6, uvo.getIdentityPhoto());

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
