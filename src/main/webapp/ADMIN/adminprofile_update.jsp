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
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_atm", "root", "");
        String uname = request.getParameter("uname");
        String password = request.getParameter("psw");

        PreparedStatement pst = con.prepareStatement("SELECT * FROM admin WHERE username = ? AND password = ?");
        pst.setString(1, uname);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            session.setAttribute("adminusername", uname);
            response.sendRedirect("home.jsp");
        } else {
            out.println("<p style='color:red;'>Invalid username or password</p>");
        }

        rs.close();
        pst.close();
        con.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
%>

</body>
</html>