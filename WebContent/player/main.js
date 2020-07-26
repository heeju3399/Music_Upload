window.AudioContext =
  window.AudioContext || window.webkitAudioContext || window.mozAudioContext;

var start = function () {
  var play = document.getElementById("play");
  var ctx = new AudioContext();
  var analyser = ctx.createAnalyser();
  var audioSrc = ctx.createMediaElementSource(Audio);

  // we have to connect the MediaElementSource with the analyser
  audioSrc.connect(analyser);
  analyser.connect(ctx.destination);
  // we could configure the analyser: e.g. analyser.fftSize (for further infos read the spec)
  // analyser.fftSize = 64;
  // frequencyBinCount tells you how many values you'll receive from the analyser
  var frequencyData = new Uint8Array(analyser.frequencyBinCount);

  // we're ready to receive some data!
  var canvas = document.getElementById("canvas");
  canvas.style.width = "64px";
  canvas.style.height = "32px";
  (cwidth = canvas.width),
    //시작 막대기 높이
    (cheight = canvas.height - 1),
    //막대기 너비조정
    (meterWidth = 11), //width of the meters in the spectrum
    (meterHeight = 0),
    (gap = 2), //gap between meters
    //막대기 시작 라인 , 캡
    (capHeight = 1),
    (capStyle = "purple"),
    //막대기 개수 ?... 출력되는거 변경하게됨
    (meterNum = 320 / (10 + 2)), //count of the meters
    //수직위치를 저장
    (capYPositionArray = []); ////store the vertical position of hte caps for the preivous frame
  (ctx = canvas.getContext("2d")),
    // 색상 설정.
    (gradient = ctx.createLinearGradient(0, 0, 100, 100));
  gradient.addColorStop(0.5, "#000000");
  gradient.addColorStop(0.6, "#111111");
  gradient.addColorStop(0.7, "#222222");
  gradient.addColorStop(0.8, "#333333");
  gradient.addColorStop(0.9, "#444444");
  gradient.addColorStop(0.5, "#555555");
  gradient.addColorStop(0.6, "#666666");
  gradient.addColorStop(0.7, "#777777");
  gradient.addColorStop(0.8, "#888888");
  gradient.addColorStop(0.9, "#999999");
  gradient.addColorStop(1, "#AAAAAA");
  ////////

  ////////
  // loop
  function renderFrame() {
    var array = new Uint8Array(analyser.frequencyBinCount);
    analyser.getByteFrequencyData(array);
    var step = Math.round(array.length / meterNum); //sample limited data from the total array 전체 배열에서 제한된 데이터 샘플
    ctx.clearRect(0, 0, cwidth, cheight);

    //MeterNum은 width 작대기 갯수
    for (var i = 0; i < meterNum; i++) {
      var value = array[i * step];
      if (capYPositionArray.length < Math.round(meterNum)) {
        capYPositionArray.push(value);
      }
      ctx.fillStyle = capStyle;
      //draw the cap, with transition effect 전환 효과와 함께 캡을 그립니다.
      if (value < capYPositionArray[i]) {
        ctx.fillRect(
          i * 12,
          cheight - --capYPositionArray[i],
          meterWidth,
          capHeight
        );
      } else {
        ctx.fillRect(i * 12, cheight - value, meterWidth, capHeight);
        capYPositionArray[i] = value;
      }
      ctx.fillStyle = gradient; //set the filllStyle to gradient for a better look 더 나은 모양을 위해 filllStyle을 그라디언트로 설정
      ctx.fillRect(
        i * 12 /*meterWidth+gap*/,
        cheight - value + capHeight,
        meterWidth,
        cheight
      ); //the meter
    }
    requestAnimationFrame(renderFrame);
  }
  renderFrame();
  // play.play();
};

play.onplay = function () {
  start();
};
