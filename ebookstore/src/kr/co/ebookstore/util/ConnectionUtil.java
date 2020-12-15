package kr.co.ebookstore.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionUtil {

	private static final String DRIVER_NAME = "oracle.jdbc.OracleDriver";
	private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER_NAME = "hta";
	private static final String USER_PASSWORD = "zxcv1234";
	
	static {
		try {
			Class.forName(DRIVER_NAME);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(DB_URL, USER_NAME, USER_PASSWORD);
	}
}
