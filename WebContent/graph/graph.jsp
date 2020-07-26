<%-- <%@page import="org.json.simple.JSONArray"%>

<%@page import="dao.MemberDao"%>

<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	memberDao memberDao = MemberDao.getInstance();

	JSONArray jsonArray = memberDao.getCountAddress();

	//out.println(jsonArray);
%>

<%=jsonArray%> --%>