<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<c:set var = "cpath" value = "${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>
<style>
	.left-box{
		float: left;
	}
	.right-box{
		float: right;
	}
</style>

<link href="${cpath }/resources/css/css.css" rel="stylesheet">
<!--  <link href="/bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script> -->

<title>엔지니어를 위한 플랫폼 써어-비스(SerAbbys)</title>


<div class="topmenubar">
	<div class="toplogo"><a href="${cpath }"><img src="${cpath }/resources/img/logo.png"></a></div>
	<div class="navi">
		<ul>
			<li><a href="${cpath }/common/myPage">기본정보관리</a></li>
			<li><a href="${cpath }/order/service_list_all">서비스관리</a></li>
			
			<!-- 여기서부터 재훈이가 수정했습니다. -->
			<c:if test="${login != null}">
				<li><a href="${cpath }/common/logout">Logout</a></li>
			</c:if>
			
			<c:if test="${login == null}">
				<li><a href="${cpath }/common/login">Login</a></li>
				<li><a href="${cpath }/common/join">회원가입</a></li>
			</c:if>
			<!-- 여기까지 -->
			<li><a href="${cpath }/board/review_list_all">리뷰 관리하기</a></li>
			
			<!-- 여기서부터 재훈이가 수정했습니다. -->
			<c:if test="${iamCeo }">
				<li><a href="${cpath }/board/myCompList/${login.person_belong}">소속기사 관리</a></li>
			</c:if>
			<c:if test="${!iamCeo }">
				<li><a href="${cpath }/board/myList/${login.person_id}">내 접수목록 관리</a></li>
			</c:if>
			<!-- 여기까지 -->
		</ul>
	</div>
</div>

</head>
<body>

  