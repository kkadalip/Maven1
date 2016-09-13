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
		$("#header_li_projects").addClass("active");
	});
</script>

<c:if test="${!empty project.images}">
	<!-- PhotoSwipe: -->
	<!--[if lt IE 9]>
	    <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.min.js"></script>
	<![endif]-->
	
	<!-- http://photoswipe.com/documentation/getting-started.html -->
	
	<!-- Core CSS file -->
	<link rel="stylesheet"
		href="<c:url value="/static/PhotoSwipe/photoswipe.css"/>">
	
	<!-- Skin CSS file (styling of UI - buttons, caption, etc.)
	     In the folder of skin CSS file there are also:
	     - .png and .svg icons sprite, 
	     - preloader.gif (for browsers that do not support CSS animations) -->
	<link rel="stylesheet" href="<c:url value="/static/PhotoSwipe/default-skin/default-skin.css"/>">
	
	<!-- Core JS file -->
	<script src="<c:url value="/static/PhotoSwipe/photoswipe-mod.js" />"></script>
	<!-- .min.js -->
	
	<!-- UI JS file -->
	<script src="<c:url value="/static/PhotoSwipe/photoswipe-ui-default.js" />"></script>
	<!-- .min.js -->
	
	<!-- INIT from tutorial: -->
	<script src="<c:url value="/static/PhotoSwipe/photoswipe-init.js" />"></script>
	
	<!-- PhotoSwipe initializing -->
	<!-- <script src="<c:url value="/static/PhotoSwipe/script-init.js" />"></script>  -->
	<!-- Extra stuff: -->
	<script src="<c:url value="/static/js/jquery.dragchanged.js" />"></script>
	
	<!-- Sly style -->
	<link rel="stylesheet" href="<c:url value="/static/Sly/sly-horizontal.css"/>">
</c:if>
</head>

