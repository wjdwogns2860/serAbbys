<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<h2>비밀번호를 수정하려고 왔다. 기존의 비밀번호를 입력하세요.</h2>
<div>
	<form method = "post">
		<input type = "hidden" name = "person_id" value = "${login.person_id }">
		<input type = "password" name = "person_pw" class= "form-control" style = "width: 15%;">
		<input type = "submit" value = "다음" class = "btn btn-primary btn-xl">
	</form>
</div>

<%@ include file="../layout/footer.jsp" %>
