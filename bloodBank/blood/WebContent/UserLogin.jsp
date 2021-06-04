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
<h1 style="color:red">USER LOGIN</h1><hr/><br/>
	<form action="UserLogin" method="post">
	UserId:<br><input type="text" placeholder="username" name="username1" style="background-color:orange" required/><br/>
	Password:<br><input type="password" placeholder="password" name="password1" style="background-color:orange" required/><br/><br/>
	<button type="submit" value="submit" style="background-color:orange;width:50%;">Login</button>
	</form><br/><br/>
	<form action="Register.jsp">
	<button type="submit" value="submit" style="background-color:orange;width:50%;">NEW HERE?</button>
	</form><br/><br/>
	
</div>
</center>
</body>
</html>