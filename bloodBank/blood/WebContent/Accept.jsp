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
System.out.println("==================================");
String kll=request.getParameter("bgroup");
System.out.println(kll);
	try{
		int update=0;
		Connection con=Connect.Sing();
		
		
		Statement s=con.createStatement();
		String k="SELECT * FROM stock Where bid='"+T.getId()+"' and bgroup='"+request.getParameter("bgroup")+"'";
		//System.out.println(request.getParameter("bgroup"));
		ResultSet rs=s.executeQuery(k);
		if(rs.next()){
			update=rs.getInt(4);
		}
		update=update-Integer.parseInt(request.getParameter("stock"));
		//System.out.println(request.getParameter("bgroup"));
		String g="Update stock set stock=? where bid='"+T.getId()+"' and bgroup='"+request.getParameter("bgroup")+"'";
		PreparedStatement s1=con.prepareStatement(g);
		s1.setInt(1,update);
		int i=s1.executeUpdate();
		if(i>0){
			/////////////
			Statement ss=con.createStatement();
			int rid=0,stock=0;
			String bname="",bgroup="",bid="",uid="";
			String kk="SELECT * FROM request Where rid='"+request.getParameter("rid")+"'";
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
			ppk.setString(6,"Accepted");
			ppk.executeUpdate();
			/////////////////
			PreparedStatement pp=con.prepareStatement("insert into status(rid,bid,bname,bgroup,stock,uid,status) values(?,?,?,?,?,?,?)");
			pp.setInt(1,rid);
			pp.setString(2,bid);
			pp.setString(3,bname);
			pp.setString(4,bgroup);
			pp.setInt(5,stock);		
			pp.setString(6,uid);
			pp.setString(7,"Accepted");
			pp.executeUpdate();
			/////////////
			PreparedStatement ps=con.prepareStatement("delete from request where rid='"+request.getParameter("rid")+"'");
			response.sendRedirect("ViewRequest.jsp");
			ps.executeUpdate();
		}else{
			response.sendRedirect("error.html");
		}
		
	}catch(Exception e){
		System.out.println(e);
	}
%>
</body>
</html>