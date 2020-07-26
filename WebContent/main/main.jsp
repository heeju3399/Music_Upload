<%@page import="board.BoardMgr"%>
<%@page import="mgr.TopMgr"%>
<%@page import="bean.TopBean"%>
<%@page import="board.BoardBean"%>
<%@page import="org.apache.catalina.Session"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bean.EmotionBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="bean" class="bean.MemberBean" />
<jsp:useBean id="bmgr" class="board.BoardMgr"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
String sid = (String) session.getAttribute("idKey");
String session22 = session.getId();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COMMA-MAIN</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />

<link rel="stylesheet" href="assets/css/main.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap"
	rel="stylesheet">
<style>

.col:hover{
	filter:blur(1px);
}
a {
	font-size: 1.2rem;
	color: black;
	font-weight: 800;
}

a:visited {
	color: black;
}

a:after {
	color: black;
}

a:active {
	color: black;
}

a:befor {
	color: black;
}

a:hover {
	opacity: 0.85;
}

html, body {
	width: 100%;
	height: 100%;
	position: relative;
	overflow: hidden;
}

#volume {
	background-color: yellow;
	width: 100%;
	height: 20px;
}

#volume_label {
	background-color: black;
	color: white;
}

#volume_size {
	background-color: yellow;
	display: inline-block;
	width: 1px;
}
</style>
<style>
button {
	background-color: #dc3245;
	border-radius: 1rem;
	border: 0px;
}

button:hover {
	background-color: black;
}

#toggle {
	right: 0;
	color: black;
	background-color: black;
	border-radius: 1rem;
	width: 3rem;
	height: 3rem;
	border-radius: 0px;
	position: absolute;
	bottom: 1.5rem;
	right: 2rem;
	z-index: 1;
}

#audio {
	margin: 0;
	box-sizing: border-box;
	width: 100%;
	bottom: 0;
	border-radius: 0px;
	position: absolute;
	background-color: black;
	height: 3rem;
	margin-bottom: 24px;
	filter: invert(100%);
}

* {
	outline: none;
}

audio::-webkit-media-controls-panel {
	background-color: white;
	border-radius: 0;
	margin-right: 1rem;
}

audio::-webkit-media-controls-mute-button {
	background-color: white;
	border-radius: 0;
	margin-right: 1rem;
}

audio::-webkit-media-controls-play-button {
	background-color: white;
	border-radius: 0;
	margin-right: 1rem;
}

audio::-webkit-media-controls-panel {
	background-color: white;
	border-radius: 0;
	margin-right: 1rem;
}

html, body {
	margin: 0px;
	padding: 0px;
	width: 100%;
	height: 100%;
}

body {
	font-family: Nanum Myeongjo;
	font-size: 0.65rem;
}

.comma {
	color: #dc3545;
}

.table {
	display: table;
}

.row {
	display: table-row;
}

section {
	margin-top: 5vh;
}

#visualizer {
	position: relative;
	height: 75vh;
	position: relative;
	height: 75vh;
	width: 100%;
}

.entry {
	width: 15vw;
	height: 15vw;
	padding-top: 1vw;
	color: white;
	position: relative;
}

.entry-info {
	width: 15vw;
	height: 5vw;
	margin-top: 1vw;
	padding-bottom: 1vw;
	overflow: hidden;
}

.entry-bg {
	position: absolute;
	top: 0;
	width: 100%;
	height: 100%;
	filter: 0;
	background-position: center;
	background-size: contain;
	background-position: center;
	background-size: contain;
	background-position: center;
}

.entry-bg:hover {
	position: absolute;
	top: 0;
	width: 100%;
	height: 100%;
	filter: blur(0px);
	background-position: center;
	background-size: contain;
}

.entry:hover {
	background-color: #dc3545;
}

.entry-img {
	display: none;
	top: 0;
	margin: 1vw;
	padding: 1vw;
	background-position: center center;
	background-size: cover;
	background-repeat: no-repeat;
	width: 6vw;
	height: 6vw;
	top: 0;
}

.col {
	display: table-column;
}

.center-box {
	display: relative;
	width: 100%;
	heigiht: 100%;
}

.center {
	font-color: lightpink;
	position: absolute;
	top: 0;
	width: 50%;
	height: 50%;
	left: 0;
	transform: translate(-50%, -50%);
	position: absolute;
}
</style>
<style>
#comma-hot-10 {
	width: 90%;
	position: absolute;
	bottom: 0;
	position: absolute;
	height: 65%;
	margin-left: 5%;
	margin-bottom: 15%;
	transform: scale(0.90);
}
</style>
</head>
<%
	TopMgr topMgr = new TopMgr();
Vector<TopBean> tBeans = topMgr.getTopBean();
BoardMgr boardMgr = new BoardMgr();
%>

