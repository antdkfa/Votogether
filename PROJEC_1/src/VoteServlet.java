import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class VoteServlet extends HttpServlet {
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      HttpSession session = request.getSession();
      String id = (String) session.getAttribute("LOGIN_ID");
      String candidateVoted =request.getParameter("AGREE");
      Connection conn = null;
      Statement stmt = null;
      try {
         Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "student");
         if(conn == null) throw new Exception("데이터베이스에 연결할 수 없습니다.");
         stmt = conn.createStatement();
         ResultSet rsuser = stmt.executeQuery("select * from UserInfo where id = '" + id + "';");
         if (!rsuser.next()) throw new Exception();
         String usermajor = rsuser.getString("major");
         
         ResultSet rsvote = stmt.executeQuery("select * from candidateinfo where candidatenum = '" + candidateVoted  + "';");
         if (!rsvote.next()) throw new Exception();
         String votemajor = rsvote.getString("major");
         
         if (!votemajor.equals(usermajor)) {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("타학부 학생입니다.");
            out.close();
            throw new Exception();
         }
         ResultSet rsid = stmt.executeQuery("select * from VoteInfo where id = '" + id + "';");
         if (rsid.next()) {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("이미 투표하셨습니다.");
            out.close();
            throw new Exception();
         }
         String command = String.format("insert into VoteInfo " + "(id, major) values ('%s', '%s');", id, usermajor);
         int rowNum = stmt.executeUpdate(command);
         if(rowNum < 1) {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("데이터를 DB에 입력할 수 없습니다.");
            out.close();
            throw new Exception();
         }
         ResultSet rs = stmt.executeQuery("select * from candidateinfo where candidatenum = '" + candidateVoted  + "';");
         if(!rs.next())
            throw new Exception();
         int votefor = rs.getInt("candidatenum");
         int votesum = rs.getInt("candidateVoted");
         votesum++;
         String commandv = String.format("update candidateinfo set " + "candidateVoted := '%s' where candidatenum = '%s';", votesum,votefor);
         int rowNumb = stmt.executeUpdate(commandv);
         if(rowNumb < 1) {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("데이터를 DB에 입력할 수 없습니다."); 
            out.close();
            throw new Exception();
         }
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
      response.sendRedirect("VoteFinish.html");
   }

}