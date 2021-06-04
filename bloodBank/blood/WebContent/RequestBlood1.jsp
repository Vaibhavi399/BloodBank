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
<h1 style="color:red">REQUEST BLOOD</h1><hr/><br/>
<form action="RequestBlood1" method="post">
Blood group::<input type="text" placeholder="Blood Group"  name="group" required/><br/><br/>
STOCK:<input type="text" placeholder="Stock in liter"  name="value" required/><br/><br/>
<button type="submit">request </button><br/>
</form>
	<form  action="UserHome.jsp" method="post">
	<button type="submit" value="submit" style="background-color:blue;width:50%;">USER HOME</button>
	</form><br/><br/>
		<h1 style="color:blue">**Your request **</h1><hr/><br/>
<table border="1" >
	
	<thead style="background-color:orange">
<tr>
	<th>Blood Group</th>
	<th>required stock</th>
	<th>bank id</th>
	<th>name</th>
	<th>Delete</th>
	
	</tr>
	</thead>
	<%
	try{
		Connection con=Connect.Sing();
		Statement s=con.createStatement();
		String k="SELECT * FROM request where uid='"+T.getId()+"'";
		ResultSet rs=s.executeQuery(k);
		while(rs.next()){
			System.out.println(rs.getString("bgroup"));
	%>
	<tbody style="background-color:yellow">
	<tr>
		<td><%= rs.getString("bgroup") %></td>
		<td><%= rs.getInt("stock") %></td>
		<td><%= rs.getString("bid") %></td>
		<td><%= rs.getString("bname") %></td>
		<td><a href="DeleteRequest.jsp?rid=<%= rs.getInt("rid") %>">delete</a></td>
		
	</tr>	
	</tbody>
	<%
	}
		}catch(Exception e){
		
	}
	%>
	
</table>
	</div>
</center>
</body>
</html>