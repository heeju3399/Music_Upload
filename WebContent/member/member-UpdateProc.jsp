<!-- memberUpdateProc.jsp -->
<%@page contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="mgr" class="mgr.MemberMgr"/>
<jsp:useBean id="bean2" class="bean.MemberBean"/>
<jsp:setProperty property="*" name="bean2"/>
<%
		request.setAttribute("a", bean2.getM_id());
		boolean result = mgr.updateMemberBean(bean2);
		
		if(result){
%>
		<script>
			alert("회원정보를 수정 하였습니다.");
			location.href = "../main/main.jsp";
		</script>
<%}else{%>
		<script>
			alert("회원정보 수정에 실패 하였습니다.");
			history.back();
		</script> 
<%}%>






