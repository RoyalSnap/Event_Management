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

<title>Venue</title>

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
<td><h3>Venue</h3></td>
<td><h3>Preferable For<h3></td>
<td><h3>Area<h3></td>
<td><h3>Update</h3></td>
<td><h3>Delete</h3></td>

</tr>
<%
try
{
	connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/eventmanage","postgres","mcasc05");
	statement=connection.createStatement();
	String sql ="select * from Venue";
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){
		
%>
<tr>
<td><h3><%=resultSet.getString("VNAME") %></h3></td>
<td><h3><%=resultSet.getString("Vpreferable_for") %></h3></td>
<td><h3><%=resultSet.getString("Varea") %></h3></td>

<td><a href="venueUpdate.jsp?name=<%=resultSet.getString("VNAME") %>&id=<%=resultSet.getString("vid")%>"><button class="button button1">Edit</button></a></td>
<td><a href="venueDeleteServlet?vname=<%=resultSet.getString("VNAME") %>&id=<%=resultSet.getString("vid")%>"><button class="button button1">Delete</button></a></td>

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
&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp <a href="addVenue.jsp"> <button type="button">Add New</button></a>

</body>

</html>