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
		 width: 12%;
		text-align :center;
		 border: 1px solid lightgray;
            box-shadow: 2px 2px 5px #808080;
            background-color: white;
	}
	.content{
		
         	margin-top:4%;
         	margin-left:10%;
            padding: 2%;
            width: 80%;
            height : 80%;
            text-align :center;
            border: 1px solid lightgray;
            box-shadow: 2px 2px 5px #808080;
            background-color: white;
        
	}
	.out {
		text-align : center;
	}
</style>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>BOARD MODIFY FORM</title>
</head>
<body>
<div class = "out">
<h1>����</h1>  
    <form action="<c:url value='/boardModify'/>" method="post">
        <h3>�� ��ȣ</h3>
        <div><input name="boardNo" value="${board.boardNo}" type="text" readonly="readonly"/></div>
        <h3>��й�ȣ Ȯ�� </h3>
        <div><input name="boardPw" id="boardPw" type="password"/></div>
        <h3>����  </h3>
        <div><input name="boardTitle" value="${board.boardTitle}" id="boardTitle" type="text"/></div>
        <h3>����  </h3>
        <div><textarea name="boardContent" id="boardContent" rows="16" cols="50">${board.boardContent}</textarea></div>
        <div>
            <input type="submit" value="�ۼ���" color = "white"/>
            <input type="reset" value="�ʱ�ȭ"/>
        </div>
    </form>
    </div>
</body>
</html>

