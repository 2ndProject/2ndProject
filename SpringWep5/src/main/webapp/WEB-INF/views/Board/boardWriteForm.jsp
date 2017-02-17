<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
</head>
<body>
<h3>[방명록 글쓰기]</h3>
<form action="boardWirte" method="post" >
<table>
	<tr>
	<td>이름</td>
	<td><input type="text" id="title" name="title"></td>
	</tr>
	
	<tr>
	<td>비밀번호</td>
	<td><input type="password" id="password" name="password"></td>
	</tr>
	
	<tr>
	<td>내용</td>
	<td>
	<textarea rows="50" cols="50" name="content"></textarea>
	</td>
	</tr>
	
	<tr>
	<td colspan="2">
	<input type="submit" value="저장">
	</td>
	</tr>
</table>
</body>
</html>