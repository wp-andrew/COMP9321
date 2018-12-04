<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="web.app.eng.*" %>
<jsp:useBean id="news" class="web.app.eng.NewsBean" scope="session" />

<html>

<head>
<title>results</title>
</head>

<body>
<%@ include file="sideNavigation.jsp"%>

<div id="main">
	<%@ include file="header.html"%>
	
	<%
	String input = request.getParameter("idx");
	int i, n = Integer.parseInt(input);
	if (news.getSearchedIndexesLength() == 0) {
		%>
		<h1 align="center">Sorry, no matching datasets found!</h1><br/>
		<%
	}
	else {
		%>
		<h1 align="center"><%= news.getSearchedIndexesLength() %> matches found!</h1>
		<table id="rowsTable" align="center" border="1" width="80%">
			<col width="5%" />
			<col width="95%" />
			<tr>
				<th>No.</th>
				<th>Headline</th>
			</tr>
			<%
			for (i=n; i<n+10; i++) {
				String headline = news.getSearchedTagValue(i, "headline");
				if (headline != null) {
					%>
					<tr>
						<td align="center"><%= i + 1 %></td>
						<td><a href="entry.jsp?idx=<%= i %>"><%= headline %></a></td>
					</tr>
					<%
				}
				else {
					break;
				}
			}
			int previousIndex = n - 10;
			int nextIndex = i;
			%>
		</table><br/>
		
		<center><form action="results.jsp" method="POST">
			<%
			if (previousIndex >= 0) {
			%>
				<button name="idx" type="submit" value="<%= previousIndex %>">Previous</button>
			<%
			}
			if (nextIndex < news.getSearchedIndexesLength()) {
			%>
				<button name="idx" type="submit" value="<%= nextIndex %>">Next</button>
			<%
			}
			%>
		</form></center><br/>
		<%
	}
	%>
</div>
</body>

<script>
function changeValue() {
	var element = document.getElementById("Next_Button");
	element.value = input + 10;
}
</script>

</html>