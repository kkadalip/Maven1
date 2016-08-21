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
<script src="<c:url value="/static/PhotoSwipe/photoswipe.js" />"></script> <!-- .min.js -->

<!-- UI JS file -->
<script src="<c:url value="/static/PhotoSwipe/photoswipe-ui-default.js" />"></script> <!-- .min.js -->

<script>
var initPhotoSwipeFromDOM = function(gallerySelector) {

    // parse slide data (url, title, size ...) from DOM elements 
    // (children of gallerySelector)
    var parseThumbnailElements = function(el) {
        var thumbElements = el.childNodes,
            numNodes = thumbElements.length,
            items = [],
            figureEl,
            linkEl,
            size,
            item;

        for(var i = 0; i < numNodes; i++) {

            figureEl = thumbElements[i]; // <figure> element

            // include only element nodes 
            if(figureEl.nodeType !== 1) {
                continue;
            }

            linkEl = figureEl.children[0]; // <a> element

            size = linkEl.getAttribute('data-size').split('x');

            // create slide object
            item = {
                src: linkEl.getAttribute('href'),
                w: parseInt(size[0], 10),
                h: parseInt(size[1], 10)
            };



            if(figureEl.children.length > 1) {
                // <figcaption> content
                item.title = figureEl.children[1].innerHTML; 
            }

            if(linkEl.children.length > 0) {
                // <img> thumbnail element, retrieving thumbnail url
                item.msrc = linkEl.children[0].getAttribute('src');
            } 

            item.el = figureEl; // save link to element for getThumbBoundsFn
            items.push(item);
        }

        return items;
    };

    // find nearest parent element
    var closest = function closest(el, fn) {
        return el && ( fn(el) ? el : closest(el.parentNode, fn) );
    };

    // triggers when user clicks on thumbnail
    var onThumbnailsClick = function(e) {
        e = e || window.event;
        e.preventDefault ? e.preventDefault() : e.returnValue = false;

        var eTarget = e.target || e.srcElement;

        // find root element of slide
        var clickedListItem = closest(eTarget, function(el) {
            return (el.tagName && el.tagName.toUpperCase() === 'FIGURE');
        });

        if(!clickedListItem) {
            return;
        }

        // find index of clicked item by looping through all child nodes
        // alternatively, you may define index via data- attribute
        var clickedGallery = clickedListItem.parentNode,
            childNodes = clickedListItem.parentNode.childNodes,
            numChildNodes = childNodes.length,
            nodeIndex = 0,
            index;

        for (var i = 0; i < numChildNodes; i++) {
            if(childNodes[i].nodeType !== 1) { 
                continue; 
            }

            if(childNodes[i] === clickedListItem) {
                index = nodeIndex;
                break;
            }
            nodeIndex++;
        }



        if(index >= 0) {
            // open PhotoSwipe if valid index found
            openPhotoSwipe( index, clickedGallery );
        }
        return false;
    };

    // parse picture index and gallery index from URL (#&pid=1&gid=2)
    var photoswipeParseHash = function() {
        var hash = window.location.hash.substring(1),
        params = {};

        if(hash.length < 5) {
            return params;
        }

        var vars = hash.split('&');
        for (var i = 0; i < vars.length; i++) {
            if(!vars[i]) {
                continue;
            }
            var pair = vars[i].split('=');  
            if(pair.length < 2) {
                continue;
            }           
            params[pair[0]] = pair[1];
        }

        if(params.gid) {
            params.gid = parseInt(params.gid, 10);
        }

        return params;
    };

    var openPhotoSwipe = function(index, galleryElement, disableAnimation, fromURL) {
        var pswpElement = document.querySelectorAll('.pswp')[0],
            gallery,
            options,
            items;

        items = parseThumbnailElements(galleryElement);

        // define options (if needed)
        options = {

            // define gallery index (for URL)
            galleryUID: galleryElement.getAttribute('data-pswp-uid'),

            getThumbBoundsFn: function(index) {
                // See Options -> getThumbBoundsFn section of documentation for more info
                var thumbnail = items[index].el.getElementsByTagName('img')[0], // find thumbnail
                    pageYScroll = window.pageYOffset || document.documentElement.scrollTop,
                    rect = thumbnail.getBoundingClientRect(); 

                return {x:rect.left, y:rect.top + pageYScroll, w:rect.width};
            }

        };

        // PhotoSwipe opened from URL
        if(fromURL) {
            if(options.galleryPIDs) {
                // parse real index when custom PIDs are used 
                // http://photoswipe.com/documentation/faq.html#custom-pid-in-url
                for(var j = 0; j < items.length; j++) {
                    if(items[j].pid == index) {
                        options.index = j;
                        break;
                    }
                }
            } else {
                // in URL indexes start from 1
                options.index = parseInt(index, 10) - 1;
            }
        } else {
            options.index = parseInt(index, 10);
        }

        // exit if index not found
        if( isNaN(options.index) ) {
            return;
        }

        if(disableAnimation) {
            options.showAnimationDuration = 0;
        }

        // Pass data to PhotoSwipe and initialize it
        gallery = new PhotoSwipe( pswpElement, PhotoSwipeUI_Default, items, options);
        gallery.init();
    };

    // loop through all gallery elements and bind events
    var galleryElements = document.querySelectorAll( gallerySelector );

    for(var i = 0, l = galleryElements.length; i < l; i++) {
        galleryElements[i].setAttribute('data-pswp-uid', i+1);
        galleryElements[i].onclick = onThumbnailsClick;
    }

    // Parse URL and open gallery if it contains #&pid=3&gid=1
    var hashData = photoswipeParseHash();
    if(hashData.pid && hashData.gid) {
        openPhotoSwipe( hashData.pid ,  galleryElements[ hashData.gid - 1 ], true, true );
    }
};

// execute above function
//initPhotoSwipeFromDOM('.my-gallery');

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
	
	//openPhotoSwipe();
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
				
				
				<c:forEach items="${project.imagesPromo}" var="imagePromo">
					  <div class="col-md-4">
					    <a href="<c:url value="/static/images/${imagePromo.folderName}/${imagePromo.fileName}"/>" class="thumbnail">
					      <p>Bla bla text</p>
					      <img src="<c:url value="/static/images/${imagePromo.folderName}/${imagePromo.fileName}"/>" class="img-responsive" alt="Promo picture" />
					      <!-- style="width:150px;height:150px" -->
					    </a>
					  </div>
					<br>
				</c:forEach>
			</div>
		</div>




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

		<button id="btn">Open PhotoSwipe</button>
		
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
</body>
</html>