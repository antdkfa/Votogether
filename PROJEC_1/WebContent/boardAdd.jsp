<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
h1{
font: normal 230% '�����ձ۾� ��';
            color: #111c46;
            text-shadow: 1px 1px 5px lightgray;
}
 h3 {
            font: normal 170% '�����ձ۾� ��';
            color: #111c46;
            text-shadow: 1px 1px 5px lightgray;
        }
	.title {
	margin-left : auto;
	margin-right : auto;
		padding : 2%;
		 width: 10%;
		 height : 1%;
		text-align :center;
		 border: 1px solid lightgray;
            box-shadow: 2px 2px 5px #808080;
            background-color: white;
	}

	.out{
		text-align : center;
	}
</style>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>BOARD ADD</title>
</head>
<body>
<div class = "out">
<h1>�� �ۼ��ϱ�</h1>
<form action="<c:url value='/boardAdd'/>" method="post">
    <h3>��й�ȣ  </h3>
    <div><input name="boardPw" id="boardPw" type="password"/></div>
    <h3>����  </h3>
    <div><input name="boardTitle" id="boardTitle" type="text"/></div>
    <h3>����  </h3>
    <div><textarea name="boardContent" id="boardContent" rows="20" cols="50"></textarea></div>
    <div>
        <input type="submit" value="���Է�"/>
        <input type="reset" value="�ʱ�ȭ"/>
    </div>
</form>
<form action = "uploadAction.jsp" method = "post" enctype = "multipart/form-data">
		<h3>���� :<input type="file" name="file">
		<input type="submit" value="���ε�"></h3>
</form> 
</div>
</body>
</html>

