<%@page contentType="text/html; charset=euc-kr"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	function goLogin_Join(){
		location.href="Login_Join.html";
	} 
</script>

<h4>�α׾ƿ�</h4>
<c:choose>
	<c:when test="${param.LOGOUT_RESULT == 'SUCCESS'}">
		�α׾ƿ��� �Ǿ����ϴ� .<br>
		<input type="button" value="ó�� �������� �̵�"  onclick="goLogin_Join()"> 
		<br>
	</c:when>
	<c:otherwise>
		�α׾ƿ��� �����߽��ϴ�.
	</c:otherwise>
</c:choose>