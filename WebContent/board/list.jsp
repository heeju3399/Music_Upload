<!-- list.jsp -->
<%@page import="board.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="board.UtilMgr"%>
<%@page contentType="text/html;charset=UTF-8"%>
<jsp:useBean id="mgr" class="board.BoardMgr" />
<%
	request.setCharacterEncoding("UTF-8");
int totalRecord = 0;//총게시물수
int numPerPage = 10;//페이지당 레코드 개수(5,10,15,30)
int pagePerBlock = 10;//블럭당 페이지 개수
int totalPage = 0;//총 페이지 개수
int totalBlock = 0;//총 블럭 개수
int nowPage = 1;//현재 페이지
int nowBlock = 1;//현재 블럭
String sid = (String) session.getAttribute("idKey");

//요청된 numPerPage 처리
//요청이 있으면 처리가 되지만 그렇지 않으면 기본 10개 세팅이 된다.
if (request.getParameter("numPerPage") != null) {
	numPerPage = UtilMgr.parseInt(request, "numPerPage");
}

//검색에 필요한 변수
String keyField = "", keyWord = "";
//검색일때
if (request.getParameter("keyWord") != null) {
	keyField = request.getParameter("keyField");
	keyWord = request.getParameter("keyWord");
}

//검색 후에 다시 처음화면 요청
if (request.getParameter("reload") != null && request.getParameter("reload").equals("true")) {
	keyField = "";
	keyWord = "";
}

totalRecord = mgr.getTotalCount(keyField, keyWord);
//out.print("totalRecord : " + totalRecord);

//nowPage 요청 처리
if (request.getParameter("nowPage") != null) {
	nowPage = UtilMgr.parseInt(request, "nowPage");
}

//sql문에 들어가는 start, cnt 선언
int start = (nowPage * numPerPage) - numPerPage;
int cnt = numPerPage;

//전체페이지 개수
totalPage = (int) Math.ceil((double) totalRecord / numPerPage);
//전체블럭 개수
totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
//현재블럭
nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);
%>
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
button{
	background-color:black;
	margin-left:1px;
	font-size:0.5rem;
	width:20%;
	margin-right:1px;
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
	overflow-y:hidden;
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
	margin-top:-4rem;
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
#copyright{
	margin-top:-4rem;
	transform:scale(0.8);
}
</style>
<script>
	var playList = [];
	var currentSong = null;
	var sw = false;
</script>
<script type="text/javascript">
	function check() {
		if (document.searchFrm.keyWord.value == "") {
			alert("검색어를 입력하세요.");
			document.searchFrm.keyWord.focus();
			return;
		}
		document.searchFrm.submit();
	}
	function pageing(page) {
		document.listFrm.nowPage.value = page;
		document.listFrm.submit();
	}
	function block(block) {
		document.readFrm.nowPage.value =<%=pagePerBlock%>	* (block - 1) + 1;
		document.readFrm.submit();
	}
	function list() {
		document.listFrm.action = "list.jsp";
		document.listFrm.submit();
	}
	function numPerFn(numPerPage) {
		document.readFrm.numPerPage.value = numPerPage;
		document.readFrm.submit();
	}
	//list.jsp에서 read.jsp로 요청이 될때 기존에 조건 같이 넘어감.
	//기존 조건 : keyField,keyWord,nowPage,numPerPage
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
	box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);;
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

