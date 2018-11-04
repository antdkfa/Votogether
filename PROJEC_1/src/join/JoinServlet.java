package join;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*; 
import web.UserInfoBean;

public class JoinServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String major = request.getParameter("major");
		String majorNum = request.getParameter("majorNum");
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			 Class.forName("com.mysql.jdbc.Driver");
	         conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "student");
			 if(conn == null) throw new Exception("데이터베이스에 연결할 수 없습니다.");
			 stmt = conn.createStatement();
			 rs = stmt.executeQuery("select * from UserInfo where majorNum = '" + majorNum + "';");
			 if (rs.next()) {
				 response.setCharacterEncoding("UTF-8");
				 response.setContentType("text/html; charset=UTF-8");
				 PrintWriter out = response.getWriter();
				 out.println("학번을 잘못 입력하셨습니다."); 
				 out.close();
				 throw new Exception();
			 }
			 String command = String.format("insert into userinfo " + "(id, password, name, major, majorNum) values ('%s', '%s', '%s', '%s', '%s');", id, password, name, major, majorNum);
			 int rowNum = stmt.executeUpdate(command);
			 if(rowNum < 1) {
				 response.setCharacterEncoding("UTF-8");
				 response.setContentType("text/html; charset=UTF-8");
				 PrintWriter out = response.getWriter();
				 out.println("데이터를 DB에 입력할 수 없습니다."); 
				 out.close();
				 throw new Exception("");
			 }
			 UserInfoBean obj = new UserInfoBean();
			 obj.setId(id);
			 obj.setPassword(password);
			 obj.setName(name);
			 obj.setMajor(major);
			 obj.setMajorNum(majorNum);
		}
		catch (Exception e) {
		}
		finally{
			try{
				stmt.close();
			}
			catch(Exception ignored) {
			}
			try{
				conn.close();
			}
			catch(Exception ignored) {
			}
		}
		response.sendRedirect("Login.html");
	}

}
