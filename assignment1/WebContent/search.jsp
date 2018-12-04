<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>search</title>
</head>

<body>
<%@ include file="sideNavigation.jsp"%>

<div id="main">
	<%@ include file="header.html"%>

	<center>
	<form action="control" method="POST">
		<h4>Find entries with...</h4>
		<select name="tagName">
			<option value="agency">Agency</option>
			<option value="headline">Headline</option>
			<option value="date">Date</option>
			<option value="city">City</option>
			<option value="text">Content</option>
		</select>
		<input name=searchValue type="text" />
		<input id="normalSearch" type="submit" value="Search &#128269;" />
	</form><br/>
	
	<form action="advancedSearch.jsp" method="POST">
		<button type="submit">Advanced Search &#8658;</button>
	</form>
	</center>
</div>
</body>

</html>