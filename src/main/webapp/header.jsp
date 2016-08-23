<!-- <div class="container">  -->
<!-- Static navbar -->
<nav class="navbar navbar-default navbar-static-top">
	<!-- navbar-static-top -->
	<div class="container"> <!-- container-fluid -->		
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			
			<!-- <a class="navbar-brand" href="<c:url value="/"/>"><img style="max-height: 50px;" src="static/JVR_logo_big.png" alt="JVR logo" class="img-responsive"></a>  -->
			<!--navbar-brand-centered width: auto; max-height: 60px; center-block -->
			<a class="navbar-brand" href="<c:url value="/"/>">
				<img id="top-logo" src="<c:url value="/static/JVR_logo_medium.png"/>" alt="JVR logo" class="img-responsive">
			</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li id="header_li_index"><a href="<c:url value="/"/>">Büroo</a></li> <!-- li class="active" -->
				<li id="header_li_projects"><a href="<c:url value="/projects"/>">Projektid</a></li>
				<li id="header_li_people"><a href="<c:url value="/people"/>">Inimesed</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Keel<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Eesti</a></li>
						<li><a href="#">Inglise</a></li>
						<li><a href="#">Vene</a></li>
						<li role="separator" class="divider"></li>
						<li class="dropdown-header">Nav header</li>
						<li><a href="#">Separated link</a></li>
						<li><a href="#">One more separated link</a></li>
					</ul></li>
				<li id="header_li_contact"><a href="./contact">Kontakt</a></li>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
	<!--/.container-fluid -->
</nav>

<!-- </div> -->
<!-- /container -->