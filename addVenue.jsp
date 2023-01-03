<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>

<html>

<head>

<title>Add Venue</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
	input[type=submit],input[type=reset]
	{
		background-color:red;
	}
	body{
		background-color:pink;
	}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>

<body bgcolor="pink">

<h1>Add Venue</h1><br><br>

<form action="AddVenue" method="POST" enctype="multipart/form-data">

<table>

	<tr>
		<td>Venu Name<br><br></td>
		<td><input type="text" name="V_name" required><br><br></td> 
		<td>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp  Approx.Capacity &nbsp &nbsp </td>  
		<td><input type="number" name="V_capacity" required><br><br></td>
	</tr>
	<tr>
		<td>Address<br><br></td>
		<td><textarea id="addr" name="V_addr" rows="4" cols="30" required></textarea><br><br></td> 
		<td>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp State<br><br></td>
		<td><input type="text" name="V_state" required><br><br></td>
		<td>&nbsp &nbsp District<br><br></td>
		<td><input type="text" name="V_dist" required><br><br></td>
		<td>&nbsp &nbsp City &nbsp &nbsp <br></td> 
		<td><input type="text" name="V_city" required><br><br></td> 
		<td>&nbsp &nbsp Area &nbsp &nbsp <br></td>  
		<td><input type="text" name="V_area" required><br><br></td>
	</tr>
	<tr>
	<td>Preferred For<br><br></td> 
						<td><select name="V_preff" required>
	
						<option>Select Prefence</option>
	
						<option value="Marriage">Marriage</option>
						<option value="Engagement">Engagement</option>
						<option value="Birthday">Birthday</option>
						<option value="Anniversary">Anniversary</option>
						<option value="Get Toghether">Get Together</option>
						<option value="Corporate Event">Corporate Event</option>
						<option value="Comapany Event">Company Event</option>
						<option value="College Event">College Event</option>
		
				   </select><br><br></td>

	<td>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp Rate<br><br></td> 
	<td><input type="number" name="V_rate" required><br><br></td>
	<td>&nbsp &nbsp Phoneno.<br><br><br></td> 
	<td><input type="tel" name="V_phone" required><br><br></td>
	
	</tr>
	<tr>
	<td>Email<br><br></td>
	<td><input type="email" name="V_email" required><br><br></td>
	</tr>
	<tr>
	<td>Images<br><br></td>
	<td><input type="file" name="V_Images" multiple required><br><br></td>
	<tr>
	<tr>
	<td><input type="submit" value="Submit"/></td>
	<td><input type="reset" value="Cancel"/></td>

</table>

</form>

</body>

</html>