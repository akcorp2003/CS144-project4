<%@ page import="edu.ucla.cs.cs144.SearchResult" %>
<%@ page import="edu.ucla.cs.cs144.Item" %>
<%@ page import="edu.ucla.cs.cs144.Bid" %>

<% Item item = (Item) request.getAttribute("item"); 
String itemid = (String) request.getAttribute("id");

%>

<html>
<head>
</head>
<body>
<p> yolo </p>
<form action="/eBay/item" method="GET" id="searchForm">
            Search:
            <input type="text" name="id">
            <input type="submit" value="Submit!">
</form>

<p>ID : <%=itemid%></p>



<p>Name: <%= item.name %> </p>


</body>
</html>