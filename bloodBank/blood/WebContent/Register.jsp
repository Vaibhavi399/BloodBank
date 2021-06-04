<%@page import="DbHandler.*"%>
<%@ page  import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:skyblue">
<br/><br/><br/><br/>
<center>
<div style="background-color:rgb(229,232,232);max-width:50%"><br/><br/>
<h1 style="color:red">USER REGISTRATION</h1><hr/><br/>
	<form >
	User Id:<br><input type="text" placeholder="id" name="id" style="background-color:orange" required/><br/>
	User Name:<br><input type="text" placeholder="name" name="name" style="background-color:orange" required/><br/><br/>
	User password:<br><input type="password" placeholder="password" name="password" style="background-color:orange" required/><br/><br/>
	User Location:<br><input type="text" placeholder="location" name="location" style="background-color:orange" required/><br/><br/>
	User Contact:<br><input type="text" placeholder="contact" name="contact" style="background-color:orange" required/><br/><br/>
	<button type="submit" value="submit" style="background-color:orange;width:50%;">Register</button>
	</form><br/><br/>
	
</div>
</center>
<%
try{
	Connection con=Connect.Sing();
	Statement l=con.createStatement();
	ResultSet rs=l.executeQuery("SELECT uid FROM user WHERE uid='"+request.getParameter("id")+"'");
	if(rs.next())
	{
		response.sendRedirect("error.html");
	}else{
	////////
	String k="INSERT INTO user(uid,upass,uname,uaddress,ucontact) values(?,?,?,?,?)";
	PreparedStatement s=con.prepareStatement(k);
	s.setString(1,request.getParameter("id"));
	s.setString(2,request.getParameter("password"));
	s.setString(3,request.getParameter("name"));
	s.setString(4,request.getParameter("location"));
	s.setString(5,request.getParameter("contact"));
	int g = s.executeUpdate();
	if(g==1){
		response.sendRedirect("success.html");
	}
	else{
	    response.sendRedirect("error.html");
	}
	}
	}catch(Exception e){
		
	 
	}

%>
</body>
</html>