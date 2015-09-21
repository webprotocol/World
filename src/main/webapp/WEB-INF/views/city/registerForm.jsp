<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerForm.jsp</title>
<%@ include file="/WEB-INF/views/common.jspf" %>

<style type="text/css">
	.form-center {
		border: 1px solid red;
		border-radius: 10px;
		width: 400px;
		padding: 10px;
		margin-left: 50px;
	}
	
	.box {
		width: 100px;
		height: 100px;
		border-radius: 10px;
		background-color: orange;
	}
</style>

</head>
<body>
<h1><spring:message code="city.register.title" arguments="[World]"/></h1>

<form:form commandName="city" action="register" method="post" cssClass="form-center">
	<!-- Global Error -->
	<div class="text-danger text-center">
		<form:errors/>
	</div>
	
	<!-- city.name -->
	<div class="form-group">
		<label for="name"><spring:message code="city.name"/></label>
		<form:input path="name" cssClass="form-control"/>
		<form:errors path="name" cssClass="text-primary bg-danger"/>
	</div>

	<!-- city.countryCode -->
	<div class="form-group">
		<label for="countryCode"><spring:message code="city.countryCode"/></label>
<%-- 		<form:input path="countryCode" cssClass="form-control"/> --%>
		<form:select path="countryCode" cssClass="form-control">
			<form:option value="">-- 선택하세요 --</form:option>
			<form:options items="${countryCode}" itemValue="code" itemLabel="name"/>
		</form:select>
		<form:errors path="countryCode" cssClass="text-primary bg-danger"/>
	</div>

	<!-- city.district -->
	<div class="form-group">
		<label for="district"><spring:message code="city.district"/></label>
<%-- 		<form:input path="district" cssClass="form-control"/> --%>
		<form:select path="district" cssClass="form-control">
			<form:option value="">-- 선택하세요 --</form:option>
			<form:options items="${districts}"/>
		</form:select>

		<form:errors path="district" cssClass="text-primary bg-danger"/>
	</div>

	<!-- city.population -->
	<div class="form-group">
		<label for="population"><spring:message code="city.population"/></label>
		<form:input path="population" cssClass="form-control"/> 
		<form:errors path="population" cssClass="text-primary bg-danger"/>
	</div>
	
	<!-- Submit -->
	<input class="btn btn-primary" type="submit" value="도시추가"/>
</form:form>

<c:forEach var="i" begin="0" end="10">
	<div class="box"><strong>${i}</strong></div>
</c:forEach>

<script type="text/javascript">
 	var form = $('.form-center');
 	form.draggable();
 	form.mousedown(function() {
		console.log("form.mousedown()...");
		$(this).css('box-shadow', '20px 20px 10px red');
	});
 	
 	form.mouseup(function() {
 		console.log("form.mouseup()...");
 		$(this).css('box-shadow', '');
	});
 	
 	$('.box').draggable();
 	
 	$('#countryCode').change(function() {
 		var countryCode = $(this).val();
		console.log("change event called... value=" + countryCode);
		
		// Ajax (Asyncronous javascript and xml)
		$.get('district/' + countryCode , function(data, status) {
			console.log("data=" + data + "\n" + "status=" + status);
			$('#district').html(data);
		});
		
	});
 	
</script>
</body>
</html>



