package DbHandler;
import java.sql.*;
public class Connect {
	static Connection con;
	public static Connection Sing(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank","root","");
			System.out.println("connection established");
		}catch(Exception e){
			System.out.println("Error"+e);
		}
		return con;
	}
}
