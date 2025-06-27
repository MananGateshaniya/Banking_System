<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
	
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_atm", "root", "");
			Statement s = con.createStatement();
			
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			ResultSet rs = s.executeQuery("select * from admin where email = '" + email + "' and password='" + password + "' ");
			session.setAttribute("adminemail", email);
			if (rs.next()) {
				out.print("Login successfully....");
				response.sendRedirect("home.jsp");
			} else {
				out.print(" invalid account_no or password...");
			}
		} catch (Exception e) {
			System.out.print(e);
		}
	%>
</body>
</html>