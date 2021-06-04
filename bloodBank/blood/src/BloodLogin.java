

import java.io.IOException;
import java.sql.*;
import DbHandler.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BloodLogin
 */
public class BloodLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BloodLogin() {
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
			String id=request.getParameter("username");
			String pass=request.getParameter("password");
			Connection con=Connect.Sing();
			Statement s=con.createStatement();
			String sql="SELECT * FROM blood_bank WHERE bid='"+id+"' and bpass='"+pass+"'";
			ResultSet rs=s.executeQuery(sql);
			if(rs.next()){
				response.sendRedirect("BankHome.jsp?name="+rs.getString("bname"));
				T.setId(id);
				T.setName(rs.getString("bname"));
			}
			else{
				response.sendRedirect("error.html");
			}
			
		}catch(Exception e){
			
		}
		doGet(request, response);
	}

}
