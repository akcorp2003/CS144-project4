<%@ page import="edu.ucla.cs.cs144.SearchResult" %>
<%
	SearchResult [] results = (SearchResult[]) request.getAttribute("results");
	String q = (String) request.getAttribute("query");
	int numToSkip = Integer.parseInt(request.getAttribute("numResultsToSkip").toString());
	int display_on_page = 10;
	
%>

<html>
<head>
	<title>Search</title>
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
                <li class="active"><a href="/eBay/search">Search</a></li>
                <li><a href="/eBay/item">Items</a></li>
            </ul>
        </div>
	</nav>

	<div class="col-xs-12">

	<form action="/eBay/search" method="GET" id="itemsearchform">
		<div class="form-group">
			<div class="form-group">
			<label>Search Query</label>
			<input class="form-control" type="text" name="query" placeholder="Enter your search query">
			</div>


			<input type="hidden" name="numResultsToSkip" value="0">
			<input type="hidden" name="numResultsToReturn" value="20">
			<div class="form-group">
				<button type="submit" class="btn btn-primary">Search!</button>
			</div>
		</div>
	</form>

	<div class="btn-group" role="group" aria-label="Navigation buttons">
		<%
		if(numToSkip <= 0) {
		%>
			<button type="button" class="btn btn-primary" disabled>Previous</button>
		<%
		}
		else {
		%>
			<a class="btn btn-primary" href="?query=<%= q %>&numResultsToSkip=<%=numToSkip - 10%>&numResultsToReturn=10">Previous</a>
		<%
		}
		if(results.length > 10){ 
		%>
			<a class="btn btn-primary" href="?query=<%= q%>&numResultsToSkip=<%=numToSkip + 10%>&numResultsToReturn=10">Next</a>
		<%
		}
		else {
		%>
			<button type="button" class="btn btn-primary" disabled>Next</button>
		<%
		}
		%>
	</div>


	<%
	if(q == null || q == ""){
	}
	else{
	%>
		<br/>
		<p> Your search query was <%= q %>.</p>

		<table class="table table-striped">
		<thead>
			<tr>
			<th>ItemId</th><th>Name</th>
			</tr>
		</thead>
		<tbody>
		<%
		int counter = 0;
		for(int i = 0; i < results.length; i++){
		%>
			<tr>
			<td><a href="/eBay/item?id=<%=(String) results[i].getItemId()%>" > <%= (String) results[i].getItemId()%> </a></td>

			<td><%= (String) results[i].getName() %> </td>
			</tr>

		<%
			counter++;
			//only display 10 items
			if(counter == 10){
				break;
			}	
		} 
		%>
		</tbody>
		</table>
	<%
	}
	%>
	</div>
</div>
</body>
</html>