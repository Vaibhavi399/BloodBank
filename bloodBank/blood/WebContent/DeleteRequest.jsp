<%@page import="DbHandler.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<br/><br/><br/><br/>
<%
	try{
			Connection con=Connect.Sing();
			String r=request.getParameter("rid");
			int rid=Integer.parseInt(r);

			String sql="DELETE FROM request WHERE rid=?";
			System.out.println("===========================");
			System.out.println(rid);

			System.out.println("===========================");
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1,rid);
			int i=ps.executeUpdate();
			if(i>0){
				response.sendRedirect("RequestBlood1.jsp");
			}else{
				response.sendRedirect("error.html");
			}
	}catch(Exception e){
		System.out.println("error========="+e);
	}
%>
</body>
</html>