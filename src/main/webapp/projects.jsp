<%@ include file="imports.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="html_head.jsp"%>
<title>JVR | Projects</title>

<style type="text/css">
</style>

<script type="text/javascript">
	$(document).ready(function() { //window.onload = function () { 
		$("#header_li_projects").addClass("active");
	});
</script>
</head>

<body>
	<%@ include file="header.jsp"%>
	
	<div class="container">	
		
		<div class="panel panel-default">
		  	<div class="panel-heading">
			  	<h3 class="panel-title">People (${fn:length(persons)})</h3>
		  	</div>
		  	<div class="panel-body">
	    		<c:forEach items="${persons}" var="item">
					<c:out value="${item.firstName} ${item.lastName}" /><br>
				</c:forEach>
		  	</div>
		</div>
		
		<div class="panel panel-default">
		  	<div class="panel-heading">
			  	<h3 class="panel-title">Project Groups (${fn:length(projectGroups)})</h3>
		  	</div>
		  	<div class="panel-body">
				<c:forEach items="${projectGroups}" var="item">
					<c:out value="${item.name}" /><br>
				</c:forEach>
		  	</div>
		</div>
		
		<div class="panel panel-default">
		  	<div class="panel-heading">
			  	<h3 class="panel-title">Projects (${fn:length(projects)})</h3>
		  	</div>
		  	<div class="panel-body">
				<c:forEach items="${projects}" var="item">
					<b><c:out value="${item.name}" /></b><br>
					project: ${item.planningStartYear} - ${item.planningEndYear}<br>
					ehitus: ${item.buildingStartYear} - ${item.buildingEndYear}<br>
					<!--
					JSTL
					<c:choose>
					    <c:when test="${param.enter=='1'}">
					        pizza. 
					        <br />
					    </c:when>    
					    <c:otherwise>
					        pizzas. 
					        <br />
					    </c:otherwise>
					</c:choose>
					 -->
					<c:forEach items="${item.architects}" var="architect">
						arhitekt: ${architect.firstName} ${architect.lastName}
					</c:forEach>
					<br>
					üldpind: ${item.sizeQuantity} m<sup>2</sup>
					<br>
					<br>
				</c:forEach>
				<br>
		  	</div>
		</div>

		<div class="panel panel-default">
		  <div class="panel-heading">
			  <h3 class="panel-title">Eramud</h3>
		  </div>
		  <div class="panel-body">
	          <a href="et/projektid/projektid?action=show_project&amp;project_id=5">Eramute grupp Seedri ja Remmelga tänavate vahelisel alal Pärnus</a><br>
	          <a href="et/projektid/projektid?action=show_project&amp;project_id=4">Eramu Rohuneemes</a><br>
	          <a href="et/projektid/projektid?action=show_project&amp;project_id=60">Eramu Rohuneemes 2</a><br>
	          <a href="et/projektid/projektid?action=show_project&amp;project_id=3">Eramu Tallinnas Aate  tänaval</a><br>
	          <a href="et/projektid/projektid?action=show_project&amp;project_id=6">Suvila Karepal Lääne-Virumaal</a><br>
	          <a href="et/projektid/projektid?action=show_project&amp;project_id=50">Eramu Mäepea külas Harjumaal</a><br>
	          <a href="et/projektid/projektid?action=show_project&amp;project_id=48">Suvila-vaatetorn põhjarannikul</a><br>
		  </div>
		</div>
		
		<div class="panel panel-default">
		  	<div class="panel-heading">
			  	<h3 class="panel-title">Korterelamud ja ühiskondlikud hooned</h3>
		  	</div>
		  	<div class="panel-body">
				<a href="et/projektid/projektid?action=show_project&amp;project_id=27">Pansionaat Pärnus Seedri tn 4</a><br>
				<a href="et/projektid/projektid?action=show_project&amp;project_id=28">Korterelamud Tallinnas Pähkli tänaval</a><br>
				<a href="et/projektid/projektid?action=show_project&amp;project_id=65">Büroo- ja kortermaja Tallinnas Tartu mnt. 25</a><br>
				<a href="et/projektid/projektid?action=show_project&amp;project_id=67">EHL hoone rekonstrueerimine Eesti Helikunsti Keskuseks</a><br>
				<a href="et/projektid/projektid?action=show_project&amp;project_id=66">Naftatehase peahoone Jaroslavlis</a><br>
				<a href="et/projektid/projektid?action=show_project&amp;project_id=32">Korterelamu Tallinnas Tatari tn 9/11</a><br>
				<a href="et/projektid/projektid?action=show_project&amp;project_id=69">Korterelamu Tallinnas Masti tänaval</a><br>
				<a href="et/projektid/projektid?action=show_project&amp;project_id=68">Tööstuse tn 54a hoone rekonstruktsioon</a><br>
				<a href="et/projektid/projektid?action=show_project&amp;project_id=61">Kortermajad Tallinnas Helme tänaval</a><br>
				<a href="et/projektid/projektid?action=show_project&amp;project_id=31">Kortermaja rekonstruktsioon Suur-Patarei 16, Tallinn</a><br>
				<a href="et/projektid/projektid?action=show_project&amp;project_id=38">Äri- ja eluhoone Jõhvis Narva mnt 14</a><br>
				<a href="et/projektid/projektid?action=show_project&amp;project_id=23">Korterelamu Haapsalus Suur-Liiva tn 15</a><br>
				<a href="et/projektid/projektid?action=show_project&amp;project_id=64">Büroohoone Tallinnas Metalli tänaval</a><br>
				<a href="et/projektid/projektid?action=show_project&amp;project_id=17">Büroohoone Tallinnas Pärnu mnt 153</a><br>
				<a href="et/projektid/projektid?action=show_project&amp;project_id=21">Korterelamu Tallinnas Kaupmehe tn 6</a><br>
				<a href="et/projektid/projektid?action=show_project&amp;project_id=16">Büroohoone Tallinnas Katusepapi tn 8</a><br>
				<a href="et/projektid/projektid?action=show_project&amp;project_id=25">Korterelamu Pärnus Papli tn 34</a><br>
				<a href="et/projektid/projektid?action=show_project&amp;project_id=40">Kortermaja Ristiku tänaval</a><br>
				<a href="et/projektid/projektid?action=show_project&amp;project_id=24">Korterelamu Tallinnas Luige tn 3</a><br>
				<a href="et/projektid/projektid?action=show_project&amp;project_id=22">Korterelamu Tallinnas Kaupmehe tn 12</a><br>
		  	</div>
		</div>
		
		
		<div class="panel panel-default">
		  	<div class="panel-heading">
			  	<h3 class="panel-title">Konkursiprojektid</h3>
		  	</div>
		  	<div class="panel-body">
		    	<a href="et/projektid/projektid?action=show_project&amp;project_id=70">Narva linnuse arhitektuurivõistlus</a><br>
                <a href="et/projektid/projektid?action=show_project&amp;project_id=54">Narva Joaoru puhkeala arhitektuurne ideekonkurss</a><br>
                <a href="et/projektid/projektid?action=show_project&amp;project_id=37">Eesti saatkond Pekingis</a><br>
                <a href="et/projektid/projektid?action=show_project&amp;project_id=52">Rakvere Pauluse kiriku rekonstrueerimise arhitektuurivõistlus</a><br>
                <a href="et/projektid/projektid?action=show_project&amp;project_id=14">Büroohoone Tallinnas</a><br>
                <a href="et/projektid/projektid?action=show_project&amp;project_id=53">Eesti Maaülikooli juurdeehitise arhitektuurivõistlus</a><br>
                <a href="et/projektid/projektid?action=show_project&amp;project_id=56">AS G4S büroohoone</a><br>
                <a href="et/projektid/projektid?action=show_project&amp;project_id=63">Tartu raamatukogu ja kunstimuuseumi arhitektuurivõistlus</a><br>
	  		</div>
		</div>
		
		<div class="panel panel-default">
		  	<div class="panel-heading">
			  	<h3 class="panel-title">Planeeringud</h3>
		  	</div>
		  	<div class="panel-body">
		    	<a href="et/projektid/projektid?action=show_project&amp;project_id=55">Vabaduse tn. 72, Narva-Jõesuu. Hoonestuskava.</a><br>
                <a href="et/projektid/projektid?action=show_project&amp;project_id=47">Paldiski mnt. 50 mahuline planeering. Konkursitöö</a><br>
		  	</div>
		</div>
		
		<div class="panel panel-default">
		  	<div class="panel-heading">
			  	<h3 class="panel-title">Näitused</h3>
		  	</div>
		  	<div class="panel-body">
		    	<a href="et/projektid/projektid?action=show_project&amp;project_id=57">Eesti ekspositsioon 12. Veneetsia Arhitektuuribiennaalil</a><br>
                <a href="et/projektid/projektid?action=show_project&amp;project_id=62">Eesti ekspositsioon 12. Veneetsia Arhitektuuribiennaalil - Näitus Soolalaos</a><br>
                <a href="et/projektid/projektid?action=show_project&amp;project_id=58">Näitus MAJAD</a><br>
                <a href="et/projektid/projektid?action=show_project&amp;project_id=59">Näitus MAJA</a><br>
 	 		</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>