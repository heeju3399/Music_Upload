<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	request.setCharacterEncoding("UTF-8");
	Object sid = session.getAttribute("idKey");
	String id = request.getParameter("id");
	String email = request.getParameter("email");
	
//아이디 이메일을 확인한후 비밀번호 교체작업이 이루어져야한다.....
%>
<html>
<head> 
<title>PASS_CHANGE</title>
<script src="member.js">
</script>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap"
	rel="stylesheet">

<style>
body {
	font-family: Nanum Myeongjo;
	
}
</style>
<link rel="stylesheet" href="../main/assets/css/main.css" />
</head> 
<body topmargin="100">
	<header id="header">
		<div class="inner">
			<a href="../main/main.jsp" class="logo">C O M M A</a>
			<nav id="nav">
				<a href="">인기차트<%=id %></a> 
				<a href="">인기차트2<%=email %></a> 
				<a href="">업로드</a> 
				<a href="">업로드</a>
				<%
					if (sid != null) {
				%>
				<a href="">회원관리</a>
				<%
					} else {
				%>
				<a href="sign-in.jsp">로그인</a> <a href="sign-up.jsp">회원가입</a>
				<%
					}
				%>
			</nav>
		</div>
	</header>
	<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>
	<section id="footer">
		<div class="inner">
			<header>
				<h1>
					<a href="" style="text-decoration: none;">비밀번호 수정</a> 
				</h1> 
				<br>
			</header>
			<form method="post" name="Form3" action="memberPassReWrite4.jsp">
				<div class="field">
					<label for="pass">PASS</label>  
					<input type="password" name="m_pwd"/>
				</div>
				<div class="field">
					<label for="pass">REPASS</label> 
					<input type="password" name="repwd" />
				</div>
				<br> 
				<input type="button" value="비밀번호수정"
					onclick="rewritepass()"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
				&nbsp; 
				<input type="reset" value="다시쓰기">
				<input type="hidden" name="m_id" value="<%=id%>">
				<input type="hidden" name="m_email" value="<%=email%>">
				</form>
		<div class="copyright">
			&copy; Untitled Design: <a href="">COMMA</a>. SNAGHEE <a href="">DISIGN</a>
		</div>
	</div>
	</section>
	<script src="../main/assets/js/jquery.min.js"></script>
	<script src="../main/assets/js/skel.min.js"></script>
	<script src="../main/assets/js/util.js"></script>
	<script src="../main/assets/js/main.js"></script>
</body>
</html>
