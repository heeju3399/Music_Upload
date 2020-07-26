<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
////////////////
<script>

function init()
{
    window.navigator.geolocation.getCurrentPosition(current_position);
}
 
function current_position(position)
{
    var msg;
    msg = "Latitude: " + position.coords.latitude + ", " ;
    msg += "Longitude: " + position.coords.longitude;
    alert(msg);
}
window.addEventListener("load", init);
	
</script>
//////////////
</body>
</html>