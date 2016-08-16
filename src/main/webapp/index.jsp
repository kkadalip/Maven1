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
					<b>Arhitektuurib�roo JVR O�</b> asutasid 1990. aastal Ilmar Jalas,
					Enn Rajasaar ja Kalle Vellevoog. 1998 aastal liitus b�rooga Velle
					Kadalipp.<br> <br> T�na on b�roo osanikeks ja
					vastutavateks arhitektideks: <br> <a
						href="http://www.jvr.ee/et/byroo/vastutavad_arhitekti/velle_kadalipp_cv/">Velle
						Kadalipp</a> (Tallinna Kunstiakadeemia 1986) Volitatud arhitekt VII<br>
					<a
						href="http://www.jvr.ee/et/byroo/vastutavad_arhitekti/kalle_vellevoog_cv/">Kalle
						Vellevoog</a> (Tallinna Kunstiakadeemia 1986) Volitatud
					arhitekt-ekspert VIII <br> <br> B�roos t��tavad:<br>
					sisekujundaja Sirje Kadalipp (Tallinna Kunstiakadeemia 1989)<br>
					insener-arhitekt Andrus Andrejev (Tallinna Tehnika�likool 1996)<br>
					ehitusarhitekt Martin Prommik (Tallinna Tehnikak�rgkool 2004)<br>
					ehitusarhitekt Lidia Zarudnaya (Eesti Kunstiakadeemia Magistrantuur
					Linnamaastike erialal, Peterburi riiklik arhitektuuri ja ehituse
					�likool 2008).
				</p>
			</div>
		</div>
		<!-- /container -->
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>
