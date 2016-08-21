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
<link rel="stylesheet" href="<c:url value="/static/PhotoSwipe/photoswipe.css"/>">

<!-- Skin CSS file (styling of UI - buttons, caption, etc.)
     In the folder of skin CSS file there are also:
     - .png and .svg icons sprite, 
     - preloader.gif (for browsers that do not support CSS animations) -->
<link rel="stylesheet" href="<c:url value="/static/PhotoSwipe/default-skin/default-skin.css"/>">

<!-- Core JS file -->
<script src="<c:url value="/static/PhotoSwipe/photoswipe-mod.js" />"></script> <!-- .min.js -->

<!-- UI JS file -->
<script src="<c:url value="/static/PhotoSwipe/photoswipe-ui-default.js" />"></script> <!-- .min.js -->

<!-- INIT from tutorial: -->
<script src="<c:url value="/static/PhotoSwipe/photoswipe-init.js" />"></script>

<!-- Extra stuff: -->
<script src="<c:url value="/static/js/jquery.dragchanged.js" />"></script>

<script>
var openPhotoSwipe = function() {
    var pswpElement = document.querySelectorAll('.pswp')[0];

    // build items array
    var items = [
        {
            src: 'https://farm2.staticflickr.com/1043/5186867718_06b2e9e551_b.jpg',
            w: 964,
            h: 1024
        },
        {
            src: 'https://farm7.staticflickr.com/6175/6176698785_7dee72237e_b.jpg',
            w: 1024,
            h: 683
        }
    ];
    
    // define options (if needed)
    var options = {
             // history & focus options are disabled on CodePen        
        history: false,
        focus: false,

        showAnimationDuration: 0,
        hideAnimationDuration: 0
        
    };
    
    var gallery = new PhotoSwipe( pswpElement, PhotoSwipeUI_Default, items, options);
    gallery.init();
};

//openPhotoSwipe();

$(document).ready(function() { //window.onload = function () { 
	initPhotoSwipeFromDOM('.my-gallery');
	$("#btnOpenPhotoSwipe").click(function(){ openPhotoSwipe(); });
	//openPhotoSwipe();
	
	/*
	function clearTransition() {
		// $(".pswp__container").css({ "transition": "" });
	}
	function setTransition() {
		// $(".pswp__container").css({ "transition": "transform 0.35s ease-in-out 0s" });
	}
	// set transition on arrow keys down
	$(".pswp").on("keydown", function(evt){
		// set transition if arrow keys are used
		if (evt.which == 37 || evt.which == 39)
			setTransition();
	});
	*/
});
</script>
</head>

