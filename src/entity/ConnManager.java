package entity;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Connection;


public class ConnManager {

	private Connection conn;
	private String url = "jdbc:mysql://localhost/bbs";
	private String driver = "com.mysql.jdbc.Driver";
	private String user = "root";
	private String password = "zsq001";
	//public ConnManager() throws ClassNotFoundException, SQLException{
//		System.out.println("aaa!!!!!!!!!!!!!!!!!!!");
//		Class.forName(driver)¡£newInstance();
//		System.out.println("bbb!!!!!!!!!!!!!!!!!!!");
//		conn =(Connection)DriverManager.getConnection(url, user,password);
//		if(conn.isClosed()){
//			System.out.println("Wrong!!!!!!!!!!!!!!!!!!!");
//		}
	//}
	public void connSql() throws ClassNotFoundException, SQLException{
		Class.forName(driver);
		System.out.println("Wrong!!!!!!!!!!!!!!!!!!!");
		conn =(Connection)DriverManager.getConnection(url,user,password);
	}
	public boolean loginCheck(String name ,String pwd){
		String sql = "select * from user_info where UserName='"+name+"'"+"and PassWord='"+pwd+"'";
		try {
			Statement statement = conn.createStatement();
			ResultSet set = statement.executeQuery(sql);
			if(set==null){
				return false;
			}
			else return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}
}
