<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	.out{
		text-align : center;
	}
</style>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
    <form action="<c:url value='/boardRemove'/>" method="post">
        <input name="boardNo" value="${param.boardNo}" type="hidden"/>
        <br></br>
        <h3>비밀번호확인 
        <div><input name="boardPw" type="password"></div>
        <div>
            <input type="submit" value="삭제"/>
            <input type="reset" value="초기화"/>
        </div></h3>
    </form>
</body>
</html>
