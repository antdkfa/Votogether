<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
		<style>  
		#footer {
   			position:absolute;
    		bottom:0;
    		width:100%;
    		
    		}
    </style>
	</head>
	<body>
		<jsp:include page="./common/top.jsp"></jsp:include>
		<div style="margin-top : 5%;"><jsp:include page="${param.BODY_PATH}"/></div>
		<jsp:include page="./common/foot.jsp"></jsp:include>
	</body>
</html>