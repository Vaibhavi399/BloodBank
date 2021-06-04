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
<h1 style="color:red">VIEW REQUEST</h1><hr/><br/>
<table border="1" >
<thead style="background-color:orange">
<tr>
	<th>user Id</th>
	<th>Blood Group</th>
	<th>required stock</th>
	<th>accept</th>
	<th>reject</th>
	</tr>
	</thead>
	<%
	try{
		Connection con=Connect.Sing();
		Statement s=con.createStatement();
		String k="SELECT * FROM request where bid='"+T.getId()+"'";
		ResultSet rs=s.executeQuery(k);
		while(rs.next()){
			System.out.println(rs.getString("bgroup"));
	%>
	<tbody style="background-color:yellow">
	<tr>
		<td><%= rs.getString("uid") %></td>
		<td><%= rs.getString("bgroup") %></td>
		<td><%= rs.getInt("stock") %></td>
		<td><a href="Accept.jsp?rid=<%=rs.getInt("rid")%>&uid=<%=rs.getString("uid")%>&stock=<%=rs.getInt("stock")%>&bgroup=<%=rs.getString("bgroup")%>">accept</a></td>
		<td><a href="Reject.jsp?rid=<%=rs.getInt("rid")%>">Reject</a></td>
		
	</tr>	
	</tbody>
	<%
	}
		}catch(Exception e){
		
	}
	%>
	
</table>
	<form  action="BankHome.jsp" method="post">
	<button type="submit" value="submit" style="background-color:blue;width:50%;">BANK HOME</button>
	</form><br/><br/>
	</div>
</center>
</body>
</html>