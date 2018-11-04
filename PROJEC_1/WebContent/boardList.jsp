<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "java.io.File" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "com.oreilly.servlet.MultipartRequest"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "service.FileDAO" %>
<%@ page import = "service.FileDTO" %>
<%@ page import="java.util.*"%>
<%@ page import = "service.BoardDao" %>
<%@ page import = "service.Board" %>
<%@ page import = "javax.servlet.http.HttpSession" %>

<%String directory = application.getRealPath("/");%>
<%
int currentPage = 1;
if(request.getParameter("currentPage") != null) {
    currentPage = Integer.parseInt(request.getParameter("currentPage"));
}
BoardDao boardDao = new BoardDao();
int totalRowCount = boardDao.selectTotalBoardCount();
int pagePerRow = 10; 
int beginRow = (currentPage-1)*pagePerRow;
List<Board> list = boardDao.selectBoardListPerPage(beginRow, pagePerRow);
%>



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
<style>

	 h3 {
            font: normal 170% '나눔손글씨 펜';
            color: #111c46;
            text-shadow: 1px 1px 5px lightgray;
        }
      #wrap {
         width: 1200px;
         text-align:center;
         margin: 0 auto 0 autu;
      }
      table {
      border: 1px solid #bcbcbc;
      width: 100%;
      height: 100px;
      border-collapse: collapse;
      text-align :center;
      }
      th, td {
      border: 1px solid #bcbcbc;
      padding: 5px;
      }
      .content {
         margin-top : 3%;
         margin-left : 10%;
            padding : 2%;
            width: 70%;
            text-align : center;
            border : 1px solid lightgray;
            box-shadow : 2px 2px 5px #808080;
            background-color : white;
        }
      .cand {
      width: 170px;
      }
      .name {
      width: 100px;
      }
      
      .out {
      	text-align : center;
      }
      </style>

</head>
<body>
 <jsp:include page="./common/top.jsp"></jsp:include>
<br></br>
<div class="content">
	<%
		BoardDao board = new BoardDao();
		List<Board> boardlist = board.selectBoardListPerPage(beginRow, pagePerRow);
	%>
			<tr>
			
	<table>
	<thead>
			<tr>
				<td><h3>제목</h3></td>
				<td><h3>작성자</h3></td>
				<td><h3>작성일자</h3></td>
			</tr>
	</thead>
			<%
				for(int i=0; i<boardlist.size(); i++){
					Board boarddto = boardlist.get(i);
			%>

			<tr>
				<td><a href="<%=request.getContextPath()%>/boardView?boardNo=
				<%=boarddto.getBoardNo()%>"><%=boarddto.getBoardTitle() %></a></td>
				<td><%=boarddto.getBoardUser() %></td>
				<td><%=boarddto.getBoardDate() %></td>
			</tr>
			<% 
			}
			%>
		</tr>
</table>
 <%
    int lastPage = totalRowCount/pagePerRow;
    if(totalRowCount%pagePerRow != 0) {
        lastPage++;
    }
%>

   <div>
<%
        if(currentPage>1) {
%>
            <a href="<%=request.getContextPath()%>/boardList.jsp?currentPage=<%=currentPage-1%>">이전</a>
<%
        }
        if(currentPage < lastPage) {
%>

            <a href="<%=request.getContextPath()%>/boardList.jsp?currentPage=<%=currentPage+1%>">다음</a>
<%
        }
%>
    </div>
    </div>
   
    <br></br><br></br><br>
    <div style="text-align:right">
        <input type = "button" value = "글작성하기" onclick = "location.href='<%=request.getContextPath()%>/boardAdd'"></a>
    </div>
    <jsp:include page="./common/foot.jsp"></jsp:include>
</body>
</html>
