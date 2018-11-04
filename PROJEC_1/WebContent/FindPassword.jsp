<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import ="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>비밀번호 찾기</title>
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
</head>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String name = request.getParameter("name");
	String id= request.getParameter("id");
	web.UserBean manager = web.UserBean.getInstance();
	web.UserDataBean c = manager.searchPassword(name, id);
	boolean result = false;
	if(c != null) result = true;
	try {
%>
<body>
<div id="wrap">
	<br>
		<b><font size="4" color="gray">비밀번호 찾기</font></b>
		<hr size="1" width="460">
		<br>
		<div id="chk">
<%
		if(result){
%>		<%= name %>님의 비밀번호는
			<%
				String sPassword = c.getPassword().substring(0, 3);
				for (int i = 3; i < c.getPassword().length(); i++)
					sPassword += "*";
			%><%= sPassword %>입니다.
			<input type="submit" value="확인" onclick="window.close()">
<%	}
		else {
			out.println("가입되지 않은 이름입니다.");%>
			<input type="submit" value="확인" onclick="window.close()">
	  <%}
	  }catch (Exception e){}
%>
</div>
</div>
</body>
</html>