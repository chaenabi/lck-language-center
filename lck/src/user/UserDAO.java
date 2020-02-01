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

	String name = "";

	// 로그인시 정보가 DB에 있으면 selectOne() 을 호출하고, 없으면 아무것도 하지못하게 한다.
	public boolean login(UserVO uvo) throws SQLException {

		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			String sql = "Select * from user where `name`=? and `password`=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uvo.getName());
			pstmt.setString(2, uvo.getPassword());

			rs = pstmt.executeQuery();

			// 유저 정보가 없으면
			if (!rs.next())
				return false;
			else //있으면 유저 이름과 유저의 ID를 매핑하고, UserController에서 selectOne를 호출하여 재활용한다.
				uvo.setUserId(rs.getInt("userid"));;
				uvo.setName(rs.getString("name"));
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBclose();
		}
		return true;
	}

	public UserVO selectOne(UserVO uvo) throws SQLException {

		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			String sql = "Select * from user where `name`=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uvo.getName());

			rs = pstmt.executeQuery();

			while (rs.next()) {

				uvo.setName(rs.getString("name"));
				uvo.setIdentityPhoto(rs.getString("identity_Photo"));
				uvo.setPosition(rs.getString("position"));
				uvo.setAddress(rs.getString("address"));
				uvo.setPhone(rs.getString("phone"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBclose();
		}
		return uvo;
	}

	// 멤버 추가
	public void insert(UserVO uvo) throws SQLException {

		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			String sql = "INSERT INTO user(`name`, `password`, `phone`, `position`, `address`, `identity_photo`, `reg_date`)"
					+ " values(?,?,?,?,?,?,now())";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uvo.getName());
			pstmt.setString(2, uvo.getPassword());
			pstmt.setString(3, uvo.getPhone() + "-" + uvo.getPhonemid() + "-" + uvo.getPhoneend());
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
