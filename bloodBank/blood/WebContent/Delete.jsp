<%@page import="DbHandler.Connect"%>
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
			String uid=request.getParameter("id");
			String sql="DELETE FROM Blood_bank WHERE bid=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,uid);
			int i=ps.executeUpdate();
			if(i>0){
//////////////////////////////
String k1="DELETE FROM stock WHERE bid=?";
PreparedStatement s1=con.prepareStatement(k1);
s1.setString(1,request.getParameter("id"));
s1.executeUpdate();
String k2="DELETE FROM camp WHERE bid=?";
PreparedStatement s2=con.prepareStatement(k2);
s2.setString(1,request.getParameter("id"));
s2.executeUpdate();
//////////////////////////////

				response.sendRedirect("DeleteBloodBank.jsp");
			}else{
				response.sendRedirect("error.html");
			}
	}catch(Exception e){
		
	}
%>
</body>
</html>