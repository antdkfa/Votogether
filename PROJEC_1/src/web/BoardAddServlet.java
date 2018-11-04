package web;
 
import java.io.IOException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.Board;
import service.BoardDao;
 
@WebServlet("/boardAdd")
public class BoardAddServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/boardAdd.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("euc-kr");
        HttpSession session = request.getSession();
        String boardPw = request.getParameter("boardPw");
        System.out.println("param boardPw:"+boardPw);
        String boardTitle = request.getParameter("boardTitle");
        System.out.println("param boardTitle:"+boardTitle);
        String boardContent = request.getParameter("boardContent");
        System.out.println("param boardContent:"+boardContent);
        String boardUser =  (String)session.getAttribute("LOGIN_ID");
        System.out.println("param boardUser:"+boardUser);
         
        Board board = new Board();
        board.setBoardPw(boardPw);
        board.setBoardTitle(boardTitle);
        board.setBoardContent(boardContent);
        board.setBoardUser(boardUser);
         
        BoardDao boardDao = new BoardDao();
        int rowCount = boardDao.insertBoard(board);
        // rowCout�� 1�̸� �Է¼��� 
        response.sendRedirect(request.getContextPath()+"/boardList");
    }
}

