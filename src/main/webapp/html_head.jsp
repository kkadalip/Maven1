<meta charset="UTF-8">

<meta name="Content-Security-Policy"
	content="
		default-src 'self';
	    script-src 'unsafe-inline' 'self' https://ajax.googleapis.com;
	    connect-src 'self';
	    font-src 'self';
	    img-src 'self' https://ajax.googleapis.com;
	    style-src 'self' https://ajax.googleapis.com;
	    media-src 'self';">
	    
<link rel="shortcut icon" href="static/icon.ico" />

<!-- https://developers.google.com/speed/libraries/#libraries -->
<!-- jQuery http://jquery.com/ -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQueryUI http://jqueryui.com/ -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<!-- angularJS -->
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.7/angular.min.js"></script>

<!-- Bootstrap http://getbootstrap.com/getting-started/#download -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Bootstrap: To ensure proper rendering and touch zooming -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootswatch slate http://bootswatch.com/slate/ -->
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/slate/bootstrap.min.css">

<!-- My CSS and JS -->

<link rel="stylesheet" type="text/css" href="<c:url value="/static/style.css"/>">
<script type="text/javascript" src="<c:url value="/static/default.js"/>"></script>
<!-- 
<link rel="stylesheet" type="text/css" href="static/style.css">
<script type="text/javascript" src="static/default.js"></script>
 -->
