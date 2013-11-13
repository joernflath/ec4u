function GoogleMap() {

	this.initialize = function() {
		var map = showMap();
	}

	window.onload = function() {
		document
				.addEventListener(
						"deviceready",
						function() {
							if (navigator.geolocation) {
								navigator.geolocation.getCurrentPosition(
										success, error);
							} else {
								document.getElementById('content').innerHTML = "Geolokation ist nicht möglich";
							}
						}, false);
	}

	function success(position) {
		var showMap = function() {
			var mapOptions = {
				zoom : 4,
				center : new google.maps.LatLng(position.coords.latitude,
						position.coords.longitude),
				mapTypeId : google.maps.MapTypeId.ROADMAP
			}

			var map = new google.maps.Map(
					document.getElementById("map_canvas"), mapOptions);

			return map;
		}
	}

	function error(msg) {
		document.getElementById('content').innerHTML = "Fehler bei der Lokalisierung: <br/>"
				+ msg;
	}
}