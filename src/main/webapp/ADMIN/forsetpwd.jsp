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
			String email = request.getParameter("email");
			ResultSet rs = s.executeQuery("select * from admin where email = '"+email+"' ");
			if(rs.next())
			{
				String npsw =request.getParameter("npsw");
				String cpsw =request.getParameter("cpsw");
				if(npsw.compareTo(cpsw)==0){
				int i=s.executeUpdate("update admin set password = '"+npsw+"' where email ='"+email+"' ");
				if(i>0)
				{			
	%>
	<script>
		alert('password changed Successfully...........');
		window.location='index.jsp';
	</script>
	<%
	}
	else
	{
	%>
	<script>
		alert('password can"'t changed Successfully...........');
		window.location='forgetpassword.jsp';
	</script>
	<%
	}
	}
	else{
	%>
	<script>
		alert('Password & Confirm Password both are not same');
		window.location='forgetpassword.jsp';
	</script>
	<%
	}
	}
	}
	catch (Exception e){
	e.printStackTrace();
	}
	%>
</body>
</html>