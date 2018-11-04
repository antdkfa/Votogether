<%@page contentType="text/html; charset=euc-kr" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		
		<style>
		 	
        .content {
            padding: 2%;
            width: 35%;
            height:500px;
            border: 1px solid lightgray;
            box-shadow: 2px 2px 5px #808080;
            background: aliceblue;
            margin-bottom:7%;
        }
        h2 {
            font: normal 150% '���� ���';
            text-align: center;
            text-shadow: 2px 2px 5px gray;
        }
        h3{
        	color: #3F84F5;
        	font : '���� ���';
        	margin-top: 2%;
        	text-decoration: none;
        }
        
		</style>
		<link type="text/css" rel="stylesheet" href="copyright_css.css" />
		<title>Votogether</title>
	</head>
	<body>
	<%
			
	%>
		<div style="min-width:1200px;">
			<div style="float:left; margin-left:10%;" class="content">
				
				<H2>�������� ��ǥ</H2>
				<ul>

					<c:forEach var ="cnt" begin="0" end="${CN_LIST.listSize-1}">
								<li><h3>�а� : ${CN_LIST.major[cnt]}</h3></li>
								- �ѿ� : ${CN_LIST.total[cnt]}<br>
								- ��ǥ�� �ο� : ${CN_LIST.vote[cnt]}<br>
								
								<form action="DoVote.jsp"  method="post">
								<input type="radio" name="major" value=${CN_LIST.major[cnt]}>
								<input type="submit" value="��ǥ�Ϸ� ����">
								</form>
						<br><br>				
					</c:forEach>
					</ul>

			</div>
		
			<div style="float:right; margin-right:10%;" class="content">
				<H2>����� ��ǥ</H2> 
				<ul>
					<c:forEach var ="cnt" begin="0" end="${CN_LIST2.listSize-1}">
								<li><h3>�а� : ${CN_LIST2.major[cnt]}</h3></li>
								- �ѿ� : ${CN_LIST2.total[cnt]}<br>
								- ��ǥ�� �ο� : ${CN_LIST2.vote[cnt]}<br>
								<form action="voteresult"  method="post">
								<input type="radio" name="major" value=${CN_LIST2.major[cnt]}>
								<input type="submit" value="��� Ȯ���Ϸ� ����">
								</form>
								
						<br><br>				
					</c:forEach>
				</ul>
			</div>
   	 	</div>
	</body>
</html>