<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="web.app.eng.*" %>
<jsp:useBean id="news" class="web.app.eng.NewsBean" scope="session" />

<html>

<head>
<title>welcome</title>
</head>

<body>
<%@ include file="sideNavigation.jsp"%>

<div id="main">
	<%@ include file="header.html"%>
	
	<%
	String input = request.getParameter("nRows");
	int n;
	try {
		n = Integer.parseInt(input);
	}
	catch (NumberFormatException e) {
		n = 10;
	}
	if (n > news.getLength()) {
		n = news.getLength();
	}
	Integer[] indexes = news.getRandomIndexes(n);
	%>
	
	<center>
	<form method="POST">
		Displaying <input name="nRows" type="text" value="<%= n %>"> items.
		<input type="submit" value="Reload">
	</form>
	</center><br/>
	
	<table align="center" border="1" width="80%">
		<col width="5%" />
		<col width="10%" />
		<col width="5%" />
		<col width="80%" />
		<tr>
			<th>No.</th>
			<th>City</th>
			<th>Year</th>
			<th>Headline</th>
		</tr>
		<%
		for (int i=0; i<n; i++) {
			%>
			<tr>
				<td align="center"><%= i + 1 %></td>
				<td align="center"><%= news.getTagValue(indexes[i], "city") %></td>
				<td align="center"><%= news.getTagValue(indexes[i], "date").substring(0, 4) %></td>
				<td><%= news.getTagValue(indexes[i], "headline") %></td>
			</tr>
			<%
		}
		%>
	</table>
</div>
</body>

</html>