<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
try 
{
	Class.forName("org.postgresql.Driver");
} 
catch (ClassNotFoundException e) 
{
	e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<!DOCTYPE HTML>

<html>

<head>

<title>Photographer</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<style>
body{
		background-color:pink;
}
</style>

</head>

<body bgcolor="pink">

<h3>${message }</h3>

<table border="1px">

<tr>
<td><h3>Photographer Name</h3></td>
<td><h3>Prefferable For</h3></td>
<td><h3>Update</h3></td>
<td><h3>Delete</h3></td>

</tr>
<%
try
{
	connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/eventmanage","postgres","mcasc05");
	statement=connection.createStatement();
	String sql ="select * from Photographer";
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){
		
%>
<tr>
<td><h3><%=resultSet.getString("PNAME") %></h3></td>
<td><h3><%=resultSet.getString("PPREFF")%></h3></td>
<td><h3><a href="photoUpdate.jsp?pname=<%=resultSet.getString("PNAME") %>&id=<%=resultSet.getString("pid")%>"><button class="button button1">Edit</button></a><h3></td>
<td><a href="photoDeleteServlet?pname=<%=resultSet.getString("PNAME") %>&id=<%=resultSet.getString("pid")%>"><button class="button button1">Delete</button></a></td>

</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</table>
<br><br><br>
&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp <a href="addPhoto.jsp"> <button type="button">Add New</button></a>

</body>

</html>