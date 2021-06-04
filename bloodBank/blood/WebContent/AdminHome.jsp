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
<h1 style="color:red">ADMIN HOME</h1><hr/><br/>
	<form  action="AddBloodBank.jsp" method="post">
	<button type="submit" value="submit" style="background-color:orange;width:50%;">Add Blood Bank</button>
	</form><br/><br/>
	<form  action="ViewBloodBank.jsp" method="post">
	<button type="submit" value="submit" style="background-color:orange;width:50%;">View blood Bank</button>
	</form><br/><br/>
	<form  action="ViewUser.jsp" method="post">
	<button type="submit" value="submit" style="background-color:orange;width:50%;">View Users</button>
	</form><br/><br/>
	<form  action="DeleteBloodBank.jsp" method="post">
	<button type="submit" value="submit" style="background-color:orange;width:50%;">Delete blood bank</button>
	</form><br/><br/>
	<form  action="AddHealthTeeps.jsp" method="post">
	<button type="submit" value="submit" style="background-color:orange;width:50%;">Add health teeps</button>
	</form><br/><br/>
	<form  action="DeleteHealthTeeps.jsp" method="post">
	<button type="submit" value="submit" style="background-color:orange;width:50%;">Delete Health Teeps</button>
	</form><br/><br/>
	<form  action="index.jsp" method="post">
	<button type="submit" value="submit" style="background-color:blue;width:50%;">log out</button>
	</form><br/><br/>
</div>
</center>

</body>
</html>