package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.FileDTO;

/**
 * Servlet implementation class BoardFileServlet
 */
@WebServlet("/uploadAction")
public class BoardFileServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		FileDTO file = new FileDTO();
		String realfilepath = file.getFileRealName();
		request.setAttribute("realfilepath", realfilepath);
		request.getRequestDispatcher("/boardList.jsp").forward(request, response);
    }

}
