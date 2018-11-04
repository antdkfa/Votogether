<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Read Database Page</title>
<style>
#box1 {
background-color: white;
border:1px solid lightgray;
padding:2%;
font:bold 80% '맑은 고딕';
box-shadow: 2px 2px 5px #808080;
width:20%;
height:200px;
float: left;
margin-left:5%;
}
#box2 {
background-color: white;
border:1px solid lightgray;
padding:2%;
font:bold 80% '맑은 고딕';
box-shadow: 2px 2px 5px #808080;
width:20%;
height:200px;
float: left;
margin-left:8.5%;
}
#box3 {
background-color: white;
border:1px solid lightgray;
padding:2%;
font:bold 80% '맑은 고딕';
box-shadow: 2px 2px 5px #808080;
width:20%;
height:200px;
float: right;
margin-right:5%;
}
p {
text-align: center;
margin-top: 5%;
}
#vote_button {
background-color: #bbffaa;
border: none;
color: black;
box-shadow: 2px 2px 5px #808080;
padding: 1% 2%;
font: '맑은 고딕';
}
</style>
</head>
<body>
<jsp:include page="./common/top.jsp"></jsp:include>
<div style="min-width:1200px;">
<form name="form1" method="post" action="vote">
<%@page import="java.sql.*,java.util.*"%>
<p>
<font size="10%">투표창</font>

</p>
<%

request.setCharacterEncoding("euc-kr");
Class.forName("com.mysql.jdbc.Driver");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
int cnt = 1;
String major = request.getParameter("major");
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");

try {
   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "student");
   stmt = conn.createStatement();
   rs = stmt.executeQuery("select * from candidateinfo where major= '"+ major +"';");
%>

<% while(rs.next()) { %>
<div id="box<%=cnt%>">
<br> 후보자 <%=cnt++%><br>
<br> 이름 : <%=rs.getString("name") %> <br>
<br> 공약 1 : <%=rs.getString("promise1") %> <br>
<br> 공약 2 : <%=rs.getString("promise2") %> <br>
<br> <INPUT TYPE="radio" NAME="AGREE" VALUE= <%= rs.getInt("candidatenum") %>>
<br><br> 
</div>
<%
} 
}catch (SQLException e) { %>
<% e.printStackTrace(); %>
<%   
} finally {
   if(rs!=null)
      try {
         rs.close();
      } catch (SQLException e) {}
   if(stmt!=null)
      try {
         stmt.close();
      } catch (SQLException e) {}
   if(conn!=null)
      try {
         conn.close();
      } catch (SQLException e) {}
}
%>
<INPUT TYPE=SUBMIT VALUE='투표하기' id=vote_button style="margin-left:46%; margin-top:10%;">
      </form>
      </div>
      <jsp:include page="./common/foot.jsp"></jsp:include>
   </body>
</html>