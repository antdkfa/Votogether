package web;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;

public class votingServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		String strUpperCn = request.getParameter("LAST_VOTING_NUM");
		int cn;
		if(strUpperCn == null)
			cn = Integer.MAX_VALUE;
		else
			cn = Integer.parseInt(strUpperCn);
		votingBean list = readDB(cn);
		votingBean list2 = readDB2(cn);
		request.setAttribute("CN_LIST", list);
		request.setAttribute("CN_LIST2", list2);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Main.jsp?BODY_PATH=VotingList.jsp");
		dispatcher.forward(request, response);
	}
	private votingBean readDB(int cn) throws ServletException {
		votingBean list = new votingBean();
		Connection conn = null;
		Statement stmt = null;
		Connection conn2 = null;
		Statement stmt2 = null;
		Connection conn3 = null;
		Statement stmt3 = null;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
	        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "student");
	        conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "student");
	        conn3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "student");
	        if(conn == null || conn2 == null || conn3 == null)
				throw new Exception("데이터 베이스 연결 노노");
			stmt=conn.createStatement();
			stmt2=conn2.createStatement();
			stmt3=conn3.createStatement();
			ResultSet rs =stmt.executeQuery("select * from vote where flag = '1';");
			
			
			for (int cnt = 0; cnt < 5; cnt++){
				if(!rs.next())
					break;
				
				list.setFlag(cnt,rs.getInt("flag"));

				list.setMajor(cnt,rs.getString("major"));
				String ma = rs.getString("major");
				ResultSet rs3 = stmt3.executeQuery("select count(*) as total from userinfo where major='"+ma+"';");
				if(rs3.next()){
					list.setTotal(cnt,rs3.getInt("total"));
					int to =rs3.getInt("total"); 
					
					 
				}
				ResultSet rs2 = stmt2.executeQuery("select count(*) as vote from voteinfo where major='"+ ma+ "';");
				if(rs2.next())
					list.setVote(cnt, rs2.getInt("vote"));
					int vo =rs2.getInt("vote"); 
			}		
		}
		catch(Exception e){
			throw new ServletException(e);
		}
		finally{
			try{
				stmt.close();
				stmt2.close();
				stmt3.close();
			}
			catch(Exception ignored){
			}
			try{
				conn.close();
				conn2.close();
				conn3.close();
			}
			catch(Exception ignored){
			}
		}
		return list;
	}
	private votingBean readDB2(int cn) throws ServletException {
		votingBean list2 = new votingBean();
		Connection conn = null;
		Statement stmt = null;
		Connection conn2 = null;
		Statement stmt2 = null;
		Connection conn3 = null;
		Statement stmt3 = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
	        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "student");
	        conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "student");
	        conn3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "student");
	        if(conn == null || conn2 == null || conn3 == null)
				throw new Exception("데이터 베이스 연결 노노");
			stmt=conn.createStatement();
			stmt2=conn2.createStatement();
			stmt3=conn3.createStatement();
			ResultSet rs =stmt.executeQuery("select * from vote where flag = '2';");
			for (int cnt = 0; cnt < 5; cnt++){
				if(!rs.next())
					break;
				list2.setFlag(cnt,rs.getInt("flag"));
				
				list2.setMajor(cnt,rs.getString("major"));
				String ma2 = rs.getString("major");
				ResultSet rs3 = stmt3.executeQuery("select count(*) as total from userinfo where major='"+ma2+"';");
				if(rs3.next()){
					list2.setTotal(cnt,rs3.getInt("total"));
					int to2 =rs3.getInt("total");
				
				}
				ResultSet rs2 = stmt2.executeQuery("select count(*) as vote from voteinfo where major='"+ ma2+ "';");
				if(rs2.next())
					list2.setVote(cnt, rs2.getInt("vote"));
					int vo2 =rs2.getInt("vote"); 
				
			}
			
			 
		}
		catch(Exception e){
			throw new ServletException(e);
		}
		finally{
			try{
				stmt.close();
				stmt2.close();
				stmt3.close();
			}
			catch(Exception ignored){
			}
			try{
				conn.close();
				conn2.close();
				conn3.close();
			}
			catch(Exception ignored){
			}
		}
		return list2;
	}
}
