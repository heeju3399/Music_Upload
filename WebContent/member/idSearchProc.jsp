<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="mgr" class="mail.MailSend"/>
<%
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("m_email");
		boolean result = mgr.sendIdAndEmail(email);
		String msg = "회원가입되지 않은 메일입니다.";
		String url = "idSearch.jsp";
		if(result){
			msg = "OK";
			url = "sign-in.jsp";
		}
%>
<script>
	alert("<%=msg%>"); 
	location.href = "<%=url%>";
</script>