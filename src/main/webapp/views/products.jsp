<%@ page import="com.nikhil.main.others.AllJspMethods"%>
<%@ page import="com.nikhil.main.beans.Products"%>
<%@ page import="java.util.List"%>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
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
			<c:forEach items="${m_products_obj_list}" var="product">
				<tr>
					<td>${product.getId()}</td>
					<td>${product.getTitle()}</td>
					<td>${product.getDescription()}</td>
					<td>${product.getPrice()}</td>
					<td>
					<c:forEach items="${product.getImages()}" var="image">
						<span> <img alt="" src="${image}" width="100" /> </span>
					</c:forEach>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<c:set var="total_pages" value="${m_total_pages}"></c:set>
	<c:set var="allJspMethods" value="<%= new com.nikhil.main.others.AllJspMethods() %>" />
	<c:set var="currPage" value="1"/>
	<c:if test="${param.page ne null}">
		<c:set var="currPage" value="${param.page}" />
	</c:if>
	
	<div style="text-align: center; padding : 20px;">
		<a href="/Products?page=${allJspMethods.prevPage(currPage,total_pages)}">Prev</a>
		<c:forEach var="i" begin="1" end="${total_pages}">
			<a href="/Products?page=${i}">${i}</a>
		</c:forEach>
		<a href="/Products?page=${allJspMethods.nextPage(currPage,total_pages)}">Next</a>
	</div>
</body>
</html>







