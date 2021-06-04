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
<h1 style="color:red">ADD CAMP</h1><hr/><br/>
	<form >
	camp Id:<br><input type="text" placeholder="id" name="id" style="background-color:orange" required/><br/>
	camp Name:<br><input type="text" placeholder="game" name="name" style="background-color:orange" required/><br/><br/>
	camp Location:<br><input type="text" placeholder="location" name="location" style="background-color:orange" required/><br/><br/>
	camp date:<br><input type="text" placeholder="contact" name="date" style="background-color:orange" required/><br/><br/>
	camp time:<br><input type="text" placeholder="contact" name="time" style="background-color:orange" required/><br/><br/>
	<button type="submit" value="submit" style="background-color:orange;width:50%;">Login</button>
	</form><br/><br/>
	
</div>
	<form  action="BankHome.jsp" method="post">
	<button type="submit" value="submit" style="background-color:blue;width:50%;">BANK HOME</button>
	</form><br/><br/>
</center>
<%
try{
	Connection con=Connect.Sing();
	Statement l=con.createStatement();
	ResultSet rs=l.executeQuery("SELECT * FROM camp WHERE cid='"+request.getParameter("id")+"' and bid='"+T.getId()+"'");
	if(rs.next())
	{
		response.sendRedirect("error.html");
	}else{
	////////
	String k="INSERT INTO camp(bid,cid,cname,clocation,cdate,ctime) values(?,?,?,?,?,?)";
	PreparedStatement s=con.prepareStatement(k);
	s.setString(1,T.getId());
	s.setString(2,request.getParameter("id"));
	s.setString(3,request.getParameter("name"));
	s.setString(4,request.getParameter("location"));
	s.setString(5,request.getParameter("date"));
	s.setString(6,request.getParameter("time"));
	System.out.println(T.getId());
	System.out.println(request.getParameter("id"));
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