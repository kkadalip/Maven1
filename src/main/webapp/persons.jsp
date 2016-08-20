<%@ include file="imports.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="html_head.jsp"%>
<title>JVR | People</title>

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
			  	<h3 class="panel-title">Inimesed (${fn:length(persons)})</h3>
		  	</div>
		  	<div class="panel-body">
	    		<c:forEach items="${persons}" var="item">
					<c:out value="${item.firstName} ${item.lastName}" /><br>
				</c:forEach>
		  	</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>