<%@ page import="edu.ucla.cs.cs144.SearchResult" %>
<%@ page import="edu.ucla.cs.cs144.Item" %>
<%@ page import="edu.ucla.cs.cs144.Bid" %>

<% Item item = (Item) request.getAttribute("item"); 
String itemid = (String) request.getAttribute("id");
String error = (String) request.getAttribute("error");
String empty = (String) request.getAttribute("empty");

%>

<html>
<head>
	<title>Item</title>
	<link rel="stylesheet" type="text/css" href="bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="main.css">
</head>
<body>



<div class="wrapper">
	<nav role="navigation" class="navbar navbar-default">
	    <div class="navbar-header">         
	        <a href="#" class="navbar-brand">Project 4</a>
	    </div>
	    <div id="navbarCollapse" class="collapse navbar-collapse">
	        <ul class="nav navbar-nav">
	            <li><a href="/eBay/search">Search</a></li>
	            <li class="active"><a href="#">Items</a></li>
	        </ul>
	    </div>
    </nav>

    <div class="col-xs-12">
    	<form action="/eBay/item" method="GET" id="searchform">
			<div class="form-group">
				<div class="form-group">
				<label>Search Items</label>
				<input class="form-control" type="text" name="id" placeholder="Enter the ItemID">
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary">Search!</button>
				</div>
			</div>
		</form>

<%
if(empty=="true"){
%>
<p>Please specify an ItemID</p>
<%
}else if(itemid==null){
	%>
	<p>The ItemID you specified was not found</p>
	<%
}else{
%>

		

		<p>ID : <%=itemid%></p>

		<p>Name: <%= item.name %> </p>
	<%
	}
	%>
	</div>
</div>
</body>
</html>