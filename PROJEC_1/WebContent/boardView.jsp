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
<%
		BoardDao board = new BoardDao();
		List<Board> boardlist = board.selectBoardListPerPage(beginRow, pagePerRow);
%>
			<%
		for(int i=0; i<boardlist.size(); i++){
			Board boarddto = boardlist.get(i);
		
			String driverClassName = "com.mysql.jdbc.Driver";
			 String url = "jdbc:mysql://localhost:3306/webdb";
			String username = "root";
			 String password = "student";
			 
			 Connection connection = null;
			 ResultSet rs = null;
			 PreparedStatement psmt = null;
			 
				try {
					Class.forName(driverClassName);
					connection = DriverManager.getConnection(url, username, password);
					rs = psmt.executeQuery("select * from file where =" + boarddto.getBoardNo());
					String filepath = rs.getString("fileRealName");
				} catch(Exception e) {
					e.printStackTrace();
			}
		}
			
%>

<style>
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
            height : 40%;
            text-align :center;
            border: 1px solid lightgray;
            box-shadow: 2px 2px 5px #808080;
            background-color: white;
        
	}
	
	.out{
		text-align : center;
	}
</style>


<%String directory = application.getRealPath("/");%>
<%
		
%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>
</head>
<body>
    <div style = "text-align : right"></div><div class = "title">${board.boardTitle }</div></div>
    <div class = "content">${board.boardContent}</div>
    <br></br><br></br>
    <div class = "out">
        <input type = "button" value = "수정" onclick = "location.href = 'boardModify?boardNo=${board.boardNo}'">
        <input type = "button" value = "삭제" onclick = "location.href = 'boardRemove?boardNo=${board.boardNo}'">
        <input type = "button" value = "목록으로" onclick = "location.href = 'boardList.jsp'">
    </div>
</body>
</html>
