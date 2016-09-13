<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
				<li id="header_li_index"><a href="<c:url value="/"/>"><fmt:message key="header.button.index" /></a></li> <!-- li class="active" -->
				<li id="header_li_projects"><a href="<c:url value="/projects"/>"><fmt:message key="header.button.projects" /></a></li>
				<li id="header_li_people"><a href="<c:url value="/people"/>"><fmt:message key="header.button.people" /></a></li>
			</ul>
			<form>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"><i class="fa fa-globe fa-lg" aria-hidden="true"></i><span class="caret"></span></a> <!-- fa-2x -->
						<ul class="dropdown-menu" id="language" onchange="submit()">
							<li><a href="?language=et">Eesti</a></li>
							<li><a href="?language=en">English</a></li>
							<li><a href="?language=ru">Русский</a></li>
							<li role="separator" class="divider"></li>
							<li class="dropdown-header">Example header</li>
							<li><a href="#">Example separated link</a></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
					<li id="header_li_contact"><a href="./contact"><fmt:message key="header.button.contact" /></a></li>
				</ul>
			</form>
			<!-- 
			<form>
			    <select id="language" name="language" onchange="submit()">
			        <option value="en" ${language == 'en' ? 'selected' : ''}>English</option>
			        <option value="et" ${language == 'et' ? 'selected' : ''}>Estonian</option>
			        <option value="ru" ${language == 'ru' ? 'selected' : ''}>Russian</option>
			    </select>
			</form>
			-->
			<!-- 
			<form method="post">
			    <label for="username"><fmt:message key="login.label.username" />:</label>
			    <input type="text" id="username" name="username">
			    <br>
			    <label for="password"><fmt:message key="login.label.password" />:</label>
			    <input type="password" id="password" name="password">
			    <br>
			    <fmt:message key="login.button.submit" var="buttonValue" />
			    <input type="submit" name="submit" value="${buttonValue}">
			</form>
			 -->
			<!-- <p>language is ${language}</p>  -->  <!-- et_EE -->
		</div>
		<!--/.nav-collapse -->
	</div>
	<!--/.container-fluid -->
</nav>

<!-- </div> -->
<!-- /container -->