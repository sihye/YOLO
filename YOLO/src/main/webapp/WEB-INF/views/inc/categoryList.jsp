<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:forEach var="vo" items="${cList }">
		<input value='${vo.kNo}' onclick=CountChecked(this) type=checkbox>${vo.kName}
	</c:forEach>
