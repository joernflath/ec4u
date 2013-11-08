window.onload = function (){
	document.addEventListener("deviceready", function(){
		if (navigator.geolocation){
			navigator.geolocation.getCurrentPosition(success, error);
		}
		else {
			document.getElementById('content').innerHTML = "Geolokation ist nicht m�glich";
		}
	}, false);
}


function success(position){
	document.getElementById('content').innerHTML = 
		"Breitengrad: " + position.coords.latitude +
		"<br/>L�ngengrad: " + position.coords.longitude + 
		"<br/>Zeitstempel: " + position.timestamp;
}

function error(msg){
	document.getElementById('content').innerHTML =
		"Fehler bei der Lokalisierung: <br/>" + msg;
}