<body>
	<%@ include file="header.jsp"%>
	
	<div class="container">
		<div class="panel panel-default">
		  	<div class="panel-heading">
			  	<h3 class="panel-title"><c:out value="${project.name}" /></h3>
		  	</div>
	  		<div class="panel-body">
				<!-- <b><c:out value="${project.name}" /></b><br>  -->
				<!-- id: ${project.id}<br> -->
				<!-- grupp: ${project.projectGroup.name}<br>  -->
				<!-- aadresse on ${fn:length(project.addresses)}<br>  -->
	
				<!-- example image location http://localhost:8080/Maven1/static/images/eramu_seedri/1.jpg -->
				
				<div style="background: white; color:black;">
					<c:forEach items="${project.addresses}" var="address">
					aadress: ${address.city}, ${address.street} ${address.streetType} ${address.building}
					<br>
					</c:forEach>
					<c:if test="${!empty project.planningStartYear}">
						projekt: ${project.planningStartYear}<c:if test="${!empty project.planningEndYear}"> - ${project.planningEndYear}</c:if><br>
					</c:if>
					<c:if test="${!empty project.buildingStartYear}">
						ehitus: ${project.buildingStartYear}<c:if test="${!empty project.buildingEndYear}"> - ${project.buildingEndYear}</c:if><br>
					</c:if>
					 <c:if test="${fn:length(project.architects) > 1}">
					 	arhitektid: 
					 </c:if>
					 <c:if test="${fn:length(project.architects) == 1}">
					 	arhitekt: 
					 </c:if>
					<c:forEach items="${project.architects}" var="architect" varStatus="loop">
						 ${architect.firstName} ${architect.lastName}${loop.last ? '<br>' : ','} 
					</c:forEach>
					<c:forEach items="${project.originalAuthors}" var="originalAuthor">
						hoone algne autor: ${originalAuthor.firstName} ${originalAuthor.lastName}
						<br>
					</c:forEach>
					<c:if test="${!empty project.contributors}">
						kaastöö: 
						<c:forEach items="${project.contributors}" var="contributor" varStatus="loop">
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
						<c:forEach items="${project.constructors}" var="constructor" varStatus="loop">
							${constructor.firstName} ${constructor.lastName}${loop.last ? '<br>' : ','}
						</c:forEach>
					</c:if>
					<c:forEach items="${project.interiorDesigners}" var="interiorDesigner">
						sisekujundaja: ${interiorDesigner.firstName} ${interiorDesigner.lastName}
						<br>
					</c:forEach>
					<c:forEach items="${project.landscapeArchitects}" var="landscapeArchitect">
						maastikuarhitekt: ${landscapeArchitect.firstName} ${landscapeArchitect.lastName}
						<br>
					</c:forEach>
					<c:forEach items="${project.lightsDesigners}" var="lightsDesigner">
						sisekujundaja: ${lightsDesigner.firstName} ${lightsDesigner.lastName}
						<br>
					</c:forEach>
					<c:if test="${!empty project.sizeQuantity}">
						üldpind: ${project.sizeQuantity}m<sup>2</sup><c:if test="${!empty project.apartmentsQuantity}">, ${project.apartmentsQuantity} korterit</c:if><br>
					</c:if>
					<c:if test="${!empty project.prizeComment}">
						preemia: ${project.prizeComment}<br>
					</c:if>
				</div>
				
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
				<div class="photoswipe-gallery" itemscope itemtype="http://schema.org/ImageGallery">
					<c:forEach items="${project.imagesPromo}" var="imagePromo">
						<figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
							<a href="<c:url value="/static/images/${imagePromo.folderName}/${imagePromo.fileName}"/>" itemprop="contentUrl" > <!-- data-size="370x500" -->
							<img src="<c:url value="/static/images/${imagePromo.folderName}/${imagePromo.fileName}"/>" itemprop="thumbnail" alt="Promo picture X" />
							</a>
							<figcaption itemprop="caption description">Whatever caption</figcaption>
						</figure>
					</c:forEach>
				</div>
			</div>
		</div>


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
		
		                <button class="pswp__button pswp__button--close" title="Close (Esc)"></button>
		
		                <button class="pswp__button pswp__button--share" title="Share"></button>
		
		                <button class="pswp__button pswp__button--fs" title="Toggle fullscreen"></button>
		
		                <button class="pswp__button pswp__button--zoom" title="Zoom in/out"></button>
		
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
		
		            <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
		                <div class="pswp__share-tooltip"></div> 
		            </div>
		
		            <button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)">
		            </button>
		
		            <button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)">
		            </button>
		
		            <div class="pswp__caption">
		                <div class="pswp__caption__center"></div>
		            </div>
		
		        </div>
		
		    </div>
		
		</div>
		
		
	</div> <!-- end container -->
	
	<%@ include file="footer.jsp"%>
    
    <script>
    	/** photoswipe begin **/

    	/*
		function clearTransition() {
			// $(".pswp__container").css({ "transition": "" });
		}

		function setTransition() {
			// $(".pswp__container").css({ "transition": "transform 0.35s ease-in-out 0s" });
		}


		$(function(){

			// set transition on arrow keys down
			$(".pswp").on("keydown", function(evt){
				// set transition if arrow keys are used
				if (evt.which == 37 || evt.which == 39)
					setTransition();
			});

			// listen to dragchanged events and set transion on drag end
			$(".pswp__container")
				.on("drag:changed", function(evt, isDragging){

					if (isDragging)
						clearTransition();	// clear transition that was set on mouseUsed event
					else
						setTimeout(setTransition, 500);
				})
				.dragchanged();				// wire plugin so the events will fire
		});
		//*/


    	$(function(){

    		var pswp = $(".pswp")[0];
    		var slides = [];
    		var photoSwipe;

			function getSlideDimensions(slide, photoSwipe) {

// console.log("getSlideDimensions:717", slide.src)

				if (!slide.doGetSlideDimensions)
					return;

				var isPrefetch = (typeof photoSwipe == "undefined");

// console.log("getSlideDimensions:722", isPrefetch, slide.src)


				var img = new Image();

				$(img).on("error", function(evt){

					if (!isPrefetch)
						slide.doGetSlideDimensions = false;
				});

				$(img).on("load", function(evt){

					slide.doGetSlideDimensions = false;

					slide.w = img.naturalWidth;
					slide.h = img.naturalHeight;

					if (!isPrefetch) {

						photoSwipe.invalidateCurrItems();
						photoSwipe.updateSize(true);
					}
				});

				img.src = slide.src;
			}

			/** return the thumbnail's bounds for zomm-in and zoom-out animation */
			function getThumbBounds(index) {

				var slide = slides[index];

				var  thumbnail   = slide.$figure.find("a img")//.find("img")
					,thumbOffset = thumbnail.offset()
					,thumbWidth  = thumbnail.width();

				return { x: thumbOffset.left, y: thumbOffset.top, w: thumbWidth };
			}

			$(".photoswipe-gallery")
				.find("figure")
					.each(function(ix, el){
						// parse markup and retrieve slides information from ".photoswipe-gallery figure"
						var  $figure = $(this);
						var  $anchor = $figure.find("a");

						var size = ($anchor.data("size") || "0x0").split("x");
						// var thumbOffset = $figure.offset();

						var slide = {

							 $figure : $figure
							,src     : $anchor.attr("href")
							,w       : size[0]
							,h       : size[1]

							,title   : $figure.find("figcaption").html()
						};

						slide.doGetSlideDimensions = (slide.w == 0 || slide.h == 0);

						slides.push(slide);

						$figure.on("click", function(evt){

							evt.preventDefault();

							var options = {
								 index                 : ix
								,bgOpacity             : 0.90
								,showHideOpacity       : false
								,getThumbBoundsFn      : getThumbBounds
								// ,showAnimationDuration : 500
								// ,hideAnimationDuration : 500

								,preload               : [5, 5]
								,shareButtons: [
									 {id:'facebook', label:'Share on <b>Facebook</b>', url:'https://www.facebook.com/sharer/sharer.php?u={{url}}'}
									,{id:'twitter', label:'<b>Tweet</b>', url:'https://twitter.com/intent/tweet?text={{text}}&url={{url}}'}
									,{id:'pinterest', label:'<b>Pin it</b>', url:'http://www.pinterest.com/pin/create/button/'+
													'?url={{url}}&media={{image_url}}&description={{text}}'}
													// ,{id:'download', label:'Download image', url:'{{raw_image_url}}', download:true}
			]
							}


							photoSwipe = new PhotoSwipe(pswp, PhotoSwipeUI_Default, slides, options);

							photoSwipe.listen("gettingData", function(index, slide){

								if (slide.doGetSlideDimensions) {

									setTimeout(
										// use setTimeout to run in the event loop
										 function(){ getSlideDimensions(slide, photoSwipe); }
										,300
									);
								}
							}); // .listen(gettingData)

							photoSwipe.listen("imageLoadComplete", function(index, slide){

								if (slide.doGetSlideDimensions)
									getSlideDimensions(slide, photoSwipe);
							}); // .listen(imageLoadComplete)

							// photoSwipe.listen("mouseUsed", setTransition);

							// photoSwipe.listen("pointerDown", function(){ console.log("pointerDown") });
							// photoSwipe.listen("dragStart", function(){ console.log("dragStart") });
							// photoSwipe.listen("dragEnd", function(){ console.log("dragEnd") });

							// photoSwipe.listen("beforeChange", function(){});
							// photoSwipe.listen("afterChange", function(){});

							photoSwipe.init();

							window.photoSwipe = photoSwipe;

							// $("body").on("photoswipe:refresh", function(){
							// 	console.log("photoswipe:refresh", photoSwipe);
							// });
						});
					}); // .each()

    		// console.dir(slides);


			// prefetch slides images
			var i;
			for (i in slides) {
				setTimeout(
					getSlideDimensions
					,1000 + i*20
					,slides[i]
				);
			} // for-in
		});
		/** photoswipe   end **/

	</script>
</body>
</html>