<body>
	<%@ include file="header.jsp"%>

	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<fmt:message key="${project.name}" />
				</h3>
			</div>
			<div class="panel-body">
				<!-- <b><c:out value="${project.name}" /></b><br>  -->
				<!-- id: ${project.id}<br> -->
				<!-- grupp: ${project.projectGroup.name}<br>  -->
				<!-- aadresse on ${fn:length(project.addresses)}<br>  -->

				<!-- example image location http://localhost:8080/Maven1/static/images/eramu_seedri/1.jpg -->

				<!-- 
				<div style="background: white; color:black;">
					<br>
					<br>
				</div>
				<br>
				-->
 				
 				<!-- <h2>JVR gallery:</h2> -->
				<!-- Count of images: ${fn:length(project.images)} <br>  -->
				<c:if test="${!empty project.images}">
					<!-- I HAVE IMAGES! -->
					<div class="photoswipe-gallery" data-itemscope data-itemtype="http://schema.org/ImageGallery">
						<div class="frame" id="centered">
							<ul class="slidee"> <!-- clearfix -->
								<c:forEach items="${project.images}" var="image">
									<li>
										<figure style="padding:0; margin: 0;" data-itemprop="associatedMedia" data-itemscope data-itemtype="http://schema.org/ImageObject">
											<a href="<c:url value="/static/images/${image.folderName}/${image.fileName}"/>" data-itemprop="contentUrl" >
											<img src="${pageContext.request.contextPath}/static/images/${image.folderName}/${image.fileName}" class="image-mod img-responsive" data-itemprop="thumbnail" alt="Picture" /> <!-- img-responsive -->
											</a>
										</figure>
									</li>
								</c:forEach>
							</ul>
						</div>
						<br>
						<div id="scrollbar" class="scrollbar">
							<div class="handle"></div>
						</div>
					</div>
					
					<!-- <button id="btnOpenPhotoSwipe">Open PhotoSwipe</button>  -->
		
					<!-- Root element of PhotoSwipe. Must have class pswp. -->
					<div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
		
						<!-- Background of PhotoSwipe. 
				         It's a separate element as animating opacity is faster than rgba(). -->
						<div class="pswp__bg"></div>
		
						<!-- Slides wrapper with overflow:hidden. -->
						<div class="pswp__scroll-wrap">
		
							<!-- Container that holds slides. 
				            PhotoSwipe keeps only 3 of them in the DOM to save memory.
				            Don't modify these 3 pswp__item elements, data is added later on. -->
							<div class="pswp__container">
								<div class="pswp__item"></div>
								<div class="pswp__item"></div>
								<div class="pswp__item"></div>
							</div>
		
							<!-- Default (PhotoSwipeUI_Default) interface on top of sliding area. Can be changed. -->
							<div class="pswp__ui pswp__ui--hidden">
		
								<div class="pswp__top-bar">
		
									<!--  Controls are self-explanatory. Order can be changed. -->
		
									<div class="pswp__counter"></div>
		
									<button class="pswp__button pswp__button--close"
										title="Close (Esc)"></button>
		
									<button class="pswp__button pswp__button--share" title="Share"></button>
		
									<button class="pswp__button pswp__button--fs"
										title="Toggle fullscreen"></button>
		
									<button class="pswp__button pswp__button--zoom"
										title="Zoom in/out"></button>
		
									<!-- Preloader demo http://codepen.io/dimsemenov/pen/yyBWoR -->
									<!-- element will get class pswp__preloader-active when preloader is running -->
									<div class="pswp__preloader">
										<div class="pswp__preloader__icn">
											<div class="pswp__preloader__cut">
												<div class="pswp__preloader__donut"></div>
											</div>
										</div>
									</div>
								</div>
		
								<div
									class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
									<div class="pswp__share-tooltip"></div>
								</div>
		
								<button class="pswp__button pswp__button--arrow--left"
									title="Previous (arrow left)"></button>
		
								<button class="pswp__button pswp__button--arrow--right"
									title="Next (arrow right)"></button>
		
								<div class="pswp__caption">
									<div class="pswp__caption__center"></div>
								</div>
							</div>
						</div>
					</div>
					
					<script src="<c:url value="/static/PhotoSwipe/script.js" />"></script>
					<!-- SLY JavaScript library for one-directional scrolling with item based navigation support: -->
					<script src="<c:url value="/static/Sly/sly.js" />"></script>
					<script src="<c:url value="/static/Sly/horizontal.js" />"></script>
				</c:if>

				<c:if test="${!empty project.addresses}">
					<c:forEach items="${project.addresses}" var="address">
						<fmt:message key="project.address" />:&nbsp;${address.city}, ${address.street} ${address.streetType} ${address.building}
					<br>
					</c:forEach>
				</c:if>

				<c:if test="${!empty project.planningStartYear}">
					<fmt:message key="project.project" />:&nbsp;${project.planningStartYear}<c:if
						test="${!empty project.planningEndYear}"> - ${project.planningEndYear}</c:if>
					<br>
				</c:if>

				<c:if test="${!empty project.buildingStartYear}">
					<fmt:message key="project.building" />:&nbsp;${project.buildingStartYear}<c:if
						test="${!empty project.buildingEndYear}"> - ${project.buildingEndYear}</c:if>
					<br>
				</c:if>

				<c:if test="${!empty project.architects}">
					<c:if test="${fn:length(project.architects) > 1}">
						<fmt:message key="project.architects"/>:&nbsp;
					</c:if>
					<c:if test="${fn:length(project.architects) == 1}">
						<fmt:message key="project.architect"/>:&nbsp;
					</c:if>
					<c:forEach items="${project.architects}" var="architect"
						varStatus="loop">
					${architect.firstName} ${architect.lastName}${loop.last ? '<br>' : ','} 
					</c:forEach>
				</c:if>

				<c:if test="${!empty project.originalAuthors}">
					<c:if test="${fn:length(project.originalAuthors) > 1}">
						<fmt:message key="project.original.authors" />:&nbsp;
					 </c:if>
					<c:if test="${fn:length(project.originalAuthors) == 1}">
						<fmt:message key="project.original.author" />:&nbsp;
					 </c:if>
					 <c:forEach items="${project.architects}" var="originalAuthor" varStatus="loop">
						 ${originalAuthor.firstName} ${originalAuthor.lastName}${loop.last ? '<br>' : ','} 
					</c:forEach>
				</c:if>

				<c:if test="${!empty project.contributors}">
					<c:if test="${fn:length(project.contributors) > 1}">
						<fmt:message key="project.contributors" />:&nbsp;
					</c:if>
					<c:if test="${fn:length(project.contributors) == 1}">
						<fmt:message key="project.contributor" />:&nbsp;
				 	</c:if>
					<c:forEach items="${project.contributors}" var="contributor" varStatus="loop">
						${contributor.firstName} ${contributor.lastName}${loop.last ? '<br>' : ','} 
					</c:forEach>
				</c:if>

				<c:if test="${!empty project.constructors}">
					<c:if test="${fn:length(project.constructors) > 1}">
						<fmt:message key="project.constructors" />:&nbsp;
					 </c:if>
					<c:if test="${fn:length(project.constructors) == 1}">
						<fmt:message key="project.constructor" />:&nbsp;
					 </c:if>
					<c:forEach items="${project.constructors}" var="constructor" varStatus="loop">
						${constructor.firstName} ${constructor.lastName}${loop.last ? '<br>' : ','}
					</c:forEach>
				</c:if>

				<c:if test="${!empty project.interiorDesigners}">
					<c:if test="${fn:length(project.interiorDesigners) > 1}">
						<fmt:message key="project.interior.designers" />:&nbsp;
					 </c:if>
					<c:if test="${fn:length(project.interiorDesigners) == 1}">
						<fmt:message key="project.interior.designer" />:&nbsp;
					 </c:if>
					<c:forEach items="${project.interiorDesigners}" var="interiorDesigner">
						${interiorDesigner.firstName} ${interiorDesigner.lastName}
						<br>
					</c:forEach>
				</c:if>

				<c:if test="${!empty project.landscapeArchitects}">
					<c:if test="${fn:length(project.landscapeArchitects) > 1}">
						<fmt:message key="project.landscape.architects" />:&nbsp;
					 </c:if>
					<c:if test="${fn:length(project.landscapeArchitects) == 1}">
						<fmt:message key="project.landscape.architect" />:&nbsp;
					 </c:if>
 					<c:forEach items="${project.landscapeArchitects}" var="landscapeArchitect">
					${landscapeArchitect.firstName} ${landscapeArchitect.lastName}
					<br>
					</c:forEach>
				</c:if>

				<c:if test="${!empty project.lightsDesigners}">
					<c:if test="${fn:length(project.lightsDesigners) > 1}">
						<fmt:message key="project.lights.designers" />:&nbsp;
					</c:if>
					<c:if test="${fn:length(project.lightsDesigners) == 1}">
							<fmt:message key="project.lights.designers" />:&nbsp;
					</c:if>
					<c:forEach items="${project.lightsDesigners}" var="lightsDesigner">
					${lightsDesigner.firstName} ${lightsDesigner.lastName}
					<br>
				</c:forEach>
				</c:if>
				
				<c:if test="${!empty project.sizeQuantity}">
					<fmt:message key="project.size"/>:&nbsp;${project.sizeQuantity}m<sup>2</sup>
					<c:if test="${!empty project.apartmentsQuantity}">, ${project.apartmentsQuantity} korterit</c:if>
					<br>
				</c:if>
				
				<c:if test="${!empty project.prizeComment}">
					<fmt:message key="project.prize"/>:&nbsp;${project.prizeComment}<br>
				</c:if>
			</div>
		</div>
	</div>
	<!-- end container -->

	<%@ include file="footer.jsp"%>
</body>
</html>