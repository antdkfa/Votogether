<%@page contentType="text/html; charset=euc-kr"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	function goLogin(){
		location.href="Login.html";
	} 
</script>

<h4>�α���</h4>
<c:choose>
	<c:when test="${param.LOGIN_RESULT == 'FAIL'}">
		�α��ο� �����߽��ϴ� .<br> ���̵�� �н����带 üũ�ϼ���.
		<input type="button" value="�ڷΰ��� " onclick="goLogin()">
	</c:when>
</c:choose>