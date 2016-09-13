<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="imports.jsp"%>

<!DOCTYPE html>
<html lang="${language}">
<head>
<%@ include file="html_head.jsp"%>
<title>JVR | Project</title>

<style type="text/css">
</style>

<script type="text/javascript">
	$(document).ready(function() { //window.onload = function () { 
		$("#header_li_people").addClass("active");
	});
</script>
</head>

<body>
	<%@ include file="header.jsp"%>
	
	<div class="container">
		<div class="panel panel-default">
		  	<div class="panel-heading">
			  	<h3 class="panel-title"><c:out value="${person.firstName} ${person.lastName}" /></h3>
		  	</div>
  		  	<div class="panel-body">
				...
			</div>
		</div>
	</div>
	
	<%@ include file="footer.jsp"%>
</body>
</html>