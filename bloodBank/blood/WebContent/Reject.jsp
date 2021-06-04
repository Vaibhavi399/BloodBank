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
<body>
<br/><br/><br/><br/>
<%
	try{
			Connection con=Connect.Sing();
			String r=request.getParameter("rid");
			int rid=Integer.parseInt(r);
			Statement ss=con.createStatement();
			int stock=0;
			
			String bname="",bgroup="",bid="",uid="";
			String kk="SELECT * FROM request Where rid='"+rid+"'";
			//System.out.println(request.getParameter("bgroup"));
			ResultSet rss=ss.executeQuery(kk);
			if(rss.next()){
						rid=rss.getInt("rid");
						stock=rss.getInt("stock");
						uid=rss.getString("uid");
						bname=rss.getString("bname");
						bgroup=rss.getString("bgroup");
						bid=rss.getString("bid");
			}
			//////////////////
			PreparedStatement ppk=con.prepareStatement("insert into bstatus(rid,bid,bgroup,stock,uid,status) values(?,?,?,?,?,?)");
			ppk.setInt(1,rid);
			ppk.setString(2,bid);
			ppk.setString(3,bgroup);
			ppk.setInt(4,stock);		
			ppk.setString(5,uid);
			ppk.setString(6,"Rejected");
			ppk.executeUpdate();
			/////////////////
			PreparedStatement pp=con.prepareStatement("insert into status(rid,bid,bname,bgroup,stock,uid,status) values(?,?,?,?,?,?,?)");
			pp.setInt(1,rid);
			pp.setString(2,bid);
			pp.setString(3,bname);
			pp.setString(4,bgroup);
			pp.setInt(5,stock);		
			pp.setString(6,uid);
			pp.setString(7,"Rejected");
			int i=pp.executeUpdate();

			if(i>0){
	/////////////
	/////////////
				
				/////////////
				String sql="DELETE FROM request WHERE rid=?";
			System.out.println("===========================");
			System.out.println(rid);

			System.out.println("===========================");
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1,rid);
			ps.executeUpdate();
				response.sendRedirect("ViewRequest.jsp");
			}else{
				response.sendRedirect("error.html");
			}
	}catch(Exception e){
		System.out.println("error========="+e);
	}
%>
</body>
</html>