package board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/boardUpdate")
public class BoardUpdateServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		//��û�� ���鿡 ���� ���ڵ�
		request.setCharacterEncoding("UTF-8");
		//���信 ���� �ѱ� ���ڵ�
		response.setContentType("text/html; charset=UTF-8");
		//���ǿ� bean��ü�� read.jsp ����.
		HttpSession session = request.getSession();
		BoardBean bean = (BoardBean)session.getAttribute("bean");
		String dbPass = bean.getPass();
		String inPass = request.getParameter("pass");
		if(dbPass.equals(inPass)) {
			//����� ���� �� ���� ó��
			BoardMgr mgr = new BoardMgr();
			bean.setId(request.getParameter("id"));
			bean.setSubject(request.getParameter("subject"));
			bean.setContent(request.getParameter("content"));
			mgr.updateBoard(bean);
			String nowPage = request.getParameter("nowPage");
			String numPerPage = request.getParameter("numPerPage");
			response.sendRedirect("read.jsp?nowPage="+nowPage+
					"&numPerPage="+numPerPage+
					"&num="+bean.getNum());
		}else {
			//��� Ʋ�ȴٰ� ���â
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('�Է��Ͻ� ��й�ȣ�� �ƴմϴ�.');");
			out.println("history.back();");
			out.println("</script>");
		}
	}
}








