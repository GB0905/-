package sql;

import java.sql.*;

public class select {

	public ResultSet select (String sql) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
