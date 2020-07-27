<%@page import="youtube.rank.kor.crawler.DateUtil"%>
<%@page import="org.jsoup.helper.DataUtil"%>
<%@page import="bean.TopBean"%>
<%@page import="java.util.Vector"%>
<%@page import="mgr.TopMgr"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
String sid = (String) session.getAttribute("idKey");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../main/assets/css/main.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap"
	rel="stylesheet">

<style>
* {
	margin: 0px;
	padding: 0px;
}

html, body {
	width: 100%;
	height: 100%;
}

body {
	position: relative;
	font-family: Nanum Myeongjo;
	/*transform: scale(0.8);*/
	font-size: 0.8rem;
	background-color: black;
	position: relative;
	font-family: Nanum Myeongjo;
}
</style>
<style>
#controller {
	width: 100%;
	height: 10%;
	clear: both;
}
</style>
<style>
/* Chrome, Safari */
::-webkit-scrollbar {
	width: 1rem;
	height: 1rem;
	color: white;
}

::-webkit-scrollbar-track-piece {
	background-color: rgba(0, 0, 0, 0.5);
	opacity: 0.5;
}

::-webkit-scrollbar-thumb:vertical {
	background-color: #dc3545;
	height: 12px;
	opacity: 0.5;
}

#player {
	float: right;
	width: 48vw;
	height: 80vh;
	border: 0;
}
</style>
<script>
	var playList = [];
	function goYoutube(vID) {
		window.open("https://music.youtube.com/watch?v=" + vID);
	}
</script>
<style>
.r180 {
	transform: rotate(180deg);
}

html, body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}

#youtube-top-15 {
	float: left;
	color: white;
	width: 50%;
	height: 80vh;
}

#youtube-top-15-table {
	background-color: black;
}

#youtube-top-15 .youtube-top-15-content {
	overflow-y: scroll;
	margin-top: 15%;
	height: 75%;
}

.chart-blank {
	background-color: rgba(255, 255, 255, 1);
	height: 15vh;
}

#header {
	background-color: #dc3545;
	color: white;
	width: 100%;
	height: 10%;
}

#copyright {
	background-color: black;
	color: white;
}

button {
	font-size: 0.8rem;
	background-color: #dc3545;
}

}
table, tr, td {
	collapse: border-collapse;
}

th {
	border: 0px solid black;
}

#header {
	background-color: #dc3545;
	color: white;
}

#current-song-info {
	text-align: center;
	background-color: rgba(0, 0, 0, 0);
	color: white;
	opacity: 0.5;
}
</style>
<script>
	var currentSong = null;
	var prevSong = null;
	var currentIndex = -1;
</script>
</head>
<body>
	<!-- Header -->
	<header id="header">
		<div class="inner">
			<a id='logo' href="../main/main.jsp" class="logo"
				style='color: white;'> C O M M A </a>
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

	<div id="current-song-info">선택된 음악이 없습니다.</div>

	<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>
	<div id='youtube-top-15'>
		<div class='youtube-top-15-content'>
			<%
					TopMgr mgr = new TopMgr();

					Vector<TopBean> vector = mgr.getTopBean();
				%>
			<table id='youtube-top-15-table' class="chart">
				<%
						for (int i = 0; i < vector.size() && i < 15; i++) {

						TopBean bean = vector.get(i);
						out.println("<script>");
						out.println("playList.push({\"title\":'" + bean.getTitle().replace("'", " ") + "',\"entry\":'" + bean.getEntry()
						+ "'})");
						out.println("</script>");
					%>
				<tr>
					<td class="ranking"><%=i + 1%></td>
					<td id="td-<%=bean.getEntry()%>">
						<div id='<%=bean.getEntry()%>'>
							<%=bean.getTitle()%>
						</div>
					</td>
					<td style='text-align: right;'>

						<button value="<%=bean.getEntry()%>"
							onclick="goYoutube(this.value)">
							<span class="fa fa-play-circle"></span>
						</button>
						<button value="<%=bean.getEntry()%>"
							onclick="playSong(this.value)">
							<span class='fa fa-play'></span>
						</button>
					</td>
				</tr>
				<%
						//System.out.println(bean.getTitle());
					}
					%>
			</table>
		</div>
	</div>

	<iframe id="player" src="" allow="autoplay" allowfullscreen></iframe>
	<div id="controller">
		<!-- <button class='controls' onclick="prev()">
			<span class='fa fa-backward'></span>
		</button>
		<button class='controls' onclick="play()">
			<span class='fa fa-play'></span>
		</button>
		<button class='controls' onclick="next()">
			<span class='fa fa-forward'></span> -->
		<!-- </button> -->
		<button onclick='randomSong()'><span class='fa fa-random'></span></button>
	</div>
	<div id="copyright" class="copyright"
		style='text-align: center; clear: both;' onclick="toggle()">
		<!-- 		<div id='guide-bottom'>
			Copyright 메뉴바를 클릭하면 다시 위로 이동합니다
		</div> -->
		&copy;Comma Lab
	</div>
	<script type="text/javascript">
		function addSong(entry) {
			/* var data = {
					command : 'addSong',
					entry : entry
				};
			if (player == null){
				player = window.open('../player/Player.jsp', player,'width=1200px,height=800px');
				player.onload = function(){
					player.postMessage(data, '*');
					player.focus();
				}	
			}else{
				player.postMessage(data, '*');
				player.focus();
			} */

		}
		function playSong(entry) {
			if (currentSong == null) {

				currentSong = playList[0].entry;
				currentIndex = 0;
				console.log(currentSong);
			}

			for (var i = 0; i < playList.length; i++) {
				if (playList[i].entry == entry) {
					currentSong = entry;
					currentIndex = i;
				}
			}

			var currentSongEl = document.getElementById(currentSong);
			var currentSongElement = document
					.getElementById('current-song-info');
			currentSongElement.innerHTML = playList[currentIndex].title;

			var player = document.getElementById('player');
			player.src = "https://www.youtube.com/embed/" + currentSong+ "?autoplay=1&origin=http://localhost:8080/";

		}
	</script>
	<script>
		function prev() {
			try{
			currentSong = playList[currentIndex];
			playSong(currentSong);
			console.log(currentSong);
			}catch(e){
				currentIndex = playList.length-1;
			}
			currentIndex--;
		}
		function next() {
			currentSong = playList[currentIndex];
			playSong(currentSong);
			console.log(currentSong);
			currentIndex = currentIndex%playList.length;			
			currentIndex++;
		}
		function play() {
			playSong(currentSong);
		}
	</script>
	<script>
		function getData() {
			var textFile = document.getElementById('entry').contentDocument;
			var textObject = textFile.getElementsByTagName('pre')[0];
			var text = textObject.innerHTML;
		}
		function getRandom(min, max) {
			  return Math.random() * (max - min) + min;
			}
		function randomSong() {
			currentIndex = parseInt(getRandom(0, playList.length));
			console.log(currentIndex);
			currentSong = playList[currentIndex].entry;
			console.log(currentSong);
			playSong(currentSong);
		}
	</script>
	<script>
		play();
	</script>
	<script src="../main/assets/js/jquery.min.js"></script>
	<script src="../main/assets/js/skel.min.js"></script>
	<script src="../main/assets/js/util.js"></script>
	<script src="../main/assets/js/main.js"></script>
</body>
</html>
