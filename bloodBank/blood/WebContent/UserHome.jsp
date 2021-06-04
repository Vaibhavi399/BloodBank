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
<div style="background-color:rgb(229,232,232);max-width:50%"><br/><br/>
<h1 style="color:red">welcome <%= T.getName() %></h1><hr/><br/>
	<form  action="ViewDonationCamp.jsp" method="post">
	<button type="submit" value="submit" style="background-color:orange;width:50%;">View Donation Camp</button>
	</form><br/><br/>
	<form  action="ViewBloodBank.jsp" method="post">
	<button type="submit" value="submit" style="background-color:orange;width:50%;">View blood Bank</button>
	</form><br/><br/>
	<form  action="RequestBlood1.jsp" method="post">
	<button type="submit" value="submit" style="background-color:orange;width:50%;">request Blood</button>
	</form><br/><br/>
	<form  action="index.jsp" method="post">
	<button type="submit" value="submit" style="background-color:blue;width:50%;">log out</button>
	</form><br/><br/>
	<h1 style="color:blue">**Your request Status **</h1><hr/><br/>
<table border="1" >
	
	<thead style="background-color:orange">
<tr>
	<th>rid</th>
	<th>bid</th>
	<th>bname</th>
	<th>bgroup</th>
	<th>stock</th>
	<th>status</th>
	<th>Delete</th>
	
	</tr>
	</thead>
	<%
	try{
		Connection con=Connect.Sing();
		Statement s=con.createStatement();
		String k="SELECT * FROM status where uid='"+T.getId()+"'";
		ResultSet rs=s.executeQuery(k);
		while(rs.next()){
			System.out.println(rs.getString("bgroup"));
	%>
	<tbody style="background-color:yellow">
	<tr>
		<td><%= rs.getInt("rid") %></td>
		<td><%= rs.getString("bid") %></td>
		<td><%= rs.getString("bname") %></td>
		<td><%= rs.getString("bgroup") %></td>
		<td><%= rs.getInt("stock") %></td>
		<td><%= rs.getString("status") %></td>
		<td><a href="DeleteStatus.jsp?rid=<%= rs.getInt("rid") %>">delete</a></td>
		
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