package web;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;

public class promiseServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("euc-kr");
		String major = request.getParameter("major");
		
		String strUpperCn = request.getParameter("LAST_CANDIDATE_NUM");
		int cn;

		if(strUpperCn == null)
			cn = Integer.MAX_VALUE;
		else
			cn = Integer.parseInt(strUpperCn);
		candidateBean list = readDB(cn, major);
		request.setAttribute("CN_LIST", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("promiseList.jsp");
		dispatcher.forward(request, response);
	}

	private candidateBean readDB(int cn, String major) throws ServletException {
		candidateBean list = new candidateBean();
		Connection conn = null;
		Statement stmt = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
	        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "student");
			if(conn == null)
				throw new Exception("데이터 베이스 연결 노노");
			stmt=conn.createStatement();
			ResultSet rs =stmt.executeQuery("select * from candidateinfo where major ='"+major+"';");
			int count=1;
			for (int cnt = 0; cnt < 3; cnt++){
				if(!rs.next())
					break;
				list.setCandidatenum(cnt,count++);
				list.setName(cnt,rs.getString("name"));
				list.setPromise1(cnt,rs.getString("promise1"));
				list.setPromise2(cnt,rs.getString("promise2"));
			}
		}
		catch(Exception e){
			throw new ServletException(e);
		}
		finally{
			try{
				stmt.close();
			}
			catch(Exception ignored){
			}
			try{
				conn.close();
			}
			catch(Exception ignored){
			}
		}
		return list;
	}

}
