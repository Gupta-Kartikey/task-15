<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ page isELIgnored="false" %>

<%String a="visible",b="hidden",c="hidden",d="hidden",ha="auto",hb="0",hc="0",hd="0";


if(request.getAttribute("update")!=null){
	if(request.getAttribute("update")=="working"){
		a="hidden";
		d="visible";
		ha="0";
		hd="auto";
	}
	else if(request.getAttribute("update")=="true"){
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
<title>Update Employee</title>
</head>
<body>
	<div style="visibility:<%=a %>;height:<%=ha%>">
		<h1>Update Employee</h1>
		<form action="GetUpdateEmployee" method="get" style="padding-left:100px">
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
		<h1>Update Employee:</h1>
		<form action="UpdateEmployee" style="padding-left:100px">
			<table style="width:75%" >
			  <tr>
			    <td>Id: </td>
			    <td><input type="number" name="eno" value="${employee.getEno()}"/></td>
			    
			  </tr>
			  <tr>
			    <td>Name: </td>
			    <td><input type="text" name="ename" value="${employee.getEname()}"/></td>
			    
			  </tr>
			  <tr>
			    <td>Salary:</td>
			    <td><input type="number" name="esal" value="${employee.getEsal()}"/></td>
			    
			  </tr>
			  <tr>
			    <td></td>
			    <td><button type="submit" name="submit">Update Employee</button></td>
			    
			  </tr>
			</table>
			
		</form>
		<a href="updateEmployee.jsp" >Go Back</a>
	</div>
	<div style="visibility:<%=b%>;height:<%=hb%>;">
		<h1>Employee updated Successfully</h1>
			<table style="width:75%" >
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
			  </table>
			<a href="index.jsp" >Home</a>
			<br>
			<a href="updateEmployee.jsp" >Go Back</a>
	</div>
	<div style="visibility:<%=c %>;height:<%=hc%>;text-align: center;">
		<h1>Employee Not found </h1>
		<br>			
		<a href="updateEmployee.jsp" >Go Back and Try Again</a>
		<br>
		<br>
		<a href="index.jsp" >Home</a>
			
	</div>
	<div></div>
	
</body>
</html>