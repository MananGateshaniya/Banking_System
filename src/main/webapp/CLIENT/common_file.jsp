<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*,java.util.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
	<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>
<body>
	<%
		int account_no = (Integer)session.getAttribute("account_no");
		String name="";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_atm","root","");
		Statement s=con.createStatement();
		ResultSet rs = s.executeQuery("select * from user where account_no = "+account_no+" ");
		if(rs.next())
		{
		name= rs.getString(2);
		}
		else
		{
		out.print(" can not Login....");
		}
	%>
	
	<div class="container-xl-fluid">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					<a class="navbar-brand text-success" href="#">Welcome To Banking</a>
					<ul class="navbar-nav ml-auto">
						<li class="nav-item">
							<a class="nav-link text-success" href="#">welcome <%=name %></a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3">
				<div class="card">
					<ul class="list-group list-group-flush">
						<li class="list-group-item" style="height:80px; padding:20px;"><a href='profile_update.jsp'>ProfileUpdate</a></li>
						<li class="list-group-item" style="height:80px; padding:20px;"><a href='withdraw_jsp.jsp'>WithdrawAmount</a></li>
						<li class="list-group-item" style="height:80px; padding:20px;"><a href='deposit.jsp'>DepositAmount</a></li>
						<li class="list-group-item" style="height:80px; padding:20px;"><a href='show_db.jsp'>ViewAccountdetail</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>