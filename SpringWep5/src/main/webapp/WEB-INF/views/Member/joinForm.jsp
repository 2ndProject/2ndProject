<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	function idCheck() {
		window.open("idCheckForm", "ID 중복검사", null,
				"width=600,height=250,left=650,top=300");
	}

	function formCheck() {

		var id = document.getElementById("custid");
		if (id.value == '') {
			alert('아이디를 입력해주세요');
			return false;
		}
		var pw1 = document.getElementById("password1");
		if (pw1.value == '') {
			alert('패스워드를 입력해주세요');
			return false;
		}

		var pw2 = document.getElementById("password2");
		if (pw2.value == '') {
			alert('패스워드 확인을 입력해주세요');
			return false;
		}
		if (pw1.value != pw2.value) {
			alert('패스워드가 같지 않습니다');
			return false;
		}

		var name = document.getElementById("name");
		if (name.value == '') {
			alert('이름을 입력해주세요');
			return false;
		}

		var email = document.getElementById("email");
		if (email.value == '') {
			alert('이메일을 입력해주세요');
			return false;
		}

		var idno = document.getElementById("idno");
		if (idno.value == '') {
			alert('식별번호를 입력해주세요');
			return false;
		}

		var address = document.getElementById("address");
		if (address.value == '') {
			alert('주소를 입력해주세요');
			return false;
		}
	}
	function division(division){
		if(division==null||division=="person"){
			document.getElementById("division1").checked="person";	
		}
		document.getElementById("division2").checked=division;
	}
</script>
<title>JoinForm</title>
</head>
<body  onload="division(${member.division})">
	<h3>
		[회원가입]
		<c:if test="${errMsg!=null}"> alert('${errMsg}');</c:if>
	</h3>
	<form action="join" method="post" onsubmit="return formCheck();">
		<table>

			<tr>
				<td>ID</td>
				<td><input type="text" id="custid" name="custid"
					value="${member.custid}" placeholder="ID중복확인 이용" readonly>
					<input type="button" onclick="idCheck();" value="ID중복확인"></td>
			</tr>

			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="password1" name="password"
					value="${member.password}" placeholder="비밀번호 입력"> <input
					type="password" id="password2" value="${member.password}"
					placeholder="비밀번호 다시입력"></td>
			</tr>

			<tr>
				<td>이름</td>
				<td><input type="text" id="name" name="name"
					value="${member.name}" placeholder="이름 입력"></td>
			</tr>

			<tr>
				<td>이메일 입력</td>
				<td><input type="text" id="email" name="email"
					value="${member.email}" placeholder="이메일 입력"></td>
			</tr>

			<tr>
				<td>고객구분</td>
				<td>
				<input type="radio" name="division" id="division1" value="person">개인
				<input type="radio" name="division" id="division2" value="company">기업
				</td>
			</tr>

			<tr>
				<td>식별번호</td>
				<td><input type="text" id="idno" name="idno"
					value="${member.idno}" placeholder="개인 : 주민번호, 법인 : 사업자 번호">
				</td>
			</tr>

			<tr>
				<td>주소</td>
				<td><input type="text" id="address" name="address"
					value="${member.address}" placeholder="주소 입력"></td>
			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="가입"> <input
					type="reset" value="다시 쓰기"></td>
			</tr>

		</table>
		<div>
			<c:if test="${errMsg!=null}">
					${errMsg}
				</c:if>
		</div>
</body>
</html>