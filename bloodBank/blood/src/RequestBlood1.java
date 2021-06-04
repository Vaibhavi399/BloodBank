

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import DbHandler.*;

/**
 * Servlet implementation class RequestBlood1
 */
public class RequestBlood1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestBlood1() {
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
		Connection con=Connect.Sing();
		Statement s=con.createStatement();
		String group=request.getParameter("group");
		System.out.println("--------------------");
		System.out.println(group);
		System.out.println("--------------------");
		String bid=" ",bname=" ";
		int k,flag=0;
		String ss="select * from stock where bgroup='"+group+"'";
		ResultSet rs=s.executeQuery(ss);
		while(rs.next()){
			 k=rs.getInt(4);
			if(k >= Integer.parseInt(request.getParameter("value"))){
				bid=rs.getString(1);
				bname=rs.getString(2);
				flag=1;
				System.out.println(rs.getString(1));
			}
		}
		if(flag==1){
		String sql="insert into request(uid,bgroup,stock,bid,bname) values(?,?,?,?,?)" ;
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1,T.getId());
		ps.setString(2, request.getParameter("group"));
		ps.setInt(3, Integer.parseInt(request.getParameter("value")));
		ps.setString(4,bid);
		ps.setString(5,bname);
		int j=ps.executeUpdate();
		if(j>0){
			response.sendRedirect("RequestBlood1.jsp");
		}
		else{
			response.sendRedirect("error.html");
		}
		}else{
			response.sendRedirect("Unavailable.jsp");
		}}
		catch(Exception e){
			System.out.println("--------------------");
			System.out.println(e);
			System.out.println("--------------------");
		}
	
		doGet(request, response);
	}

}
