<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
String c="hidden",hc="0";

if(request.getAttribute("employee")!=null){
	c="visible";
	hc="auto";
	session.setAttribute("employ", request.getAttribute("employee"));
}
	



%>
<html> 
<head> 
<meta charset=\"ISO-8859-1\"> 
<title>SearchEmployee</title> 
</head> 
<body>
	<div>
	<h1>Search Employee</h1>
	<h4>Search By</h4>
	<form action="GetEmployee" method="get" style="padding-left:100px">
		<table style="width:75%" >
		  
		  
		  <tr>
		    <td>No: </td>
		    <td><input type="number" name="eno" ></td>
		    
		  </tr>
		  
		  <tr>
		    <td></td>
		    <td><button type="submit" name="submit">Search</button></td>
		    
		  </tr>
		</table>
		
	</form>
	</div>
	<div style="visibility:<%=c %>;height:<%=hc%>"> 
	<h4>Employee Details</h4>
		<table style="width:75%;table-layout: fixed;text-align: center;" >
			<tr> 
		    <th>Eno </th> 
		    <th>Name</th> 
		    <th>Salary</th> 
		     
		     
		  </tr>
		<%
		if(c.equals("visible")){
			%>
			<tr> 
			   <td>${employee.getEno()}</td> 
			   <td>${employee.getEname()}</td> 
			   <td>${employee.getEsal()}</td> 
			   
			</tr>
			<%	
				
		}
		%>

	
		</table> 
		<br> 
		<br>
		<a href="index.jsp">Home</a> 
	</div>
		



	
</body>
</html>