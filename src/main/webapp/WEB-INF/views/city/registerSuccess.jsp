<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerSuccess.jsp</title>
<style type="text/css">
	.box {
		border-top: 1px double red;
		border-bottom: 1px double blue;
		width: 500px;
		box-shadow: 20px 10px 10px red;
		text-shadow: 5px 5px 1px blue;
	}

</style>
</head>
<body>
<h1><spring:message code="city.register.success"/></h1>
<pre class="box">
id         = ${city.id} <br/>
name       = ${city.name} <br/>
countryCode= ${city.country.code} <br/>
district   = ${city.district} <br/>
population = ${city.population} <br/>
</pre>
<a href="register">도시입력화면으로...</a>

</body>
</html>



