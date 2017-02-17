<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	function check(){
		var idCheck=document.getElementById("idCheck");
		
		if(idCheck.value==''){
			alert('아이디를 입력해주세요');
			return false;
		}
	
	/* 	 value는 태그 값을 불러온다. text필드 일때는 사용자가 입력한 값이 value가 된당.
		var id = console.log(document.getElementById('idCheck').value);
		 */
		return true;
	}
	function useID(id){
		//opener의 document는 부모객체의 태그를 불러오는 것이다.
		window.opener.document.getElementById("custid").value=id;
		window.close();
	}
</script>
<title>ID 중복 검사</title>
</head>
<body>
<h3>ID 중복 확인</h3>
<form action="idCheck" method="post" onsubmit="return check();">
<input type="text" id="idCheck" name="idCheck" value="${idCheck}">
<input type="submit" value="검색">
</form>
<br>
<c:if test="${search}">
	<c:choose>
		<c:when test="${result==null}">
		${idCheck} : 사용할 수 있는 ID입니다.
		<br>
		<input type="button" value="사용하기" onclick="useID('${idCheck}')">
		</c:when>
	<c:otherwise>
		${idCheck} : 이미 사용중인 ID입니다.	
	</c:otherwise>
	</c:choose>
</c:if>

</body>
</html>