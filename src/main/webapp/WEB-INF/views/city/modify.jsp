<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify.jsp</title>
</head>
<body>
<h1>CityCommand</h1>
<form:form commandName="city">
<ul>
	<li>${city.name}       <form:errors path="name" cssStyle="color:red;"/></li>
	<li>${city.countryCode}<form:errors path="countryCode" cssStyle="color:red;"/></li>
	<li>${city.district}   <form:errors path="district" cssStyle="color:red;"/></li>
	<li>${city.population} <form:errors path="population" cssStyle="color:red;"/></li>
</ul>

</form:form>
</body>
</html>