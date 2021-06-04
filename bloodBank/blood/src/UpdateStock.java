
import java.sql.*;
import DbHandler.Connect;
import DbHandler.T;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateStock
 */
public class UpdateStock extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStock() {
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
			int update=0;
			String group=request.getParameter("group");
			String v=request.getParameter("value");
			int value=Integer.parseInt(v);
			Connection con=Connect.Sing();
			Statement s=con.createStatement();
			String k="SELECT * FROM stock Where bid='"+T.getId()+"' and bgroup='"+group+"'";
			ResultSet rs=s.executeQuery(k);
			if(rs.next()){
				update=rs.getInt(4);
			}
			update=update+value;
			String g="Update stock set stock=? where bid='"+T.getId()+"' and bgroup='"+group+"'";
			PreparedStatement s1=con.prepareStatement(g);
			s1.setInt(1,update);
			int i=s1.executeUpdate();
			if(i>0){
				response.sendRedirect("UpdateStock.jsp");
			}else{
				response.sendRedirect("error.html");
			}
			
		}catch(Exception e){
			System.out.println("--------------------");
			System.out.println(e);
			System.out.println("--------------------");
		}
		doGet(request, response);
	}

}
