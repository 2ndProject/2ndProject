<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><span>${board.title}</span></title>
</head>
<body>

<table>
 <tr>
 <td>작성자</td>
 <td>
 ${board.id}
 </td>
  </tr>
 <tr>
 <td>작성일</td>
 <td>
 ${board.inputdate}
 </td> 
 </tr>
 <tr>
 <td>제목</td>
 <td>
 ${board.title}
 </td>
 </tr>
 <tr>
 <td>제목</td>
 <td>
 <textarea rows="50" cols="50" name="content" readonly>${board.content}</textarea>
 </td>
 </tr>
 </table>

</body>
</html>