<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<option value="">-- 선택하세요 --</option>
<c:forEach var="district" items="${districts}">
	<option value="${district}">${district}</option>
</c:forEach>








    
