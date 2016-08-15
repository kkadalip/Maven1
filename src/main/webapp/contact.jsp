<%@ include file="imports.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="html_head.jsp"%>
<title>JVR | Contact</title>

<style type="text/css">
</style>

<script type="text/javascript">
	$(document).ready(function() { //window.onload = function () { 
		$("#header_li_contact").addClass("active");
	});
</script>
</head>

<body>
	<%@ include file="header.jsp"%>
	<div class="container">
		<h2>Arhitektuuribüroo JVR OÜ</h2>
		<br>
		<p>
			<b>Aadress:</b> Paldiski mnt. 26A, 10149, Tallinn<br>
			<b>Tel:</b> +372 661 3753<br>
			<b>Fax:</b> +372 661 3754<br>
			<br>
			Arhitekt Velle Kadalipp:<br>
			<b>Mob:</b> 56 905 411<br>
			<b>E-mail:</b> velle@jvr.ee<br>
			<br>
			Arhitekt Kalle Vellevoog:<br>
			<b>Mob:</b> 50 675 86<br>
			<b>E-mail:</b> kalle@jvr.ee<br>
		</p>
		<!-- https://developers.google.com/maps/documentation/javascript/tutorials/adding-a-google-map -->
		<!-- https://developers.google.com/maps/documentation/javascript/infowindows -->
		<h3>Asukoht:</h3>
		<div id="map"
			style='height: 300px; width: auto; margin-bottom: 10px; color: black;'></div>

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

				var contentString = '<strong>Arhitektuuribüroo JVR OÜ';
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