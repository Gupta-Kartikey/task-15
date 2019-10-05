<%@page import="java.util.List"%>
<%@page import="com.genesis.beans.Emp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View All Employees</title>
</head>
<body>
	<div > 
	<h1>Employee Details</h1>
		<table style="width:75%;table-layout: fixed;text-align: center;" >
			<tr> 
		    <th>Eno </th> 
		    <th>Name</th> 
		    <th>Salary</th> 
		     
		     
		  </tr>
<%
for(Emp emp:(List<Emp>)request.getAttribute("emps")){
	%>
	<tr> 
	   <td><%= emp.getEno()%></td> 
	   <td><%= emp.getEname()%></td> 
	   <td><%= emp.getEsal()%></td> 
	   
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