<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ page isELIgnored="false" %>

<%String a="visible",b="hidden",c="hidden",d="hidden",ha="auto",hb="0",hc="0",hd="0";


if(request.getAttribute("delete")!=null){
	if(request.getAttribute("delete")=="working"){
		a="hidden";
		d="visible";
		ha="0";
		hd="auto";
	}
	else if(request.getAttribute("delete")=="true"){
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
<title>Delete Employee</title>
</head>
<body>
	<div style="visibility:<%=a %>;height:<%=ha%>">
		<h1>Delete Employee</h1>
		<form action="GetDelEmployee" method="get" style="padding-left:100px">
			<table style="width:75%" >
			  
			  <tr>
			    <td>Id: </td>
			    <td><input type="number" name="eno" required></td>
			    
			  </tr>
			  
			  <tr>
			    <td></td>
			    <td><button type="submit" name="submit">Fetch Employee</button></td>
			    
			  </tr>
			</table>
			
		</form>
		<br>
		<a href="index.jsp" >Home</a>
	</div>
	<div style="visibility:<%=d %>;height:<%=hd%>">
		<h1>Are you sure to delete Employee:</h1>
		<form action="DeleteEmployee" style="padding-left:100px">
			<table style="width:75%" >
			  <tr style="visibility:hidden;">
			   <td><input type="number" readonly="readonly" name="eno" value="${employee.getEno()}"/></td>
			    
			  </tr>
			   <tr>
			    <td>Id: </td>
			    <td>${employee.getEno()}</td>
			    
			  </tr>
			  <tr>
			    <td>Name: </td>
			    <td>${employee.getEname()}</td>
			    
			  </tr>
			  <tr>
			    <td>Salary:</td>
			    <td>${employee.getEsal()}</td>
			    
			  </tr>
			  <tr>
			    <td></td>
			    <td><button type="submit" name="submit">Delete Employee</button></td>
			    
			  </tr>
			</table>
			
		</form>
		<a href="deleteEmployee.jsp" >Go Back</a>
	</div>
	<div style="visibility:<%=b%>;height:<%=hb%>;">
		<h1>Employee Deleted Successfully</h1>
		
			<a href="index.jsp" >Home</a>
			<br>
			<a href="deleteEmployee.jsp" >Go Back</a>
	</div>
	<div style="visibility:<%=c %>;height:<%=hc%>;text-align: center;">
		<h1>Employee Not found </h1>
		<br>			
		<a href="deleteEmployee.jsp" >Go Back and Try Again</a>
		<br>
		<br>
		<a href="index.jsp" >Home</a>
			
	</div>
	<div></div>
	
</body>
</html>