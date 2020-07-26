<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <jsp:useBean id="mgr" class="mgr.MemberMgr"/>
    <%
    	String id2 = (String)request.getParameter("m_id");
    	String email2 = (String)request.getParameter("m_email");
    	String pass2 = (String)request.getParameter("m_pwd");
    	boolean result = mgr.reWritePass(id2, email2, pass2); 
    	String msg = "";
    	String url = ""; 
     	if(result){//트루면 오케이 
     		msg = "OK"; 
     		url = "../main/main.jsp";
     		session.setAttribute("idKey", id2);
     	}else{//해커임
     		msg="사이버 수사대 자진 신고 요망";
    		url = "https://www.krcert.or.kr/consult/hacking.do";
     	}
    %>
<script>
	alert('<%=msg%>'); 
	location.href="<%=url%>";
</script>