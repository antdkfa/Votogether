<%@page contentType="text/html; charset=euc-kr"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	function goLogin(){
		location.href="Login.html";
	} 
</script>

<h4>로그인</h4>
<c:choose>
	<c:when test="${param.LOGIN_RESULT == 'FAIL'}">
		로그인에 실패했습니다 .<br> 아이디와 패스워드를 체크하세요.
		<input type="button" value="뒤로가기 " onclick="goLogin()">
	</c:when>
</c:choose>