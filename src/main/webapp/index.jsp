<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
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

<title>Maven1</title>

<link rel="shortcut icon" href="static/icon.ico" />

<!-- https://developers.google.com/speed/libraries/#libraries -->
<!-- jQuery http://jquery.com/ -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- jQueryUI http://jqueryui.com/ -->
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<!-- angularJS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.7/angular.min.js"></script>

<!-- Bootstrap http://getbootstrap.com/getting-started/#download -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<!-- Bootstrap: To ensure proper rendering and touch zooming -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootswatch slate http://bootswatch.com/slate/ -->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.6/slate/bootstrap.min.css">

<!-- My CSS and JS -->
<link rel="stylesheet" type="text/css" href="static/style.css">
<script type="text/javascript" src="static/default.js"></script>
</head>
<body data-ng-app="myApp1" data-ng-controller="myController1"
	data-ng-init="myCol=''" style="background-color: {{myCol">
	<!-- myCol = 'lightblue' -->

	<div class="container">
		<!-- Static navbar -->
		<nav class="navbar navbar-default">
			<!-- navbar-static-top -->
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<!-- <a class="navbar-brand" href="#">Java with maven</a> -->
					<div class="navbar-brand navbar-brand-centered">Brand</div>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="active"><a href="#">Home</a></li>
						<li><a href="#">About</a></li>
						<li><a href="#">Contact</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Dropdown <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li role="separator" class="divider"></li>
								<li class="dropdown-header">Nav header</li>
								<li><a href="#">Separated link</a></li>
								<li><a href="#">One more separated link</a></li>
							</ul></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li class="active"><a href="./">Default <span
								class="sr-only">(current)</span></a></li>
						<li><a href="../navbar-static-top/">Static top</a></li>
						<li><a href="../navbar-fixed-top/">Fixed top</a></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
			<!--/.container-fluid -->
		</nav>

	</div>
	<!-- /container -->

	<div class="container">

		<h2>Hello World!</h2>
		<div class="container-fluid">
			<div class="darkBackground col-md-12">
				<p>Some random text goes here.</p>
			</div>

			<div style="background-color: {{myCol"
				class="darkBackground col-md-12">

				<!-- data-ng-init="firstName='John'" -->
				<p>
					The name is <span data-ng-bind="firstName"></span>
				</p>

				<p>
					Name: <input type="text" data-ng-model="name">
				</p>
				<p data-ng-bind="name"></p>

				<p>
					Name: <input type="text" data-ng-model="name2">
				</p>
				<p>{{name2}}</p>
				<!-- {{ expression }} same as ng-bind="expression" -->
				<p>My first expression: {{ 5 + 5 }}</p>

				<!-- module defineerib angulari rakendust, controller kontrollib -->
				<!-- model kuhu paneb -->

				<br> First Name: <input type="text" data-ng-model="firstName"><br>
				Last Name: <input type="text" data-ng-model="lastName"><br>
				<br> Full Name: {{firstName + " " + lastName}} <br> <br>
				<div data-ng-init="person={firstName:'John',lastName:'Doe'}">
					<p>The first name is {{ person.firstName }}</p>
					<!-- can use ng-bind="person.lastName" in span tags instead of {{ }} -->
					<p>The last name is {{ person.lastName }}</p>
				</div>

				<br> Change background color: <input
					style="background-color: {{myCol" data-ng-model="myCol"
					value="{{myCol}}"> <br> <br> <input type="number"
					data-ng-model="add1" value="{{add1}}"> <br> <input
					type="number" data-ng-model="add2" value="{{add2}}"> <br>
				Tehe: {{add1}} + {{add2}} = {{add1 + add2}}
				<!-- if text then use --  -->

				<script>
					var app = angular.module("myApp1", []);
					app.controller("myController1", function($scope) {
						$scope.firstName = "Karl";
						$scope.lastName = "Kadalipp";

						$scope.add1 = 10;
						$scope.add2 = 7;
					});

					var app2 = angular.module("myAppp2", []);
				</script>

				<br> Arrays: <br>
				<div data-ng-init="points=[1,15,19,2,40]">
					<p>The third result is {{ points[2] }}</p>
					<!-- can also use ng-bind="" in span tags -->
				</div>
			</div>
		</div>

	</div>
	<!-- /container -->
</body>
</html>
