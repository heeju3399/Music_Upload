<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mgr" class="mgr.MemberMgr" />
<jsp:useBean id="bean" class="bean.MemberBean" />
<jsp:setProperty property="*" name="bean" />
<!-- // 0 = id false, -1 = id true pass-false, 1=id&pass true, 2=업데이트못한거임, 1이면 모두 오케이 -->
<%
	String url = "sign-in.jsp";
	if (request.getParameter("url") != null && !request.getParameter("url").equals("null")) {
		url = request.getParameter("url");
	}
	int result = mgr.signIn(bean);
	String msg = "뭔가모를에러";
	if (result == 1) {
		msg = "OK";
		url = "../main/main.jsp";
		session.setAttribute("idKey", bean.getM_id());
	}
	if (result == -1) {
		msg = "비밀번호가 틀렸습니다.";
		url = "sign-in.jsp";
	}
	if (result == 0) {
		msg = "그런 아이디 없어요.";
		url = "sign-in.jsp";
	}
	if(result == 4){
		msg="관리자님 안녕하세요";
		url = "admin/admin.jsp";		
	}
%>

<script>
alert("<%=msg%>");
location.href = "<%=url%>";
</script>