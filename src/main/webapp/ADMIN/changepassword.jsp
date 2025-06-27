<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Banking System</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
	<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
	<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/js/jquery.validate.min.js"></script>
	<style>
		body{
			width: 100%;
			overflow-x: hidden;
		}
	</style>
</head>
<body>
	<div class="container">
		<div class="row mx-5 my-5 border p-5 border-secondary" style="border-radius: 10px; background-color:whitesmoke;">
			<div class="col-md-8 of set-md-2" >
				<h2 class="text-center">Reset Your Password</h2>
				<form action="forsetpwd.jsp" method="POST">
					<div class="form-group">
						<label for="email">email</label>
						<input type="text" class="form-control" id="email" name="email" placeholder="Enter newpassword Here">
					</div>
					<br>
					<div class="form-group">
						<label for="password">New password</label>
						<input type="password" class="form-control" id="password" name="npsw" placeholder="Enternewpassword Here">
						<br>
						<br>
						<label for="c_password">Confirm password</label>
						<input type="password" class="form-control" id="c_password" name="cpsw" placeholder="Enternewpassword Here">
						<br>
						<br>
						<input type="submit">
					</div>
				</form>
			</div>
		</div>
	</div>
	<%
		try
		{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_atm","root","");
		Statement s=con.createStatement();
		String opsw = request.getParameter("opsw");
		if(opsw !=null){
		String email=(String)session.getAttribute("adminemail");
		ResultSet rs = s.executeQuery("select * from admin where password = '"+opsw+"' ");
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
		window.location='commonpage.jsp';
	</script>
	<%
		}
		else
		{
	%>
	<script>
		alert('password can"'t changed Successfully...........');
		window.location='changepassword.jsp';
	</script>
	<%
		}
		}
		else{
	%>
	<script>
		alert('Password & Confirm Password both are not same');
		window.location='changepassword.jsp';
	</script>
	<%
		}
		}
		else{
	%>
	<script>
		alert('Your Old Password is not match');
		window.location='changepassword.jsp';
	</script>
	<%
		}}
		}
		catch (Exception e){
		e.printStackTrace();
		}
	%>
</body>
</html>