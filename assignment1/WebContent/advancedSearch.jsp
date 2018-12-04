<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<style>
label {
	display: inline-block;
	width: 150px;
	text-align: left;
}
input {
	width: 250px;
}
</style>

<head>
<title>advancedSearch</title>
</head>

<body>
<%@ include file="sideNavigation.jsp"%>

<div id="main">
	<%@ include file="header.html"%>
	
	<center>
	<form action="control" method="POST">
		<h4>Find entries with...</h4>
		<label>     Keywords:</label><input type="text" name="keywords" /><br/>
		<label>       People:</label><input type="text" name="people" /><br/>
		<label>Organizations:</label><input type="text" name="organizations" /><br/>
		<label>    Locations:</label><input type="text" name="locations" /><br/>
		<label>			     </label><input type="submit" value="Search &#128269;" />
	</form><br/>
	
	<form action="search.jsp" method="POST">
		<button type="submit">&#8656; Normal Search</button>
	</form>
	</center>
</div>
</body>

</html>