<body>
	<!-- Header -->
	<header id="header">
		<div class="inner">
			<a href="main.jsp" class='logo'>C O M M A </a>
			<nav id="nav">
				<a class="kkk" href="../top100/top100.jsp">차트</a> <a
					href="../board/list.jsp">최신 업로드</a>
				<!-- 				<a href="../upload/fileUpload.jsp">파일업로드</a> -->
				<%
					if (sid != null) {
				%>
				<a href="../studio/studio.jsp">나의 스튜디오</a><a
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
	<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>
	<!-- 막대기 사운드 출력 -->
	<div id='comma-hot-10'>
		<section>
			<div class="table">
				<div class='row'>

					<%
						Vector<BoardBean> likeTop5 = bmgr.getTopLike5();
					%>
				</div>
				<div class='row'>
					<%
						for (int i = 0; i < likeTop5.size(); i++) {
						BoardBean likeBean = likeTop5.get(i);
					%>
					<div class='col'>
						<div class='entry'>
							<div class='entry-bg'
								style="
							background-image: url('../board/fileupload/<%=likeBean.getMyimgname()%>');
							background-size:cover;
						">
								<br>
							</div>
							<div class='entry-img'
								style="background-image: url('../board/fileupload/<%=likeBean.getMyimgname()%>');
							background-size:cover;
							">
							</div>

						</div>
						<div class='entry-info'>
							<div>
								<button
									onclick="playSong('../board/fileupload/<%=likeBean.getFilename()%>')">
									<span class='fa fa-play'></span>
								</button>
							</div>
							<div>
								<span> <a 	href="../board/artist.jsp?num=<%=likeBean.getNum()%>&name=<%=likeBean.getName()%>'">
										<%=likeBean.getName()%></a>
								</span> - <span><%=likeBean.getSubject()%></span>

							</div>
						</div>
					</div>
					<%
						}
					%>
				</div>
			</div>
			<div class="table">
				<div class='row'>


					<%
						Vector<BoardBean> viewTop5 = bmgr.getTopView5();
					%>
				</div>
				<div class='row'>
					<%
						for (int i = 0; i < viewTop5.size(); i++) {
						BoardBean topBean = viewTop5.get(i);
					%>
					<div class='col'>
						<div class='entry'>
							<div class='entry-bg'
								style="
							background-image: url('../board/fileupload/<%=topBean.getMyimgname()%>');
							background-size:cover;
						">
								<br>
							</div>
							<div class='entry-img'
								style="background-image: url('../board/fileupload/<%=topBean.getMyimgname()%>');
							background-size:cover;
							">
							</div>

						</div>
						<div class='entry-info'>
							<div>
								<button
									onclick="playSong('../board/fileupload/<%=topBean.getFilename()%>')">
									<span class='fa fa-play'></span>
								</button>
							</div>
							<div>
								<span> <a
									href="onclick=location.href='../board/artist.jsp?num=<%=topBean.getNum()%>&name=<%=topBean.getName()%>'">
										<%=topBean.getName()%></a>
								</span> - <span><%=topBean.getSubject()%></span>

							</div>
						</div>
					</div>
					<%
						}
					%>
				</div>
			</div>
		</section>
	</div>
	<div id='visualizer'>
		<div id="chart-container"
			style="width: 500px; height: 500px; margin: auto;"></div>

		<!-- 막대기 사운드 출력 -->
		<canvas id="canvas" width="800" height="350"
			style="position: relative; left: 25vw; top: -250px;"></canvas>
		<br /> <br />


		<script src="dist/circular-audio-wave.min.js"></script>
		<script>
			let wave = new CircularAudioWave(document
					.getElementById("chart-container"));
			wave.loadAudio("mp3/test.mp3");
		</script>


		<script>
			// var audio = document.getElementById("audio");

			// var volume_size = document.getElementById("volume_size");
			// console.log(volume_size);

			// var i = 0;
			// volume_size.style.backgroundColor = "white";

			// setInterval(function () {
			//   i = audio.volume * 100;
			//   if (i > 300) {
			//     clearInterval(this);
			//   } else {
			//     volume_size.style.width = i + "px";
			//     console.log(volume_size.style.width);
			//     i++;
			//   }
			//90px에서 멈추게한다.
			// }, 10);
			//속도 1초가1000 , 10초가 100 ms
		</script>
	</div>
	<audio controls="controls" id="audio"
		style="position: absolute; bottom: 0px;">
		<source src="./mp3/test.mp3" type="audio/mp3" />
	</audio>
	<button id='toggle'>
		<span class='fa fa-wifi' style='font-size: 1rem; margin-top: 0.65rem;'></span>
	</button>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script src="main.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#toggle").click(function() {
				$("#visualizer").slideToggle();
				$("#comma-hot-10").slideToggle();
			});

		});
	</script>
	<script>
		$("#visualizer").slideToggle();
	</script>
	<script>
		function playSong(path) {
			var el = document.getElementById('audio');
			el.src = path;
			el.onload = function() {
				let wave = new CircularAudioWave(document
						.getElementById("chart-container"));
				wave.loadAudio(path);
			}
			console.log(el);
			el.play();

		}
	</script>
</body>
</html>
