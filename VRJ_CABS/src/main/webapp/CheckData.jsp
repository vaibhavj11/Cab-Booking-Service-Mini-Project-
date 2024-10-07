<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    
    <%
    
    String a,b;

    a=request.getParameter("t2");
    b=request.getParameter("t5");

    Class.forName("org.postgresql.Driver");
    Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5433/cabs","postgres","Vaibhav@2001");

    Statement st = con.createStatement();
    ResultSet rs=st.executeQuery("select * from register where email='"+a+"'and password='"+b+"'");

    if(rs.next())
    {
    	HttpSession s1 = request.getSession();
    	s1.setAttribute("temp",a);
    	 out.println("<script>");
    	 out.println("alert('Login Successfull')");
    	 out.println("window.location.href='index.html'");	 
    	 out.println("</script>");
    }
    else
    {
    	 out.println("<script>");
    	 out.println("alert('Login Fail')");
    	 out.println("window.location.href='Login.html'");	 
    	 out.println("</script>");
    	
    }


    %>
    
</body>
</html>