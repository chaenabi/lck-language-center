package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBManager {

	private static DBManager dbConnect = new DBManager();
	private static DBManager db = DBManager.getInstance();
	public static DBManager getInstance() {
		return dbConnect;
	}

	public Connection conn = null;
	public Statement stmt = null;
	public PreparedStatement pstmt = null;
	public ResultSet rs = null;

	public static Connection getConnection() {
		try {
			// 1. ?쒕씪?대쾭濡쒕뵫
			Class.forName("com.mysql.cj.jdbc.Driver");

			String ip = "localhost";
			String port = "3306";
			String id = "root";
			String pw = "mysql";

			// 2. DB ?곌껐
			//String url = "jdbc:oracle:thin:@" + ip + ":" + port + ":xe";
			String url = "jdbc:mysql:// "+ip+":"+port+"/databasename?useSSL=false";

			db.conn = DriverManager.getConnection(url, id, pw);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("?곗씠?곕쿋?댁뒪 ?묒냽 ?ㅽ뙣");
		}
		System.out.print("?묒냽 ?깃났");
		return db.conn;
	}

	public static void close(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
	}

}