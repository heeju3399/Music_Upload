<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
Object sid = session.getAttribute("idKey");
//아이디 이메일을 확인한후 비밀번호 교체작업이 이루어져야한다.....
%>
<html>
<head>
<title>Identification</title> 
<script src="member.js"> 
</script>
<link rel="stylesheet" href="../main/assets/css/main.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap"
	rel="stylesheet">

<style>
body {
	font-family: Nanum Myeongjo;
	
}
</style>
</head>
<body topmargin="100">
	<header id="header">
		<div class="inner">
			<a href="../main/main.jsp" class="logo">C O M M A</a>
			<nav id="nav">
				<a href="">인기차트</a> <a href="">인기차트2</a> <a href="">업로드</a> <a
					href="">업로드</a>
				<%
					if (sid != null) {
				%>
				<a href="">회원관리</a>
				<%
					} else {
				%>
				<a href="sign-in.jsp">로그인</a> 
				<a href="sign-up.jsp">회원가입</a>
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
					<a href="" style="text-decoration: none;">본인확인</a>
				</h1>
				<br>
			</header>

			<form method="post" name="regForm2" action="memberPassReWrite2.jsp">
					<div class="field">
						<label for="name">ID</label> 
						<input type="text" name="m_id" />
					</div> 
					<div class="field">
						<label for="email">EMAIL</label>   
						<input type="email" name="m_email" />
					</div>
					<div>
						<br>
						<input type="button" value="본인확인" onclick="idEmailcheck()"> 
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
						<input type="reset" value="다시쓰기"> 
					</div>
				 
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
