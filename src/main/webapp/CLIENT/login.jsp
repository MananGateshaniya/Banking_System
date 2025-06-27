<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*,java.util.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_atm","root","");
		Statement s=con.createStatement();
		int atm_pin = Integer.parseInt(request.getParameter("atm_pin"));
		int account_no = Integer.parseInt(request.getParameter("acc_no"));
		ResultSet rs = s.executeQuery("select * from user where atm_pin = "+atm_pin+" and account_no="+account_no+" ");
		session.setAttribute("account_no",account_no);
		if(rs.next())
		{
		response.sendRedirect("index.jsp");
		}
		else
		{
		out.print(" invalid account_no or password...");
		}
		}
		catch (Exception e){
		out.print(e);
		}
	%>
</body>
</html>