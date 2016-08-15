<%@ include file="imports.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="html_head.jsp"%>
<title>JVR | Contact</title>

<style type="text/css">
<!--
@import url("${base}/static/style.css");
-->
</style>
</head>

<body>
	<%@ include file="header.jsp"%>
	<div class="container">
		<ul>
			<li>Arhitektuuribüroo JVR OÜ Paldiski mnt. 26 A 10149 Tallinn</li>
			<li>Üldtelefon: +372 661 3753 Fax: +372 661 3754</li>
			<li>E-mail:</li>
			<li>jvr@jvr.ee Velle Kadalipp 56 905 411 velle@jvr.ee</li>
			<li>Kalle Vellevoog 50 675 86 kalle@jvr.ee</li>
		</ul>
		<!-- https://developers.google.com/maps/documentation/javascript/tutorials/adding-a-google-map -->
		<!-- https://developers.google.com/maps/documentation/javascript/infowindows -->
		<h3>Asukoht:</h3>
		<div id="map" style='height: 400px; width: auto; margin-left: 20px; margin-right: 20px; color: black;'></div>
		<script>
			function initMap() {
				var myLatLng = {
					lat : 59.4346537,
					lng : 24.7250257
				};
				var mapDiv = document.getElementById('map');
				var map = new google.maps.Map(mapDiv, {
					zoom : 14,
					center : myLatLng
				});

				var contentString = '<strong>Arhitektuuribüroo JVR</strong><br>Paldiski mnt 26a<br>10149 Tallinn<br>';
				var infowindow = new google.maps.InfoWindow({
					content : contentString
				});

				var marker = new google.maps.Marker({
					position : myLatLng,
					map : map,
					title : 'Arhitektuuribüroo JVR'
				});
				marker.addListener('click', function() {
					infowindow.open(map, marker);
				});
				infowindow.open(map, marker);
							
				google.maps.event.addDomListener(window, "resize", function() {
				    var center = map.getCenter();
				    google.maps.event.trigger(map, "resize");
				    map.setCenter(center); 
				});
			}
		</script>
		<!-- 
	    <script async defer
        	src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap">
    	</script>
    	-->
    	<%@ include file="contact_google_maps_api_key.jsp"%>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>