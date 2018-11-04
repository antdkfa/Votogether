<%@page contentType="text/html; charset=euc-kr" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>투표 결과</title>
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

		<table border="1"  width=40% height=20% margin="auto" align=center>
			<tr><td style="text-align:center;">이름</td>
			<c:forEach var ="cnt" begin="0" end="2">
				<td style="text-align:center;">${CN_LIST.name[cnt]}</td>
			</c:forEach>
			</tr>
			
			<tr><td style="text-align:center;">득표수</td>
			<c:forEach var ="cnt" begin="0" end="2">
				<td style="text-align:center;">${CN_LIST.candidateVoted[cnt]}</td>
			</c:forEach>
			</tr>
		</table>
		<jsp:include page="./common/foot.jsp"></jsp:include>
		
	</body>
</html>