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

String name,email,mob,password,cpassword,gender;
int age;
name = request.getParameter("t1");
email = request.getParameter("t2");
mob = request.getParameter("t3");
age = Integer.parseInt(request.getParameter("t4"));
password = request.getParameter("t5");
cpassword = request.getParameter("t6");
gender = request.getParameter("t7");


Class.forName("org.postgresql.Driver");

Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5433/cabs","postgres","Vaibhav@2001");



	
    if(email.contains("@")){
		
		
	   if(mob.length() == 10){
		
		   
		  if(age >= 18){
		
             if(password.length() >=7 && password.contains("@") || password.contains("#") || password.contains("$")){
	  		
			     
            	if(password.equals(cpassword)){
        	  		
        			
            		if(gender == null){
    					
  					  out.println("<script>");
  					   out.println("alert('Gender Selection is neccessary !')");
  					   out.println("window.location.href='Registration.html'");
  					   out.println("</script>");
  					
  					
  				     }else{
  				    	 
  				    	PreparedStatement ps = con.prepareStatement("insert into register (name,email,mob,age,password,cpassword,gender)values('"+name+"','"+email+"','"+mob+"','"+age+"','"+password+"','"+cpassword+"','"+gender+"')");
  					    ps.executeUpdate();
  					    
  				       	    out.println("<script>");
  				        	out.println("alert('Registration Successfull')");
  					        out.println("window.location.href='Login.html'");
  					        out.println("</script>");
  		   		      
  				          }
            		
        			
   		     }else{
   			     out.println("<script>");
   			     out.println("alert('Password And Confirm Password Doesn't Matched !')");
   			     out.println("window.location.href='Registration.html'");
   			     out.println("</script>");
   		      }
             
            	
			
		     }else{
			     out.println("<script>");
			     out.println("alert('Registration Failed Due to Invalid password (password should contain @,#,$ )')");
			     out.println("window.location.href='Registration.html'");
			     out.println("</script>");
		      }
      
		  }else{
			    out.println("<script>");
			    out.println("alert('Registration Failed couz you are under age !')");
			    out.println("window.location.href='Registration.html'");
			    out.println("</script>");
		  }
		
		
	     }else{
		    out.println("<script>");
		    out.println("alert('Registration Failed Due to Invalid Mobile Number')");
		    out.println("window.location.href='Registration.html'");
		    out.println("</script>");
      	}
		
		
	}else{
		  out.println("<script>");
		   out.println("alert('Registration Failed Due to Invalid email (email should contain @ )')");
		   out.println("window.location.href='Registration.html'");
		   out.println("</script>");
	}  
	

	


%>
</body>
</html>