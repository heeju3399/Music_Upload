<%@page import="board.BoardMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardMgr mgr = new BoardMgr();
	String num = request.getParameter("num").toString();
	String nowPage = request.getParameter("nowPage").toString();
	mgr.deleteBoard(Integer.parseInt(num));
	RequestDispatcher rd = request.getRequestDispatcher("studio.jsp");
	request.setAttribute("num", num);
	request.setAttribute("nowPage", nowPage);
	rd.forward(request, response);
%>