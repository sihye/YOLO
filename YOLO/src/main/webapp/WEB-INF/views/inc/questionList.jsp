<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<select style="height: 25px" name="qQuestionno">
	<c:forEach var="vo" items="${qList }">
		<option value="${vo.qQuestionno}" name="qQuestionno">${vo.qQuestionname}</option>
	</c:forEach>
</select>
