<%@page contentType="text/html; charset=euc-kr"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	function goLogin_Join(){
		location.href="Login_Join.html";
	} 
</script>

<h4>로그아웃</h4>
<c:choose>
	<c:when test="${param.LOGOUT_RESULT == 'SUCCESS'}">
		로그아웃이 되었습니다 .<br>
		<input type="button" value="처음 페이지로 이동"  onclick="goLogin_Join()"> 
		<br>
	</c:when>
	<c:otherwise>
		로그아웃에 실패했습니다.
	</c:otherwise>
</c:choose>