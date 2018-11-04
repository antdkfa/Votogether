import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
public class LogoutServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,
					  HttpServletResponse response)
					  throws IOException, ServletException{
		HttpSession session = request.getSession();
		session.removeAttribute("LOGIN_ID");
		response.sendRedirect("LogoutResult.jsp?LOGOUT_RESULT=SUCCESS");
	}
}