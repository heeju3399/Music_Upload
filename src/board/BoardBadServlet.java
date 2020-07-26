package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/boardBad")
public class BoardBadServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int totalRecord = 0;// 총게시물수
		int numPerPage = 10;// 페이지당 레코드 개수(5,10,15,30)
		int pagePerBlock = 10;// 블럭당 페이지 개수
		int totalPage = 0;// 총 페이지 개수
		int totalBlock = 0;// 총 블럭 개수
		int nowPage = 1;// 현재 페이지
		int nowBlock = 1;// 현재 블럭
		HttpSession session = request.getSession();
		String sid = (String) session.getAttribute("idKey");

		// 요청된 numPerPage 처리
		// 요청이 있으면 처리가 되지만 그렇지 않으면 기본 10개 세팅이 된다.
		if (request.getParameter("numPerPage") != null) {
			numPerPage = UtilMgr.parseInt(request, "numPerPage");
		}

		// 검색에 필요한 변수
		String keyField = "", keyWord = "";
		// 검색일때
		if (request.getParameter("keyWord") != null) {
			keyField = request.getParameter("keyField");
			keyWord = request.getParameter("keyWord");
		}

		// 검색 후에 다시 처음화면 요청
		if (request.getParameter("reload") != null && request.getParameter("reload").equals("true")) {
			keyField = "";
			keyWord = "";
		}
		BoardMgr mgr = new BoardMgr();
		totalRecord = mgr.getTotalCount(keyField, keyWord);
		// out.print("totalRecord : " + totalRecord);

		// nowPage 요청 처리
		if (request.getParameter("nowPage") != null) {
			nowPage = UtilMgr.parseInt(request, "nowPage");
		}

		// sql문에 들어가는 start, cnt 선언
		int start = (nowPage * numPerPage) - numPerPage;
		int cnt = numPerPage;

		// 전체페이지 개수
		totalPage = (int) Math.ceil((double) totalRecord / numPerPage);
		// 전체블럭 개수
		totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
		// 현재블럭
		nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);
		
		BoardMgr boardMgr = new BoardMgr();		
		int num = Integer.parseInt(request.getParameter("num"));
		boardMgr.upBad(num);
		
		
		response.sendRedirect("list.jsp?nowPage=" + nowPage + "&numPerPage=" + numPerPage);
	}
}
