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
<body style="background-color:skyblue">
<br/><br/><br/><br/>
<center>
<div style="background-color:rgb(229,232,232);max-width:50%">
<h1 style="color:red">VIEW USER</h1><hr/><br/>
<table border="1" >
<thead style="background-color:orange">
<tr>
	<th>User Id</th>
	<th>User Name</th>
	<th>User address</th>
	<th>User Contact</th>
	</tr>
	</thead>
	<%
	try{
		Connection con=Connect.Sing();
		Statement s=con.createStatement();
		String k="SELECT * FROM user";
		ResultSet rs=s.executeQuery(k);
		while(rs.next()){
	%>
	<tbody style="background-color:yellow">
	<tr>
		<td><%= rs.getString("uid") %></td>
		<td><%= rs.getString("uname") %></td>
		<td><%= rs.getString("uaddress") %></td>
		<td><%= rs.getString("ucontact") %></td>
		
	</tr>	
	</tbody>
	<%
	}
		}catch(Exception e){
		
	}
	%>
	
</table>
	<form  action="AdminHome.jsp" method="post">
	<button type="submit" value="submit" style="background-color:blue;width:50%;">ADMIN HOME</button>
	</form><br/><br/>
	</div>
</center>

</body>
</html>