<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
</head>
<body>
<a href="boardWriteForm">글쓰기 이동</a>
<form>
<c:forEach var="list" items="${bList}">
<table>
 <tr>
 <td>작성자</td>
 <td>
 ${list.id}
 </td>
  </tr>
 <tr>
 <td>작성일</td>
 <td>
 ${list.inputdate}
 </td> 
 </tr>
 <tr>
 <td>제목</td>
 <td>
 <a href="boardRead?boardNum=${list.boardNum}">${list.title}</a>
 </td>
 </tr>
 <tr>
 <td>비밀번호</td>
 <td>
 <form action="" method="post">
 <input type="password" id="password" name="password">
 <input type="submit" value="글 삭제">
 </form>
 </td>
 </tr>
 </table>
</c:forEach>

</form>
</body>
</html>