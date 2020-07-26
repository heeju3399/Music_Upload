<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mgr" class="mgr.MemberMgr" />
<%
	String id = request.getParameter("m_id");
	String email = request.getParameter("m_email");
	int result = mgr.identifyIdAndEmail(id, email);
	String msg = "가입하신 아이디가 아닙니다.";
	String url = "memberPassReWrite.jsp";
	String name = "";
	if (result == 0) {//아이디가 없음 
		
	} else if (result == 1) {//OK      
		msg = "OK";
		url = "memberPassReWrite3.jsp";
	} else if (result == -1) {//이메일이 안맞음  
		msg = "가입하신 이메일이 아닙니다.";
	}
%>
<form method="post" action="<%=url%>" id="paramterForm">
	<input type="hidden" name="id" value="<%=id%>"> 
	<input type="hidden" name="email" value="<%=email%>">
</form>
<script>
	alert('<%=msg%>'); 
	this.document.getElementById("paramterForm").submit();
</script>