#playList{
	width:24%;
	height:100px;
	display:inline-block;
	font-size:1rem;
	padding-left:1rem;
	margin-top:-1rem;
	/* background-color:black; */
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
		<div id="playList">
		</div>
		<audio src="" id="audio"></audio>
	</div>
	<br>
	<div id="comma">
		<div id="columns">
			<%
				Vector<BoardBean> vlist = mgr.getBoardList(keyField, keyWord, start, cnt);
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
					<span class="hoho" style="display='inline-block';float:left;font-size:0.8rem;overflow:hidden;">
						&lt;<%=vlist.get(i).getSubject()%>&gt;
					</span>
					<span style="float:right;">
						<%=regok%>
					</span>
					<div style='font-weight:900;width:100%;clear:both;'>
						<%=vlist.get(i).getName()%>
					</div>
					<div>
						<%-- <button
							onclick="playSong(
							<%=vlist.get(i).getBad()%>,
							'<%=vlist.get(i).getContent()%>',
							<%=vlist.get(i).getCount()%>,
							'<%=vlist.get(i).getFilename()%>',
							'<%=vlist.get(i).getId()%>',
							'<%=vlist.get(i).getIp()%>',
							<%=vlist.get(i).getLike()%>,
							'<%=vlist.get(i).getMyimgname()%>',
							'<%=vlist.get(i).getName()%>',
							<%=vlist.get(i).getNum()%>,
							'<%=vlist.get(i).getRegdate()%>',
							'<%=vlist.get(i).getSubject()%>'
						)">
							<span class='fa fa-play'></span>
						</button> --%>
						<button
							onclick="addSong(
							<%=vlist.get(i).getBad()%>,
							'<%=vlist.get(i).getContent()%>',
							<%=vlist.get(i).getCount()%>,
							'<%=vlist.get(i).getFilename()%>',
							'<%=vlist.get(i).getId()%>',
							'<%=vlist.get(i).getIp()%>',
							<%=vlist.get(i).getLike()%>,
							'<%=vlist.get(i).getMyimgname()%>',
							'<%=vlist.get(i).getName()%>',
							<%=vlist.get(i).getNum()%>,
							'<%=vlist.get(i).getRegdate()%>',
							'<%=vlist.get(i).getSubject()%>'
							)">
							<span class="fa fa-plus">
							</span>
						</button>
						<button onclick="location.href='artist.jsp?name=<%=name%>&num=<%=num%>'">
							<span class='fa fa-user'></span>
						</button>
						
						<button onclick="like(<%=num%>)">
							<span class='fa fa-thumbs-up'> <%=vlist.get(i).getLike() %></span>
						</button>
						
						<button onclick="bad(<%=num%>)">
							<span class='fa fa-thumbs-down'> <%=vlist.get(i).getBad() %></span>
						</button>
					</div>
				</figcaption>
			</figure>

			<%
				}
			%>
		</div>
		<div id="play-audio-info"></div>
	</div>



	<!-- ////////////////////////////////////// -->
	<form name="listFrm" method="post">
		<input type="hidden" name="reload" value="true"> <input
			type="hidden" name="nowPage" value="1">
	</form>

	<form name="readFrm">
		<input type="hidden" name="nowPage" value="<%=nowPage%>"> <input
			type="hidden" name="numPerPage" value="<%=numPerPage%>"> <input
			type="hidden" name="keyField" value="<%=keyField%>"> <input
			type="hidden" name="keyWord" value="<%=keyWord%>"> <input
			type="hidden" name="num">
	</form>
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

	<script src="../main/assets/js/jquery.min.js"></script>
	<script src="../main/assets/js/skel.min.js"></script>
	<script src="../main/assets/js/util.js"></script>
	<script src="../main/assets/js/main.js"></script>
	<script>
	function renderPlaylistHTML(){
		var html ="";
		var el = document.getElementById('playList');
		for (var i=0; i<playList.length;i++){
			html += "<button value='"+playList[i].filename+"'><span class='fa fa-play'>"+playList[i].subject+"</span></button>";
		//	html += "<td>" +playList[i].bad+"</td>";
		//	html += "<td>" +playList[i].content+"</td>";
		//	html += "<td>" +playList[i].count+"</td>";
		//	html += "<td>" +playList[i].id+"</td>";
		//	html += "<td>" +playList[i].ip+"</td>";
		//	html += "<td>" +playList[i].	+"</td>";
		//	html += "<td>" +playList[i].img+"</td>";
		//html += "<td>" +playList[i].num+"</td>";
		}
		console.log(html);
		if (playList.length <=0){
			html = "<p class='center' style='color:black;'>음악을 재생하거나 추가해주세요.</p>";
			
		}
		var comma = document.getElementById('comma');
		var t = document.getElementById('toggleBtn');
		//var playToggleEl = document.getElementBYId('playToggle');
		//t.className = 'fa fa-arrow-list';
		el.value = 'false';
		comma.style.display = 'block';
		el.innerHTML = html;
		
	}
	function addSong(bad,content,count,filename,id,ip,like,img,name,num,date,subject){
		if (max == playList.length){
			alert('목록 5개가 가득 찾습니다.');
			return;
		} 
		var song = {
				"bad" : bad,
				"content" : content,
				"count" : count,
				"filename" : filename,
				"id" : id,
				"ip" : ip,
				"like" : like,
				"img" : img,
				"name" : name,
				"num" : num,
				"date" : date,
				"subject":subject
		};
		playList.push(song);
		renderPlaylistHTML();
	}
	function playSong(bad,content,count,filename,id,ip,like,img,name,num,date,subject){
		
		sw = true;
		var song = {
				"bad" : bad,
				"content" : content,
				"count" : count,
				"filename" : filename,
				"id" : id,
				"ip" : ip,
				"like" : like,
				"img" : img,
				"name" : name,
				"num" : num,
				"date" : date,
				"subject":subject
		};
		
		var audio = document.getElementById('audio');
		var path = 'fileupload/'+filename;
		var togglePlayIcon = document.getElementById('toggle-play-icon');
		togglePlayIcon.className = 'fa fa-pause';
		audio.src=path;
		currentSong = song;
		playList.push(song);
		audio.play();
		renderPlaylistHTML();
	}
	function stopPause(){
		sw = false;
		var audio = document.getElementById('audio');
		var togglePlayIcon = document.getElementById('toggle-play-icon');
		togglePlayIcon.className = 'fa fa-play';
		audio.pause();	
		renderPlaylistHTML();
	}
	function next(){
		renderPlaylistHTML();
	}
	function prev(){

		renderPlaylistHTML();
	}
	function playToggle() {
		var audio = document.getElementById('audio');
		if (currentSong != null){
			if (sw == false){
				console.log(currentSong);
				playSong(currentSong.bad,currentSong.content,currentSong.count,
						currentSong.filename,currentSong.id,currentSong.ip,
						currentSong.like,currentSong.img,currentSong.name,
						currentSong.num,currentSong.date,currentSong.subject)
				sw = true;
			}else{
				stopPause();
				sw = false;
			}
		}else{
			if (playList.length <=0 ){
				alert('플레이 리스트가 비었습니다.');
			}else if (currentSong == null){
				alert('선택된 음악이 없습니다.');
			}
		}
		renderPlaylistHTML();
	}
	function toggle() {
		var el = document.getElementById('playToggle');
		var comma = document.getElementById('comma');
		console.log(comma);
		console.log(el.value);
		var t = document.getElementById('toggleBtn');
		var playListElement = document.getElementById('playList');
		if (el.value == 'false') {
			comma.style.display = 'none';
			//t.className = 'fa fa-arrow-down';
			comma.style.display = 'none';
			playListElement.style.display='block';
			el.value = 'true';
			
		} else {
			//t.className = 'fa fa-arrow-up';
			el.value = 'false';
			comma.style.display = 'block';
			playListElement.style.display='none';
		}
		renderPlaylistHTML();
	}
	function goPage(page){
		location.href=page;
	}
	</script>

</body>
</html>