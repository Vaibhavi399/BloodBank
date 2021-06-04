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
<h1 style="color:red">ADD BLOOD BANK</h1><hr/><br/>
	<form >
	Blood Bank Id:<br><input type="text" placeholder="id" name="id" style="background-color:orange" required/><br/>
	Blood Bank Name:<br><input type="text" placeholder="name" name="name" style="background-color:orange" required/><br/><br/>
	Blood Bank password:<br><input type="password" placeholder="password" name="password" style="background-color:orange" required/><br/><br/>
	Blood Bank Location:<br><input type="text" placeholder="location" name="location" style="background-color:orange" required/><br/><br/>
	Blood Bank Contact:<br><input type="text" placeholder="contact" name="contact" style="background-color:orange" required/><br/><br/>
	<button type="submit" value="submit" style="background-color:orange;width:50%;">Login</button>
	</form><br/><br/>
	
</div>
	<form  action="AdminHome.jsp" method="post">
	<button type="submit" value="submit" style="background-color:blue;width:50%;">ADMIN HOME</button>
	</form><br/><br/>
</center>
<%
try{
	Connection con=Connect.Sing();
	Statement l=con.createStatement();
	ResultSet rs=l.executeQuery("SELECT bid FROM blood_bank WHERE bid='"+request.getParameter("id")+"'");
	if(rs.next())
	{
		response.sendRedirect("error.html");
	}else{
	////////
	String k="INSERT INTO blood_bank(bid,bpass,bname,blocation,bcontact) values(?,?,?,?,?)";
	PreparedStatement s=con.prepareStatement(k);
	s.setString(1,request.getParameter("id"));
	s.setString(2,request.getParameter("password"));
	s.setString(3,request.getParameter("name"));
	s.setString(4,request.getParameter("location"));
	s.setString(5,request.getParameter("contact"));
	int g = s.executeUpdate();
	if(g>0){
		
		//////////////////////////////
		String k1="INSERT INTO stock(bid,bgroup,stock,bname) values(?,?,?,?)";
		PreparedStatement s1=con.prepareStatement(k1);
		s1.setString(1,request.getParameter("id"));
		s1.setString(2,"O_plus");
		s1.setString(3,"0");
		s1.setString(4,request.getParameter("name"));
		s1.executeUpdate();
		//////////////////////////////
		String k2="INSERT INTO stock(bid,bgroup,stock,bname) values(?,?,?,?)";
		PreparedStatement s2=con.prepareStatement(k2);
		s2.setString(1,request.getParameter("id"));
		s2.setString(2,"O_minus");
		s2.setString(3,"0");
		s2.setString(4,request.getParameter("name"));
		s2.executeUpdate();
		//////////////////////////////
		String k3="INSERT INTO stock(bid,bgroup,stock,bname) values(?,?,?,?)";
		PreparedStatement s3=con.prepareStatement(k3);
		s3.setString(1,request.getParameter("id"));
		s3.setString(2,"A_plus");
		s3.setString(3,"0");
		s3.setString(4,request.getParameter("name"));
		s3.executeUpdate();
		//////////////////////////////
		String k4="INSERT INTO stock(bid,bgroup,stock,bname) values(?,?,?,?)";
		PreparedStatement s4=con.prepareStatement(k4);
		s4.setString(1,request.getParameter("id"));
		s4.setString(2,"A_minus");
		s4.setString(3,"0");
		s4.setString(4,request.getParameter("name"));
		s4.executeUpdate();
		//////////////////////////////
		String k5="INSERT INTO stock(bid,bgroup,stock,bname) values(?,?,?,?)";
		PreparedStatement s5=con.prepareStatement(k5);
		s5.setString(1,request.getParameter("id"));
		s5.setString(2,"B_plus");
		s5.setString(3,"0");
		s5.setString(4,request.getParameter("name"));
		s5.executeUpdate();
		//////////////////////////////
		String k6="INSERT INTO stock(bid,bgroup,stock,bname) values(?,?,?,?)";
		PreparedStatement s6=con.prepareStatement(k6);
		s6.setString(1,request.getParameter("id"));
		s6.setString(2,"B_minus");
		s6.setString(3,"0");
		s6.setString(4,request.getParameter("name"));
		s6.executeUpdate();
		//////////////////////////////
		String k7="INSERT INTO stock(bid,bgroup,stock,bname) values(?,?,?,?)";
		PreparedStatement s7=con.prepareStatement(k7);
		s7.setString(1,request.getParameter("id"));
		s7.setString(2,"AB_plus");
		s7.setString(3,"0");
		s7.setString(4,request.getParameter("name"));
		s7.executeUpdate();
		//////////////////////////////
		String k8="INSERT INTO stock(bid,bgroup,stock,bname) values(?,?,?,?)";
		PreparedStatement s8=con.prepareStatement(k8);
		s8.setString(1,request.getParameter("id"));
		s8.setString(2,"AB_minus");
		s8.setString(3,"0");
		s8.setString(4,request.getParameter("name"));
		s8.executeUpdate();
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