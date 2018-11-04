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
<h1>글 작성하기</h1>
<form action="<c:url value='/boardAdd'/>" method="post">
    <h3>비밀번호  </h3>
    <div><input name="boardPw" id="boardPw" type="password"/></div>
    <h3>제목  </h3>
    <div><input name="boardTitle" id="boardTitle" type="text"/></div>
    <h3>내용  </h3>
    <div><textarea name="boardContent" id="boardContent" rows="20" cols="50"></textarea></div>
    <div>
        <input type="submit" value="글입력"/>
        <input type="reset" value="초기화"/>
    </div>
</form>
<form action = "uploadAction.jsp" method = "post" enctype = "multipart/form-data">
		<h3>파일 :<input type="file" name="file">
		<input type="submit" value="업로드"></h3>
</form> 
</div>
</body>
</html>

