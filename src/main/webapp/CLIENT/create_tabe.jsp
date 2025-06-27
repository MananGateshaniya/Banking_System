<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,java.util.*" %>    
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
 		s.execute("create table user(id integer primary key AUTO_INCREMENT, name varchar(20), atm_pininteger, account_no integer, balance integer, contact_no integer)");
		s.close();
		System.out.println("Table created successfully");
		con.close();
		}catch(Exception e)
		{
		System.out.println(e);
		}
	%>
</body>
</html>