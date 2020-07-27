<!-- list.jsp -->
<%@page import="board.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="board.UtilMgr"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

String sid = (String) session.getAttribute("idKey");
%>
<jsp:useBean id="mgr" class="board.BoardMgr" />
<html>
<head>
<title>Comma Board</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../main/assets/css/main.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap"
	rel="stylesheet">
<style>
.top-margin-hr {
	margin-top: 0.5rem;
	border: 0px;
}

button {
	background-color: black;
	overflow: hidden;
	font-size: 0.5rem;
	width: 10%;
	margin-right: 1px;
}

#header {
	background-color: black;
	color: #dc3545;
}

html, body {
	width: 100%;
	height: 100%;
	overflow: hidden;
}

body {
	font-family: Nanum Myeongjo; // /*transform: scale(0.8);*/
	position: relative;
	background-color: none;
	height: 100%;
	overflow-y: hidden;
}

h1, h2, h3, h4, h5, h6 {
	color: black;
	font-weight: 900;
}

h6 {
	font-weight: normal;
}

.r180 {
	transform: rotate(180deg);
}

#player {
	bottom: 0;
	background-color: #dc3545;
	display: absolute;
}

#comma {
	background-color: #dc3545;
	padding: 1rem;
	display: block;
	height: 80%;
	overflow-y: 1rem;
	width: 100%;
	margin-top: -4rem;
	overflow-y: scroll;
	transform: scale(0.80);
}

#comma::-webkit-scrollbar {
	width: 1rem;
	height: 1rem;
}

#comma::-webkit-scrollbar-track-piece {
	background-color: black;
}

#comma::-webkit-scrollbar-thumb:vertical {
	background-color: gray;
	height: 1rem;
	opacity: 0.5;
}

.center {
	text-align: center;
}

#copyright {
	margin-top: -4rem;
	transform: scale(0.8);
}
</style>
<script type="text/javascript">
	function read(num) {
		document.readFrm.num.value = num;
		document.readFrm.action = "read.jsp";
		document.readFrm.submit();
	}

	function like(num) {
		//alert(num);
		document.likeFrm.action = "boardLike";
		document.likeFrm.num.value = num;
		document.likeFrm.submit();
	}

	function bad(num) {
		//alert(num);
		document.badFrm.action = "boardBad";
		document.badFrm.num.value = num;
		document.badFrm.submit();
	}
</script>
<style>
table, tr, td {
	border-collapse: collapse;
}

td, th {
	text-decoration: underline;
}
</style>
<style>
body { // /*transform: scale(0.8);*/
	
}

#columns {
	column-width: 300px;
	column-gap: 10px;
	font-size: 1rem;
}

#columns figure:hover {
	opacity: 0.8;
}

#columns figure {
	background-color: white;
	display: inline-block;
	border: 1px solid rgba(0, 0, 0, 0.2);
	margin-bottom: 10px;
	padding: 10px;
	box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
	width: 300px;
}

#columns figure img {
	width: 280px;
	height: auto;
}

#columns figure figcaption {
	border-top: 1px solid rgba(0, 0, 0, 0.2);
	padding: 10px;
}
</style>
<style>
#play-bar {
	position: relative;
	text-align: left;
	margin: 0;
	padding: 0;
	padding-left: 1rem;
	margin-left: 2rem;
}

#play-audio-info {
	display: none;
	color: white;
	width: 100%;
	height: 300px;
}

#play-audio-info table {
	width: 100%;
	float: left;
	height: 250px;
}

#play-audio-nfo tr {
	width: 100%;
}

#play-audio-info table, tr, td {
	border: 0px solid black;
}
</style>
<script>
	var max = 5;
</script>
</head>
<body>

	<header id="header">
		<div class="inner">
			<a href="../main/main.jsp" class="logo">C O M M A </a>
			<nav id="nav">
				<a class="kkk" href="../top100/top100.jsp">차트</a> <a
					href="../board/list.jsp">최신 업로드</a>
				<%
					if (sid != null) {
				%>
				<a href="../studio/studio.jsp">스튜디오</a> <a
					href="../member/member-Update.jsp">&nbsp;&nbsp;회원수정(<%=sid%>)&nbsp;&nbsp;
				</a> <a href="../member/logout.jsp">로그아웃</a>
				<%
					} else {
				%>
				<a href="../member/sign-in.jsp">로그인</a> <a
					href="../member/sign-up.jsp">회원가입</a>
				<%
					}
				%>
			</nav>
		</div>
	</header>
	<br>
	<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>
	<div id="play-bar">
		<audio src="test.mp3" id="audio"></audio>
	</div>
	<br>
	<div id="comma">
		<div id="columns">
			<%
				Vector<BoardBean> vlist = mgr.getBoardList();
			int listSize = vlist.size();//브라우저 화면에 표시될 게시물 번호
			if (vlist.isEmpty()) {
				out.println("등록된 게시물이 없습니다.");
			} else {

				for (int i = 0; i < vlist.size(); i++) {
					if (i == listSize)
				break;

					BoardBean bean = vlist.get(i);
					int num = bean.getNum();//게시물 번호
					String subject = bean.getSubject();//제목
					String id = bean.getId();//이름
					String regdate = bean.getRegdate();//날짜
					String regok = regdate.substring(5, 10);
					int depth = bean.getDepth();//답변의 깊이
					int count = bean.getCount();//조회수
					String filename = bean.getFilename();//첨부파일
					String img = bean.getMyimgname();
					String name = bean.getName();
					int like = bean.getLike();
					int bad = bean.getBad();

					//댓글 count
					//int bcount = cmgr.getBCommentCount(num);
					int bcount = 0;
			%>

			<figure class="hoho">
				<img src="fileupload/<%=vlist.get(i).getMyimgname()%>" alt="이미지 없음">
				<figcaption>
					<span class="hoho"
						style="float: left; font-size: 0.8rem; overflow: hidden;">
						&lt;<%=vlist.get(i).getSubject()%>&gt;
					</span> <span style="float: right;"> <%=regok%>
					</span>
					<div style='font-weight: 900; width: 100%; clear: both;'>
						<%=vlist.get(i).getName()%>
					</div>
					<div>
					
						<button id='text-align:right;'
							onclick="location.href='artist.jsp?name=<%=name%>&num=<%=num%>'">
							<span class='fa fa-user'></span>
						</button>
						<span style='color: red;'><%=vlist.get(i).getLike()%></span> / <span><%=vlist.get(i).getBad()%></span>

					</div>
				</figcaption>
			</figure>

			<%
				}	
			%>
		</div>
	</div>

	<%
		}
	%>
	<form name="likeFrm" method="post">
		<input type="hidden" name="reload" value="true"> <input
			type="hidden" name="nowPage" value="1"> <input type='hidden'
			name='num' value=''>
	</form>

	<form name="badFrm" method="post">
		<input type="hidden" name="reload" value="true"> <input
			type="hidden" name="nowPage" value="1"> <input type='hidden'
			name='num' value=''>
	</form>

	<div id="copyright" style='text-align: center;' class='copyright'>
		<hr>
		&copy; <a href="https://github.com/32Lab">Comma Lab</a>
	</div>

	<script>
	
	function goPage(page) {
		location.href = page;
	}
	</script>

</body>
</html>