<%@ include file="imports.jsp"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="html_head.jsp"%>
<title>JVR | Home</title>

<script type="text/javascript">
	$(document).ready(function() { //window.onload = function () { 
		$("#header_li_index").addClass("active");
	});
</script>
</head>

<body>
	<div class="header-and-main-wrapper">
		<%@ include file="header.jsp"%>

		<div class="container">
			<div class="darkBackground col-md-12">
				<p>
					<b>Arhitektuuribüroo JVR OÜ</b> asutasid 1990. aastal Ilmar Jalas,
					Enn Rajasaar ja Kalle Vellevoog. 1998 aastal liitus bürooga Velle
					Kadalipp.<br> <br> Täna on büroo osanikeks ja
					vastutavateks arhitektideks: <br> <a
						href="http://www.jvr.ee/et/byroo/vastutavad_arhitekti/velle_kadalipp_cv/">Velle
						Kadalipp</a> (Tallinna Kunstiakadeemia 1986) Volitatud arhitekt VII<br>
					<a
						href="http://www.jvr.ee/et/byroo/vastutavad_arhitekti/kalle_vellevoog_cv/">Kalle
						Vellevoog</a> (Tallinna Kunstiakadeemia 1986) Volitatud
					arhitekt-ekspert VIII <br> <br> Büroos töötavad:<br>
					sisekujundaja Sirje Kadalipp (Tallinna Kunstiakadeemia 1989)<br>
					insener-arhitekt Andrus Andrejev (Tallinna Tehnikaülikool 1996)<br>
					ehitusarhitekt Martin Prommik (Tallinna Tehnikakõrgkool 2004)<br>
					ehitusarhitekt Lidia Zarudnaya (Eesti Kunstiakadeemia Magistrantuur
					Linnamaastike erialal, Peterburi riiklik arhitektuuri ja ehituse
					ülikool 2008).
				</p>
			</div>
		</div>
		<!-- /container -->
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>
