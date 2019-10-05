<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ page import="com.genesis.beans.Emp" %>
<%
String a="visible",b="hidden",c="hidden",ha="auto",hb="0",hc="0";
if(request.getQueryString()!=null){
	if(((Emp)(request.getAttribute("info"))).getEno()!=-1){
		a="hidden";
		b="visible";
		ha="0";
		hb="auto";
	}
	else{
		a="hidden";
		c="visible";
		ha="0";
		hc="auto";
	}
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Employee</title>
</head>
<body>
	<div style="visibility:<%=a %>;height:<%=ha%>">
		<h1>Add Employee</h1>
		<hr>
		<form action="AddEmployee" style="padding-left:100px">
			<table style="width:75%" >
			  <tr>
			    <td>Id: </td>
			    <td><input type="text" name="eno" required></td>
			    
			  </tr>
			  <tr>
			    <td>Name: </td>
			    <td><input type="text" name="ename" required></td>
			    
			  </tr>
			  <tr>
			    <td>Salary:</td>
			    <td><input type="number" name="esal" required></td>
			    
			  </tr>
			  
			  <tr>
			    <td></td>
			    <td><button type="submit" name="submit">Add Employee</button></td>
			    
			  </tr>
			</table>
			
		</form>
		<a href="index.jsp">Go Back</a>
	</div>
	<div style="visibility:<%=b%>;height:<%=hb%>;">
		<h1>Employee Inserted Successfully</h1>
		<table style="width:75%" style="padding-left:100px" >
			  
			  <tr>
			    <td>Id: </td>
			    <td>${info.getEno()}</td>
			    
			  </tr>
			  <tr>
			    <td>Name: </td>
			    <td>${info.getEname()}</td>
			    
			  </tr>
			  <tr>
			    <td>Salary:</td>
			    <td>${info.getEsal()}</td>
			    
			  </tr>
			  
			 
			</table>
			
			<br>
			<a href="index.jsp" style="">Home</a>
			
			<br>
			<a href="addEmployee.jsp" style="">Add More</a>
	</div>
	<div style="visibility:<%=c %>;height:<%=hc%>;text-align: center;">
		<h1>Employee Not Inserted Please try Again</h1>
		<br>
		<a href="addEmployee.jsp" >Go Back and Try Again</a>
	</div>
</body>
</html>