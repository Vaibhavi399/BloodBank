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
<body style="background-color:skyblue">
<br/><br/><br/><br/>
<center>
<div style="background-color:rgb(229,232,232);max-width:50%">
<form action="UpdateStock" method="post">
<h1 style="color:red">UPDATE STOCK</h1><hr/><br/>
Blood group::<input type="text" placeholder="Blood Group"  name="group"/><br/><br/>
STOCK:<input type="text" placeholder="Stock in liter"  name="value"/><br/><br/>
<button type="submit">Update </button><br/>
</form>
<table border="1" >
<thead style="background-color:orange">
<tr>
	<th>Bank Id</th>
	<th>group</th>
	<th>stock</th>

	</tr>
	</thead>
	<%
	try{
		Connection con=Connect.Sing();
		Statement s=con.createStatement();
		String k="SELECT * FROM stock Where bid='"+T.getId()+"'";
		ResultSet rs=s.executeQuery(k);
		while(rs.next()){
	%>
	<tbody style="background-color:yellow">
	<tr>
		<td><%= rs.getString("bid") %></td>
		<td><%= rs.getString("bgroup") %></td>
		<td><%= rs.getString("stock") %></td>
	</tbody>
	<%
	}
		}catch(Exception e){
		
	}
	%>
	
</table><br/><br/>
	<form  action="BankHome.jsp" method="post">
	<button type="submit" value="submit" style="background-color:blue;width:50%;">BANK HOME</button>
	</form><br/><br/>
	</div>
</center>
</body>
</html>