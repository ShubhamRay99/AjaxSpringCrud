<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SpringBoot</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="/table.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
* {
	text-align: center;
}

body {
  font: 16px Times New Roman;  
}

h2,table{
	margin-top: 70px;
	align: center;
}

input {
  left: 50%;
  border: 1px solid transparent;
  background-color: #f1f1f1;
  padding: 10px;
  font-size: 16px;
  margin-top: 40px;
}

input[type=text] {
  background-color: #f1f1f1;
}

input[type=submit] {
  background-color: DodgerBlue;
  color: #fff;
  cursor: pointer;
}

</style>

</head>
<body>


	<h2>Spring Boot</h2>
  	<p>The data gets inserted to the table with the click of this button: And the delete button uses ajax to perform its desired operation</p>

    	<form method="post" action="/addToTable">
	    	<input id="FirstName" type="text" name="fname" placeholder="First Name" required="required">
	    	<input id="LastName" type="text" name="lname" placeholder="Last Name" >
	    	<input id="email" type="email" name="email" placeholder="Email" required="required">
			<input type="submit" onclick="storeToTable" value="Add To List">
		</form>
		
<div class="w3-container">
  
  <table class="w3-table w3-striped w3-bordered w3-hoverable" id="tableData">
    <tr>
      <th>First Name</th>
      <th>Last Name</th>
      <th>Email</th>
    </tr>
    <c:forEach items="${allUsers}" var="users">
    <tr>
      <td><c:out value="${users.fname}"/></td>
      <td><c:out value="${users.lname}"/></td>
      <td><c:out value="${users.email}"/></td>
      <td><Button onclick="deleting(${users.id})">Delete</Button></td>
    </tr>
    </c:forEach>
  </table>
</div>
		
</body>
</html>