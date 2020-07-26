
<%@page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Document</title>
</head>
<style>
  * {
    margin: 0px;
    padding: 0px;
  }
  html,body{
  	width:100%;
  	height:100%;
  }
  body {
    background-color: black;
    overflow:hidden;
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
<body style="text-align: center;">
  <div id="chart-container" style="width: 500px; height: 500px; margin: auto;"></div>
  <canvas id="canvas" width="800" height="350" style="position: relative; top: -250px;"></canvas>
  <br />
  <br />
  <audio controls="controls" id="audio" style="position: relative; width: 250px; top: -250px;" volume=0>
    <source src="./mp3/test.mp3" type="audio/mp3" />
  </audio>

  <script src="dist/circular-audio-wave.min.js"></script>
  <script>
    let wave = new CircularAudioWave(
      document.getElementById("chart-container")
    );
    wave.loadAudio("./mp3/test.mp3");
  </script>
  <script src="main.js"></script>
</body>
</html>