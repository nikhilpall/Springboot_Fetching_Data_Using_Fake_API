<%@page import="com.nikhil.main.others.AllJspMethods"%>
<%@page import="com.nikhil.main.beans.Products"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Products</title>

<style>
	*{
		margin : 0;
		padding : 0;
	}
	table{
		border-collapse: collapse;
	}
	table tr td, th{
		border: 2px solid black;
		padding : 5px 10px;
	}
	a{
		text-decoration: none;
		font-size: 20px;
		font-weight: bolder;
		padding : 10px;
		background-color: #bcd2f5;
		border : 1px solid black;
		border-radius: 10px;
		margin : 5px;
	}
</style>

</head>
<body>
	<div style="text-align: center; padding : 10px 20px;">
		<h1>Products Page</h1> <br><br>
		
		<table>
			<tr>
				<th>Id</th>
				<th>Title</th>
				<th>Description</th>
				<th>Price</th>
				<th>Images</th>
			</tr>
			
			<%
				List<Products> list = (List<Products>) request.getAttribute("m_products_obj_list");
				String currPage_str =  request.getParameter("page");
				int currPage = 1;
				if(currPage_str != null){
					currPage = Integer.parseInt(currPage_str);
				}
				for(Products product : list){
					
					String[] images_arr = product.getImages();
					
					%>
						<tr>
							<td><%= product.getId() %></td>
							<td><%= product.getTitle() %></td>
							<td><%= product.getDescription() %></td>
							<td><%= product.getPrice() %></td>
							<td>
								<%
									for(String image : images_arr){
										%>
											<span> <img alt="" src="<%= image %>" width="100"> </span>
										<%
									}
								%>
							</td>
						<tr>
					<%
					
				}
			%>
			
		</table>
	</div>
	
	<%
		int total_pages = (int) request.getAttribute("m_total_pages");
		AllJspMethods allJspMethods = new AllJspMethods();
	%>
	
	<div style="text-align: center; padding : 20px;">
		<a href="/Products?page=<%= allJspMethods.prevPage(currPage, total_pages)  %>">Prev</a>
		<%
			for(int i=1; i<=total_pages; i++){
				
				%>
					<a href="/Products?page=<%= i %>"><%= i %></a>
				<%
				
			}
		%>
		<a href="/Products?page=<%= allJspMethods.nextPage(currPage, total_pages) %>">Next</a>
	</div>
</body>
</html>







