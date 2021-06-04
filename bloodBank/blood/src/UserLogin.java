

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import DbHandler.Connect;
import DbHandler.T;
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try{
		String a=request.getParameter("username1");
		String b=request.getParameter("password1");
			Connection con=Connect.Sing();
			Statement s=con.createStatement();
			String k="SELECT * FROM user WHERE uid='"+a+"' and upass='"+b+"'";
			ResultSet rs=s.executeQuery(k);
			if(rs.next()){
				response.sendRedirect("UserHome.jsp?name="+rs.getString("uname"));
				T.setId(a);
				T.setName(rs.getString("uname"));
			}else{
				response.sendRedirect("error.html");
			}}catch(Exception e){
				
			}
		doGet(request, response);
	}

}
