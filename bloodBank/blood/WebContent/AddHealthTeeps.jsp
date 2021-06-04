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
<h1 style="color:red">ADD HEALTH TIPS</h1><hr/><br/>
	<form >
	Add tip:<br><input type="text" placeholder="teeps" name="teep" style="background-color:orange" required/><br/><br/>
	<button type="submit" value="submit" style="background-color:orange;width:50%;">add</button>
	</form><br/><br/>
	
</div>
	<form  action="AdminHome.jsp" method="post">
	<button type="submit" value="submit" style="background-color:blue;width:50%;">ADMIN HOME</button>
	</form><br/><br/>
</center>
<%
try{
	Connection con=Connect.Sing();
	////////
	String k="INSERT INTO hteeps(id,teep) values(?,?)";
	PreparedStatement s=con.prepareStatement(k);
	s.setString(1,"0");
	s.setString(2,request.getParameter("teep"));
	int g = s.executeUpdate();
	if(g==1){
		response.sendRedirect("success.html");
	}
	else{
	    response.sendRedirect("error.html");
	}
	}catch(Exception e){
		
	 
	}

%>
</body>
</html>