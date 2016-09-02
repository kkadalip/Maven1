<%@ include file="imports.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="html_head.jsp"%>
<title>JVR | Project</title>

<style type="text/css">
</style>

<script type="text/javascript">
	$(document).ready(function() { //window.onload = function () { 
		$("#header_li_projects").addClass("active");
	});
</script>

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
<script src="<c:url value="/static/PhotoSwipe/script-init.js" />"></script>
<!-- Extra stuff: -->
<script src="<c:url value="/static/js/jquery.dragchanged.js" />"></script>

<!-- Sly style -->
<link rel="stylesheet" href="<c:url value="/static/Sly/sly-horizontal.css"/>">

<script>
</script>

<style type="text/css">
</style>

</head>

<body>
	<%@ include file="header.jsp"%>

	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<c:out value="${project.name}" />
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

				<!-- 
				<div class="frame" id="oneperframe">

					<div class="slidee">
						<h2>This is a heading</h2>
						<p>This is a paragraph</p>
					</div>

					<div class="slidee">
						<h2>This is a heading</h2>
						<p>This is a paragraph</p>
					</div>

					<div class="slidee">
						<h2>This is a heading</h2>
						<p>This is a paragraph</p>
					</div>

				</div>

				<div class="frame">
					<div class="slidee">
						<h2>This in here...</h2>
						<p>
							...can be anything. <strong>Anything!</strong>
						</p>
					</div>
				</div>
				<div class="frame">
					<ul class="slidee">
						<li>asd1</li>
						<li>asd2</li>
						<li>asd3</li>
						<li>asd4</li>
						<li>asd5</li>
						<li>asd6</li>
						<li>asd7</li>
						<li>asd8</li>
						<li>asd9</li>
						<li>asd10</li>
					</ul>
				</div>
 				-->
 				
				<c:forEach items="${project.addresses}" var="address">
				aadress: ${address.city}, ${address.street} ${address.streetType} ${address.building}
				<br>
				</c:forEach>
				<c:if test="${!empty project.planningStartYear}">
					projekt: ${project.planningStartYear}<c:if
						test="${!empty project.planningEndYear}"> - ${project.planningEndYear}</c:if>
					<br>
				</c:if>
				<c:if test="${!empty project.buildingStartYear}">
					ehitus: ${project.buildingStartYear}<c:if
						test="${!empty project.buildingEndYear}"> - ${project.buildingEndYear}</c:if>
					<br>
				</c:if>
				<c:if test="${fn:length(project.architects) > 1}">
				 	arhitektid: 
				 </c:if>
				<c:if test="${fn:length(project.architects) == 1}">
				 	arhitekt: 
				 </c:if>
				<c:forEach items="${project.architects}" var="architect"
					varStatus="loop">
					 ${architect.firstName} ${architect.lastName}${loop.last ? '<br>' : ','} 
				</c:forEach>
				<c:forEach items="${project.originalAuthors}" var="originalAuthor">
					hoone algne autor: ${originalAuthor.firstName} ${originalAuthor.lastName}
					<br>
				</c:forEach>
				<c:if test="${!empty project.contributors}">
					kaastöö: 
					<c:forEach items="${project.contributors}" var="contributor"
						varStatus="loop">
						${contributor.firstName} ${contributor.lastName}${loop.last ? '<br>' : ','} 
					</c:forEach>
				</c:if>
				<c:if test="${!empty project.constructors}">
					<c:if test="${fn:length(project.constructors) > 1}">
					 	konstruktorid: 
					 </c:if>
					<c:if test="${fn:length(project.constructors) == 1}">
					 	konstruktor: 
					 </c:if>
					<c:forEach items="${project.constructors}" var="constructor"
						varStatus="loop">
						${constructor.firstName} ${constructor.lastName}${loop.last ? '<br>' : ','}
					</c:forEach>
				</c:if>
				<c:forEach items="${project.interiorDesigners}"
					var="interiorDesigner">
					sisekujundaja: ${interiorDesigner.firstName} ${interiorDesigner.lastName}
					<br>
				</c:forEach>
				<c:forEach items="${project.landscapeArchitects}"
					var="landscapeArchitect">
					maastikuarhitekt: ${landscapeArchitect.firstName} ${landscapeArchitect.lastName}
					<br>
				</c:forEach>
				<c:forEach items="${project.lightsDesigners}" var="lightsDesigner">
					sisekujundaja: ${lightsDesigner.firstName} ${lightsDesigner.lastName}
					<br>
				</c:forEach>
				<c:if test="${!empty project.sizeQuantity}">
					üldpind: ${project.sizeQuantity}m<sup>2</sup>
					<c:if test="${!empty project.apartmentsQuantity}">, ${project.apartmentsQuantity} korterit</c:if>
					<br>
				</c:if>
				<c:if test="${!empty project.prizeComment}">
					preemia: ${project.prizeComment}<br>
				</c:if>


				<!-- 
				<c:forEach items="${project.imagesPromo}" var="imagePromo">
					  <div class="col-md-4">
					    <a href="<c:url value="/static/images/${imagePromo.folderName}/${imagePromo.fileName}"/>" class="thumbnail">
					      <p>Bla bla text and removed style="width:150px;height:150px"</p>
					      <img src="<c:url value="/static/images/${imagePromo.folderName}/${imagePromo.fileName}"/>" class="img-responsive" alt="Promo picture" />
					    </a>
					  </div>
					<br>
				</c:forEach>
				 -->

				<h2>JVR gallery:</h2>
				<div id="scrollbar" class="scrollbar">
					<div class="handle"></div>
				</div>
				<div class="photoswipe-gallery" data-itemscope data-itemtype="http://schema.org/ImageGallery">
					<div class="frame" id="centered">
						<ul class="slidee">
							<c:forEach items="${project.imagesPromo}" var="imagePromo">
								<li>
									<figure style="padding:0; margin: 0;" data-itemprop="associatedMedia" data-itemscope data-itemtype="http://schema.org/ImageObject">
										<a href="<c:url value="/static/images/${imagePromo.folderName}/${imagePromo.fileName}"/>" data-itemprop="contentUrl" >
										<img src="<c:url value="/static/images/${imagePromo.folderName}/${imagePromo.fileName}"/>" class="img-responsive" data-itemprop="thumbnail" alt="Promo picture X" />
										</a>
									</figure>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!-- image thumbnail had eg data-size="370x500" -->
					<!--  
				<h2>JVR gallery:</h2>
				<div class="photoswipe-gallery" itemscope itemtype="http://schema.org/ImageGallery">
					<c:forEach items="${project.imagesPromo}" var="imagePromo">
						<div class="col-md-2">
							<figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
								<a href="<c:url value="/static/images/${imagePromo.folderName}/${imagePromo.fileName}"/>" class="thumbnail" itemprop="contentUrl" >
								<img src="<c:url value="/static/images/${imagePromo.folderName}/${imagePromo.fileName}"/>" class="img-responsive" itemprop="thumbnail" alt="Promo picture X" />
								</a>
								<figcaption itemprop="caption description">Whatever caption</figcaption>
							</figure>
						</div>
					</c:forEach>
				</div>
				-->
				</div>
			</div>

			<!-- http://photoswipe.com/documentation/getting-started.html -->
			<!-- 
		<h2>First gallery:</h2>

		<div class="my-gallery" itemscope itemtype="http://schema.org/ImageGallery">
			<figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
				<a href="https://farm3.staticflickr.com/2567/5697107145_a4c2eaa0cd_o.jpg" itemprop="contentUrl" data-size="1024x1024"> 
				<img src="https://farm3.staticflickr.com/2567/5697107145_3c27ff3cd1_m.jpg" itemprop="thumbnail" alt="Image description" />
				</a>
				<figcaption itemprop="caption description">Image caption 1</figcaption>
			</figure>

			<figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
				<a href="https://farm2.staticflickr.com/1043/5186867718_06b2e9e551_b.jpg" itemprop="contentUrl" data-size="964x1024"> 
				<img src="https://farm2.staticflickr.com/1043/5186867718_06b2e9e551_m.jpg" itemprop="thumbnail" alt="Image description" />
				</a>
				<figcaption itemprop="caption description">Image caption 2</figcaption>
			</figure>

			<figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
				<a href="https://farm7.staticflickr.com/6175/6176698785_7dee72237e_b.jpg" itemprop="contentUrl" data-size="1024x683"> 
				<img src="https://farm7.staticflickr.com/6175/6176698785_7dee72237e_m.jpg" itemprop="thumbnail" alt="Image description" />
				</a>
				<figcaption itemprop="caption description">Image caption 3</figcaption>
			</figure>

			<figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
				<a href="https://farm6.staticflickr.com/5023/5578283926_822e5e5791_b.jpg" itemprop="contentUrl" data-size="1024x768"> 
				<img src="https://farm6.staticflickr.com/5023/5578283926_822e5e5791_m.jpg" itemprop="thumbnail" alt="Image description" />
				</a>
				<figcaption itemprop="caption description">Image caption 4</figcaption>
			</figure>
		</div>

		<h2>Second gallery:</h2>

		<div class="my-gallery" itemscope itemtype="http://schema.org/ImageGallery">
			<figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
				<a href="https://farm2.staticflickr.com/1043/5186867718_06b2e9e551_b.jpg" itemprop="contentUrl" data-size="964x1024"> 
				<img src="https://farm2.staticflickr.com/1043/5186867718_06b2e9e551_m.jpg" itemprop="thumbnail" alt="Image description" />
				</a>
				<figcaption itemprop="caption description">Image caption 2.1</figcaption>
			</figure>

			<figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
				<a href="https://farm7.staticflickr.com/6175/6176698785_7dee72237e_b.jpg" itemprop="contentUrl" data-size="1024x683"> 
				<img src="https://farm7.staticflickr.com/6175/6176698785_7dee72237e_m.jpg" itemprop="thumbnail" alt="Image description" />
				</a>
				<figcaption itemprop="caption description">Image caption 2.2</figcaption>
			</figure>

			<figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
				<a href="https://farm6.staticflickr.com/5023/5578283926_822e5e5791_b.jpg" itemprop="contentUrl" data-size="1024x768"> 
				<img src="https://farm6.staticflickr.com/5023/5578283926_822e5e5791_m.jpg" itemprop="thumbnail" alt="Image description" />
				</a>
				<figcaption itemprop="caption description">Image caption 2.3</figcaption>
			</figure>
		</div>
 		-->

			<button id="btnOpenPhotoSwipe">Open PhotoSwipe</button>

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
							<!-- element will get class pswp__preloader--active when preloader is running -->
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
		</div>
	</div>
	<!-- end container -->

	<%@ include file="footer.jsp"%>

	<script src="<c:url value="/static/PhotoSwipe/script.js" />"></script>
	
	<!-- SLY JavaScript library for one-directional scrolling with item based navigation support: -->
	<script src="<c:url value="/static/Sly/sly.js" />"></script>
	<script src="<c:url value="/static/Sly/horizontal.js" />"></script>
</body>
</html>