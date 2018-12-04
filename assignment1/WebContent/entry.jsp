<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="web.app.eng.*" %>
<jsp:useBean id="news" class="web.app.eng.NewsBean" scope="session" />

<html>

<style>
/* The Modal (background) */
.modal {
    display: none;		/* Hidden by default */
    position: fixed;	/* Stay in place */
    z-index: 1;			/* Sit on top */
    padding-top: 100px;	/* Location of the box */
    left: 0;
    top: 0;
    width: 100%;		/* Full width */
    height: 100%;		/* Full height */
    overflow: auto;		/* Enable scroll if needed */
    background-color: rgb(0,0,0);		/* Fallback color */
    background-color: rgba(0,0,0,0.4);	/* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
    word-wrap: break-word;
}

/* The Close Button */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
</style>

<head>
<title>entry</title>
</head>

<body>
<%@ include file="header.html"%>

<%
String input = request.getParameter("idx");
int n = Integer.parseInt(input);
int returnIndex = n - (n % 10);
%>

<table align="center" border="1" width="80%">
	<col width="10%" />
	<col width="90%" />
	<tr>
		<td>Agency</td>
		<td><%= news.getSearchedTagValue(n, "agency") %></td>
	</tr>
	<tr>
		<td>Headline</td>
		<td><%= news.getSearchedTagValue(n, "headline") %></td>
	</tr>
	<tr>
		<td>Publish Date</td>
		<td><%= news.getSearchedTagValue(n, "date") %></td>
	</tr>
	<tr>
		<td>City</td>
		<td><%= news.getSearchedTagValue(n, "city") %></td>
	</tr>
	<tr>
		<td>Content</td>
		<td><%= news.getSearchedTagValue(n, "text") %></td>
	</tr>
</table><br/>

<center>
<form action="results.jsp" method="POST">
	<button name="idx" type="submit" value="<%= returnIndex %>">Return</button>
</form>
</center><br/>

<!-- Trigger/Open The Modal -->
<center>
<button id="extractKeywords" onclick="showModal(this.id)">Extract Keywords</button>
<button id="extractPeople" onclick="showModal(this.id)">Extract People</button>
<button id="extractOrganizations" onclick="showModal(this.id)">Extract Organizations</button>
<button id="extractLocations" onclick="showModal(this.id)">Extract Locations</button>
</center>

<!-- The Modal -->
<div id="myModal" class="modal">

	<!-- Modal content -->
	<div class="modal-content">
		<span class="close">&times;</span>
		<b id="heading">empty</b>
		<p id="content">empty</p>
	</div>

</div>
</body>

<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

var heading = document.getElementById("heading");
var content = document.getElementById("content");

// When the user clicks the button, open the modal
function showModal(id) {
    modal.style.display = "block";
    if (id == "extractKeywords") {
    	heading.innerHTML = "Keywords:"
    	content.innerHTML = "<%= news.getSearchedTagValue(n, "keywords") %>";
    }
    else if (id == "extractPeople") {
    	heading.innerHTML = "People:"
    	content.innerHTML = "<%= news.getSearchedTagValue(n, "people") %>";
    }
    else if (id == "extractOrganizations") {
    	heading.innerHTML = "Organizations:"
    	content.innerHTML = "<%= news.getSearchedTagValue(n, "organizations") %>";
    }
    else if (id == "extractLocations") {
    	heading.innerHTML = "Locations:"
    	content.innerHTML = "<%= news.getSearchedTagValue(n, "locations") %>";
    }
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

</html>