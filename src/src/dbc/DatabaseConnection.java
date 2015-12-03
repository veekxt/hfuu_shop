package src.dbc;
import java.sql.*;

public class DatabaseConnection {
	private static final String DBDRIVER = "com.mysql.jdbc.Driver" ; 
	private static final String DBURL = "jdbc:mysql://127.0.0.1:3306/hfuu_shop" ;
	private static final String DBUSER = "root" ;
	private static final String DBPASSWORD = "44222" ;
	private Connection conn ;
	public DatabaseConnection() throws Exception {
		Class.forName(DBDRIVER) ;
		this.conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;
	}
	public Connection getConnection(){
		return this.conn ;
	}
	public void close() throws Exception {
		if(this.conn != null){
			try{
				this.conn.close() ;
			}catch(Exception e){
				throw e ;
			}
		}
	}
}
