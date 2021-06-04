<%@page import="DbHandler.*"%>
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
<h1 style="color:red">BANK HOME</h1><hr/>
<h2 style="color:red"><%= T.getName() %><home></h2><br/>
	<form  action="AddCamp.jsp" method="post">
	<button type="submit" value="submit" style="background-color:orange;width:50%;">Add Camp</button>
	</form><br/><br/>
	<form  action="ViewCamp.jsp" method="post">
	<button type="submit" value="submit" style="background-color:orange;width:50%;">View Camp</button>
	</form><br/><br/>
	<form  action="DeleteCamp.jsp" method="post">
	<button type="submit" value="submit" style="background-color:orange;width:50%;">Delete Camp</button>
	</form><br/><br/>
	<form  action="UpdateStock.jsp" method="post">
	<button type="submit" value="submit" style="background-color:orange;width:50%;">Update Stock</button>
	</form><br/><br/>
	<form  action="ViewRequest.jsp" method="post">
	<button type="submit" value="submit" style="background-color:orange;width:50%;">View Request</button>
	</form><br/><br/>
	<form  action="ViewStatus.jsp" method="post">
	<button type="submit" value="submit" style="background-color:orange;width:50%;">View Status</button>
	</form><br/><br/>
	<form  action="index.jsp" method="post">
	<button type="submit" value="submit" style="background-color:blue;width:50%;">log out</button>
	</form><br/><br/>
	
</div>
</center>

</body>
</html>