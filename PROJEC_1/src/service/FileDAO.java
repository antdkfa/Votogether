package service;

import java.sql.*;
import java.util.ArrayList;
import service.Board;
import service.BoardDao;

public class FileDAO {
	private final String driverClassName = "com.mysql.jdbc.Driver";
	private final String url = "jdbc:mysql://localhost:3306/webdb";
	private final String username = "root";
	private final String password = "student";
	
	
	public int upload(String fileName, String fileRealName){
		String sql = "insert into file values (?,?)";
		Connection connection = null;
		PreparedStatement statement = null;
		try{
			connection = this.getConnection();
			statement = connection.prepareStatement(sql);
			statement.setString(1, fileName);
			statement.setString(2, fileRealName);
			return statement.executeUpdate();
			

		}catch (Exception e){
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<FileDTO> selectfilename() throws SQLException{
		ArrayList<FileDTO> list = new ArrayList<FileDTO>();
		
		
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		connection = this.getConnection();
		StringBuffer sql  = new StringBuffer();
		sql.append("select fileRealName from file");
		statement = connection.prepareStatement(sql.toString());
		rs = statement.executeQuery();
		while(rs.next()){
		FileDTO file = new FileDTO();
		file.setFileRealName(rs.getString("fileRealName"));
		list.add(file);
		}
		if(rs != null) rs.close();
		if(statement != null) statement.close();
		if(connection != null) connection.close();
		return list;
	}
	
	
	
	private Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName(this.driverClassName);
			connection = DriverManager.getConnection(this.url, this.username, this.password);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
	
	private void close(Connection connection, Statement statement, ResultSet resultset) {
		if(resultset != null) {
			try {
				resultset.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(statement != null) {
			try {
				statement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
