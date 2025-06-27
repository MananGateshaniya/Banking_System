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
	<%@ include file="index.jsp" %>
	<%
	try{
	//int p_id=Integer.parseInt(request.getParameter("p_id"));
	name = request.getParameter("uname");
	int atm_pin= Integer.parseInt(request.getParameter("atm_pin"));
	String contact_no= request.getParameter("contact_no");
	int i=s.executeUpdate("update user set name = '"+name+"', atm_pin="+atm_pin+", contact_no="+contact_no+" where account_no = '"+account_no+"' ");
	if(i>0)
	{
	%>
	<script>
		alert('User updated Successfully...........');
		window.location='index.jsp';
	</script>
	<%
		}
		else
		{
		out.print("data not updated successfully...");
		}
		}
		catch (Exception e){
		System.out.print(e);
		}
	%>
</body>
</html>