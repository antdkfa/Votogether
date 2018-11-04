<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
h1{
font: normal 230% '나눔손글씨 펜';
            color: #111c46;
            text-shadow: 1px 1px 5px lightgray;
}
 h3 {
            font: normal 170% '나눔손글씨 펜';
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
<h1>수정</h1>  
    <form action="<c:url value='/boardModify'/>" method="post">
        <h3>글 번호</h3>
        <div><input name="boardNo" value="${board.boardNo}" type="text" readonly="readonly"/></div>
        <h3>비밀번호 확인 </h3>
        <div><input name="boardPw" id="boardPw" type="password"/></div>
        <h3>제목  </h3>
        <div><input name="boardTitle" value="${board.boardTitle}" id="boardTitle" type="text"/></div>
        <h3>내용  </h3>
        <div><textarea name="boardContent" id="boardContent" rows="16" cols="50">${board.boardContent}</textarea></div>
        <div>
            <input type="submit" value="글수정" color = "white"/>
            <input type="reset" value="초기화"/>
        </div>
    </form>
    </div>
</body>
</html>

