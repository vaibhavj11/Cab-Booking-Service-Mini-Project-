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

String name,email,mobile,address,state,zipcode,gender,password,cpassword,msg;
int age ;
name = request.getParameter("t1");
email = request.getParameter("t2");
mobile = request.getParameter("t3");
address = request.getParameter("t4");
state = request.getParameter("t5");
zipcode = request.getParameter("t6");
gender = request.getParameter("t7");
age = Integer.parseInt(request.getParameter("t8"));
password = request.getParameter("t9");
cpassword = request.getParameter("t10");
msg = request.getParameter("t11");



Class.forName("org.postgresql.Driver");

Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5433/cabs","postgres","Vaibhav@2001");



	
    if(email.contains("@")){
		
		
	   if(mobile.length() == 10){
		
		   if(gender != null){
				
				 if(age >= 23){
		   
             if(password.length() >=7 && password.contains("@") || password.contains("#") || password.contains("$")){
	  		
			     
            	if(password.equals(cpassword)){
        	  		
            		PreparedStatement ps = con.prepareStatement("insert into driver (name,email,mobile,address,state,zipcode,gender,age,password,cpassword,msg)values('"+name+"','"+email+"','"+mobile+"','"+address+"','"+state+"','"+zipcode+"','"+gender+"','"+age+"','"+password+"','"+cpassword+"','"+msg+"')");
					    ps.executeUpdate();
					    
				       	    out.println("<script>");
				        	out.println("alert('Registration Successfull')");
					        out.println("window.location.href='index.html'");
					        out.println("</script>");
		   		      
        			
            		
  					
  				     }else{
  				    	 
  				    	 out.println("<script>");
  		   			     out.println("alert('Password And Confirm Password Doesn't Matched !')");
  		   			     out.println("window.location.href='Driver_Registration.html'");
  		   			     out.println("</script>");
  				          }
            		
        			
   		     }else{
   		    	 out.println("<script>");
	   			     out.println("alert('Password should contain @,$,# !')");
	   			     out.println("window.location.href='Driver_Registration.html'");
	   			     out.println("</script>");
			          }
             
   		      }else{
     		    	out.println("<script>");
     			     out.println("alert('Age of the driver should be greater than 23!')");
     			     out.println("window.location.href='Driver_Registration.html'");
     			     out.println("</script>");  
      		      }
            	
		     }else{
			     
			     out.println("<script>");
  			     out.println("alert('Please select gender of the driver !')");
  			     out.println("window.location.href='Driver_Registration.html'");
  			     out.println("</script>");  
		      }
      
		  
		
		
	     }else{
		    out.println("<script>");
		    out.println("alert('Registration Failed Due to Invalid Mobile Number')");
		    out.println("window.location.href='Driver_Registration.html'");
		    out.println("</script>");
      	}
		
    }
	else{
		  out.println("<script>");
		   out.println("alert('Registration Failed Due to Invalid email (email should contain @ )')");
		   out.println("window.location.href='Driver_Registration.html'");
		   out.println("</script>");
	}  
	
	
	


%>
</body>
</html>