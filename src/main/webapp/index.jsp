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
						value="{{myCol}}"> <br> <br> <input
						type="number" data-ng-model="add1" value="{{add1}}"> <br>
					<input type="number" data-ng-model="add2" value="{{add2}}">
					<br> Tehe: {{add1}} + {{add2}} = {{add1 + add2}}
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
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>
