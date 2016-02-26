<%@ page import="edu.ucla.cs.cs144.SearchResult" %>
<%
	SearchResult [] results = (SearchResult[]) request.getAttribute("results");
	String q = (String) request.getAttribute("query");
	
%>

<html>
<head>
<body>
<form action="/eBay/search" method="GET" id="itemsearchform">
	Type in your search query:
	<input type="text" name="query">
	<input type="hidden" name="numResultsToSkip" value="0">
	<input type="hidden" name="numResultsToReturn" value="20">
	<input type="submit" value="Search!">
</form>

<p> Your search query was <%= q %> .</p>

<table>
<tr>
<td>ItemId</td><td>Name</td>
</tr>
<%
	for(int i = 0; i < results.length; i++){
%>
<tr>
<td><%= (String) results[i].getItemId() %> </td>
<td><%= (String) results[i].getName() %> </td>
</tr>

<%	} 
%>
</table>
</body>
</head>
</html>