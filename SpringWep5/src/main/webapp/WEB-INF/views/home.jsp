<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<html>
<head>
<title>Main</title>
</head>
<body>
<h3>[springWeb5-SE Bank]</h3>

<c:choose>
	<c:when test="${sessionScope.custid==null}">
		<ul>
			<li><a href="joinForm">회원 가입</a></li>
			<li><a href="login">로그인</a></li>
	</c:when>
	<c:otherwise>
			${sessionScope.custid}님 환영합니다.
			<li><a href="logout">로그아웃</a></li>
			<li><a href="updateForm">개인정보 수정</a></li>
			<li><a href="boardlist">게시판</a></li>
	</c:otherwise>
</c:choose>
	</ul>

	<P>The time on the server is ${serverTime}.</P>

</body>
</html>
