<%@ include file="imports.jsp"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="html_head.jsp"%>
<title>JVR | Home</title>
</head>

<body data-ng-app="myApp1" data-ng-controller="myController1"
	data-ng-init="myCol=''" style="background-color: {{myCol">
	<!-- myCol = 'lightblue' -->
	<div class="header-and-main-wrapper">
		<%@ include file="header.jsp"%>

		<div class="container">
		
			<div class="container-fluid">
				<div class="darkBackground col-md-12">
					<p>
						<strong>Arhitektuurib�roo JVR O�</strong> asutasid 1990. aastal
						Ilmar Jalas, Enn <br> Rajasaar ja Kalle Vellevoog. 1998
						aastal liitus b�rooga Velle Kadalipp. <br> T�na on b�roo
						osanikeks ja vastutavateks arhitektideks <br> <br> <a
							href="http://www.jvr.ee/et/byroo/vastutavad_arhitekti/velle_kadalipp_cv/">Velle
							Kadalipp</a> (Tallinna Kunstiakadeemia 1986) Volitatud arhitekt VII<br>
						<a
							href="http://www.jvr.ee/et/byroo/vastutavad_arhitekti/kalle_vellevoog_cv/">Kalle
							Vellevoog</a> (Tallinna Kunstiakadeemia 1986) Volitatud
						arhitekt-ekspert VIII <br> <br> B�roos t��tavad
						sisekujundaja Sirje Kadalipp (Tallinna Kunstiakadeemia 1989),
						insener-arhitekt Andrus Andrejev (Tallinna Tehnika�likool 1996) ja
						ehitusarhitektid Martin Prommik (Tallinna Tehnikak�rgkool 2004) ja
						Lidia Zarudnaya (Eesti Kunstiakadeemia Magistrantuur Linnamaastike
						erialal, Peterburi riiklik arhitektuuri ja ehituse �likool 2008).
					</p>
				</div>
			</div>
			
		</div>
		<!-- /container -->
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>
