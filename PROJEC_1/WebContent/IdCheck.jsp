

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String id = request.getParameter("id");
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	boolean result = false;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "student");
		if(conn == null)
			throw new Exception("데이터베이스에 연결할 수 없습니다.");
		stmt = conn.createStatement();
		rs = stmt.executeQuery("select * from UserInfo where id = '" + id + "';");
	}
	catch (SQLException se){
		System.out.println(se.getMessage());
	}
	%>
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>아이디 중복 확인</title>
		<style type="text/css">
			#wrap {
				width: 490px;
				text-align:center;
				margin: 0 auto 0 autu;
			}
			#chk {
				text-align :center;
			}
		</style>
		<script type="text/javascript">
			function pValue() {
				document.input.id.value = opener.document.input.id.value;
			}
			function checkIdClose(id){
				opener.document.input.idDuplication.value ="idCheck";
				opener.input.id.value = id;
				window.close();
				opener.input.password.focus();
			}
			function checkId() {
				if (!document.input.id.value){
					alert("입력된 아이디가 없습니다.")
					return false;
				}
			}
		</script>
	</head>
	<body onload="pValue()">
		<div id="wrap">
			<br>
			<b><font size="4" color="gray">아이디 중복체크</font></b>
			<hr size="1" width="460">
			<br>
			<div id="chk">
			<form name="input" method=post action="IdCheck.jsp" onSubmit="return checkId()">
				<%
					try{
						if(rs.next()){
							result = true;
							%>
							<%=id %>는 이미 사용중인 아이디입니다.<br>
							아이디 입력: <input type="text" name="id" placeholder="아이디 입력">
							<input type="submit" value="중복체크">
							<input type="button" value="취소" onclick="window.close()" style="margin-left:1.5%">
					<%	}
						else if(id == null){
							%>
							아이디 입력: <input type="text" name="id" placeholder="아이디 입력">
							<input type="submit" value="중복체크">
							<input type="button" value="취소" onclick="window.close()" style="margin-left:1.5%">
					<%	}
						else{
							 %>
							 <%=id %>는 사용가능한 아이디입니다.<br>
							 <a href="IdCheck.jsp">다른 아이디 입력</a><br>
							 <input type="button" value="사용하기" onclick="checkIdClose('<%=id %>');" style="margin-left:42%">
							 <input type="button" value="취소" onclick="window.close()" style="margin-left:1.5%">
					<%	}
					}
					catch(SQLException e){
						e.printStackTrace();
					}
					finally{
						try{
							stmt.close();
						}
						catch (Exception ignored){}
						try{
						conn.close();
						}
						catch (Exception ignored){}
					}
				%>
			</form>
			</div>
		</div>
	</body>
	</html>