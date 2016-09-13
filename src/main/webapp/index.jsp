<%@ include file="imports.jsp"%>

<!DOCTYPE html>
<html lang="${language}">
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
			<div class="brightBackground col-md-12">
				<p>
					<h1><fmt:message key="index.title.JVR" /></h1>
					<br>
					<fmt:message key="index.titleSentence" />
					<br>
					<br>
					<b><fmt:message key="index.architects.title" />:</b>
					<br>
					<a href="<c:url value="/velle_kadalipp" />">Velle Kadalipp</a> <fmt:message key="index.architects.1" />
					<br>
					<a href="<c:url value="/kalle_vellevoog" />">Kalle Vellevoog</a> <fmt:message key="index.architects.2" />
					<br>
					<br>
					<b><fmt:message key="index.workers.title" />:</b>
					<br>
					<fmt:message key="index.workers.1" /><br>
					<fmt:message key="index.workers.2" /><br>
					<fmt:message key="index.workers.3" /><br>
					<fmt:message key="index.workers.4" /><br>
				</p>
			</div>
		</div>
		<!-- /container -->
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>
