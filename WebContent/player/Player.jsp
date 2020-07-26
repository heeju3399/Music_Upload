<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link href="player.css" rel="stylesheet" />
<script src="jquery-1.10.2.min.js"></script>
<style>
#test {
	color: white;
}
</style>
<script>
	    window.addEventListener("message",function(event){
	    	var command = event.data.command;
	    	var entry = event.data.entry;
	    	$.getJSON('../top100/entries/'+event.data.entry+'.info.json',function(result){
		    	var el = document.getElementById("test");
	    		var title = result.title;
	    		var id = result.id;
	    		var mp3 = result.id+'.mp3';
	    		songs.unshift(mp3);
	    		if (command == 'playSong'){
	    			currentSong=0;
		    		el.innerHTML = "<option value='"+id+"' onclick='playSong()'>"+title+"</option>"+el.innerHTML;
		    		 playSong();
		    	}else if (command == 'addSong'){
	    			el.innerHTML = el.innerHTML+"<option value='"+id+"' onclick='playSong()'>"+title+"</option>"; 
		    		currentSong = songs.length-1;
		    	}
	    	});
	    	
	    	
	    });
    </script>
</head>

<body>
	<div id="page" role="main">
		<div id="bg">
			<div id="blackLayer"></div>
			<img src="Poster1.jpg" />
		</div>

		<div id="main">
			<div id="image">
				<img src="Poster1.jpg" />
			</div>
			<div id="player">
				<div id="songTitle">Demo</div>
				<div id="buttons">
					<button id="pre" onclick="pre()">
						<img src="img/Pre.png" height="90%" width="90%" />
					</button>
					<button id="play" onclick="playOrPauseSong()">
						<img src="img/Pause.png" />
					</button>
					<button id="next" onclick="next()">
						<img src="img/Next.png" height="90%" width="90%" />
					</button>
				</div>

				<div id="seek-bar">
					<div id="fill"></div>
					<div id="handle"></div>
				</div>
			</div>
		</div>
	</div>
	<div id="play-bar"></div>
	<div id="button-bar">

		<div id="buttons">
			<button id="pre" onclick="pre()">
				<img src="img/Pre.png" height="90%" width="90%" />
			</button>
			<button id="play" onclick="playOrPauseSong()">
				<img src="img/Pause.png" />
			</button>
			<button id="next" onclick="next()">
				<img src="img/Next.png" height="90%" width="90%" />
			</button>
		</div>

	</div>
	<div id="list">
		<select id="test" size=10>

		</select>
	</div>
</body>
<script src="main.js" charset="UTF-8"></script>
<script type="text/javascript">
    var songs = [];
    var poster = [];

    var songTitle = document.getElementById("songTitle");
    var fillBar = document.getElementById("fill");

    var song = new Audio();
    var currentSong = 0; 

    window.onload = playSong; 

    function playSong() {
        play.onplay = function(){

        }
        song.src = '../top100/entries/'+songs[currentSong];

        songTitle.textContent = songs[currentSong];

        song.play();
    }

    function playOrPauseSong() {

        if (song.paused) {
            song.play();
            $("#play img").attr("src", "img/Pause.png");
        } else {
            song.pause();
            $("#play img").attr("src", "img/Play.png");
        }
    }

    song.addEventListener('timeupdate', function () {

        var position = song.currentTime / song.duration;

        fillBar.style.width = position * 100 + '%';
    });


    function next() {

        currentSong++;
        if (currentSong > 2) {
            currentSong = 0;
        }
        playSong();
        $("#play img").attr("src", "img/Pause.png");
        $("#image img").attr("src", poster[currentSong]);
        $("#bg img").attr("src", poster[currentSong]);
    }

    function pre() {

        currentSong--;
        if (currentSong < 0) {
            currentSong = 2;
        }
        playSong();
        $("#play img").attr("src", "img/Pause.png");
        $("#image img").attr("src", poster[currentSong]);
        $("#bg img").attr("src", poster[currentSong]); 
    }
</script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#play-bar").click(function()  {
            $("#page").slideToggle();
		});

	});
	$("#page").slideToggle();
</script>
<script>

</script>
</html>