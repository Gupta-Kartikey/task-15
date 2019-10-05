<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Last Searched Employee</title>
</head>
<body>
	<h1>Last Searched Employee</h1>
	<%
	if(session.getAttribute("employee")==null){
		%>
		<h4>No Data Found</h4>
		<%
	}
	else{
	%>
		<table style="width:75%" >
		  <tr>
		    <td>Id: </td>
		    <td>${employ.getEno()}</td>
		    
		  </tr>
		  <tr>
		    <td>Name: </td>
		    <td>${employ.getEname()}</td>
		    
		  </tr>
		  <tr>
		    <td>Salary:</td>
		    <td>${employ.getEsal()}</td>
		    
		  </tr>
		  
		</table>
	<%
	}
	%>
	<br>
	<a href="index.jsp" >Home</a>
</body>
</html>