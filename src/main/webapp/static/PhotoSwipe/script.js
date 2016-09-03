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

//		console.log("getSlideDimensions:717", slide.src)

		if (!slide.doGetSlideDimensions)
			return;

		var isPrefetch = (typeof photoSwipe == "undefined");

//		console.log("getSlideDimensions:722", isPrefetch, slide.src)


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
			// http://photoswipe.com/documentation/options.html
			var options = {
					// Start slide index. 0 is the first slide. Must be integer, not a string.
					index                 : ix,
					// Function should return an object with coordinates from which initial zoom-in animation will start (or zoom-out animation will end). Read more on site.
					getThumbBoundsFn      : getThumbBounds,
					// Delay until loading indicator is displayed
					loadingIndicatorDelay: 1000,
					// UI options:
					// Size of top & bottom bars in pixels,
					// "bottom" parameter can be 'auto' (will calculate height of caption)
					// option applies only when mouse is used, 
					// or width of screen is more than 1200px
					// 
					// (Also refer to `parseVerticalMargin` event)
					barsSize: {top:88, bottom:'auto'},  // default 44 and auto
					// Adds class pswp__ui--idle to pswp__ui element when mouse isn't moving for 4000ms
					// timeToIdle: 4000,
					// Same as above, but this timer applies when mouse leaves the window
					// timeToIdleOutside: 1000,
					// Delay until loading indicator is displayed
					// loadingIndicatorDelay: 1000,
					// Function builds caption markup
					/*
					addCaptionHTMLFn: function(item, captionEl, isFake) {
					    // item      - slide object
					    // captionEl - caption DOM element
					    // isFake    - true when content is added to fake caption container
					    //             (used to get size of next or previous caption)

					    if(!item.title) {
					        captionEl.children[0].innerHTML = '';
					        return false;
					    }
					    captionEl.children[0].innerHTML = item.title;
					    return true;
					},
					*/
					// Buttons/elements
					closeEl:true,
					captionEl: false,
					fullscreenEl: true,
					zoomEl: true,
					shareEl: false,
					counterEl: true,
					arrowEl: true,
					preloaderEl: true,
					// Tap on sliding area should close gallery
					tapToClose: false,
					// Tap should toggle visibility of controls
					tapToToggleControls: true,
					// Mouse click on image should close the gallery,
					// only when image is smaller than size of the viewport
					clickToCloseNonZoomable: true,
					// Element classes click on which should close the PhotoSwipe.
					// In HTML markup, class should always start with "pswp__", e.g.: "pswp__item", "pswp__caption".
					// 
					// "pswp__ui--over-close" class will be added to root element of UI when mouse is over one of these elements
					// By default it's used to highlight the close button.
					// closeElClasses: ['item', 'caption', 'zoom-wrap', 'ui', 'top-bar'], 
					// Separator for "1 of X" counter
					// indexIndicatorSep: ' / ',
					/*
					// Share buttons
					// 
					// Available variables for URL:
					// {{url}}             - url to current page
					// {{text}}            - title
					// {{image_url}}       - encoded image url
					// {{raw_image_url}}   - raw image url
					shareButtons: [
					    {id:'facebook', label:'Share on Facebook', url:'https://www.facebook.com/sharer/sharer.php?u={{url}}'},
					    {id:'twitter', label:'Tweet', url:'https://twitter.com/intent/tweet?text={{text}}&url={{url}}'},
					    {id:'pinterest', label:'Pin it', url:'http://www.pinterest.com/pin/create/button/?url={{url}}&media={{image_url}}&description={{text}}'},
					    {id:'download', label:'Download image', url:'{{raw_image_url}}', download:true}
					],
	                */
					/*
					// Next 3 functions return data for share links
					// 
					// functions are triggered after click on button that opens share modal,
					// which means that data should be about current (active) slide
					getImageURLForShare: function( shareButtonData ) {
					    // `shareButtonData` - object from shareButtons array
					    // 
					    // `pswp` is the gallery instance object,
					    // you should define it by yourself
					    // 
					    return pswp.currItem.src || '';
					},
					getPageURLForShare: function( shareButtonData ) {
					    return window.location.href;
					},
					getTextForShare: function( shareButtonData ) {
					    return pswp.currItem.title || '';
					},
					
					// Parse output of share links
					parseShareButtonOut: function(shareButtonData, shareButtonOut) {
					    // `shareButtonData` - object from shareButtons array
					    // `shareButtonOut` - raw string of share link element
					    return shareButtonOut;
					}
					 */
										
					// Other options:
					// Zoom+fade transition // If set to false: background opacity and image scale will be animated (image opacity is always 1). If set to true: root PhotoSwipe element opacity and image scale will be animated. To enable just opacity transition (without scale), do not define getThumbBoundsFn option.
					//showHideOpacity       : false,
					// Initial zoom-in transition duration in milliseconds. Set to 0 to disable. Besides this JS option, you need also to change transition duration in PhotoSwipe CSS file: -webkit-transition: opacity 333ms cubic-bezier(.4,0,.22,1); and transition: opacity 333ms cubic-bezier(.4,0,.22,1);
					// showAnimationDuration : 0, // default 333
					// The same as the previous option, just for closing (zoom-out) transition. After PhotoSwipe is opened pswp--open class will be added to the root element, you may use it to apply different transition duration in CSS.
					// hideAnimationDuration : 0, // default 333
					// Background (.pswp__bg) opacity. Should be a number from 0 to 1, e.g. 0.7. This style is defined via JS, not via CSS, as this value is used for a few gesture-based transitions.
					bgOpacity             : 0.92,
					// Spacing ratio between slides. For example, 0.12 will render as a 12% of sliding viewport width (rounded).
					spacing               : 0.12,
					// Allow swipe navigation to next/prev item when current item is zoomed. Option is always false on devices that don't have hardware touch support.
					allowPanToNext        : false,
					// Maximum zoom level when performing spread (zoom) gesture. 2 means that image can be zoomed 2x from original size. Try to avoid huge values here, as too big image may cause memory issues on mobile (especially on iOS).
					maxSpreadZoom         : 5, // default 2
					// Function should return zoom level to which image will be zoomed after double-tap gesture, or when user clicks on zoom icon, or mouse-click on image itself. If you return 1 image will be zoomed to its original size.
					getDoubleTapZoom      : function(isMouseClick, item) {
					    // isMouseClick          - true if mouse, false if double-tap
					    // item                  - slide object that is zoomed, usually current
					    // item.initialZoomLevel - initial scale ratio of image
					    //                         e.g. if viewport is 700px and image is 1400px,
					    //                              initialZoomLevel will be 0.5
					    if(isMouseClick) {
					        // is mouse click on image or zoom icon
					        // zoom to original
					        return 1;
					        // e.g. for 1400px image:
					        // 0.5 - zooms to 700px
					        // 2   - zooms to 2800px
					    } else {
					        // is double-tap
					        // zoom to original if initial zoom is less than 0.7x,
					        // otherwise to 3x (default 1.5), to make sure that double-tap gesture always zooms image
					        return item.initialZoomLevel < 0.7 ? 1 : 2;
					    }
					},
					// Loop slides when using swipe gesture. If set to true you'll be able to swipe from last to first image. Option is always false when there are less than 3 slides.
					loop                  : true,
					// Pinch to close gallery gesture. The gallery’s background will gradually fade out as the user zooms out. When the gesture is complete, the gallery will close.
					pinchToClose          : true,
					// Close gallery on page scroll. Option works just for devices without hardware touch support.
					closeOnVerticalDrag   : false,
					// Option allows you to predefine if mouse was used or not. Some PhotoSwipe feature depend on it, for example default UI left/right arrows will be displayed only after mouse is used. If set to false, PhotoSwipe will start detecting when mouse is used by itself, mouseUsed event triggers when mouse is found.
					//mouseUsed             : false,
					// esc keyboard key to close PhotoSwipe. Option can be changed dynamically (yourPhotoSwipeInstance.options.escKey = false;).
					escKey                : true,
					// Keyboard left or right arrow key navigation. Option can be changed dynamically (yourPhotoSwipeInstance.options.arrowKeys = false;).
					arrowKeys             : true,
					// If set to false disables history module (back button to close gallery, unique URL for each slide). You can also just exclude history.js module from your build.
					history               : false, // NB TODO NOT WORKING ATM EVEN IF TRUE, WON'T LOAD ANYTHING!!!!
					// Gallery unique ID. Used by History module when forming URL. For example, second picture of gallery with UID 1 will have URL: http://example.com/#&gid=1&pid=2.
					//galleryUID            : 0,
					// Enables custom IDs for each slide object that are used when forming URL. If option set set to true, slide objects must have pid (picture identifier) property that can be a string or an integer. For example:
					//galleryPIDs           : false,
	                // Error message when image was not loaded. %url% will be replaced by URL of image.
	                //errorMsg              : "<div class='pswp__error-msg'><a href='%url%' target='_blank'>The image</a> could not be loaded.</div>",
			        // Lazy loading of nearby slides based on direction of movement. Should be an array with two integers, first one - number of items to preload before current image, second one - after the current image. E.g. if you set it to [1,3], it'll load 1 image before the current, and 3 images after current. Values can not be less than 1.
	                preload               : [5, 5],
			        // String with name of class that will be added to root element of PhotoSwipe (.pswp). Can contain multiple classes separated by space.
	                //mainClass             : whatever,
			        // Function that should return total number of items in gallery. By default it returns length of slides array. Don't put very complex code here, function is executed very often.
	                //getNumItemsFn         : function(){},
			        // Will set focus on PhotoSwipe element after it's open.
			        //focus                 : true,
			        // Function should check if the element (el) is clickable. If it is – PhotoSwipe will not call preventDefault and click event will pass through. Function should be as light is possible, as it's executed multiple times on drag start and drag release.
	                //isClickableElement    : function(el) { return el.tagName === 'A'; },
					// Controls whether PhotoSwipe should expand to take up the entire viewport. If false, the PhotoSwipe element will take the size of the positioned parent of the template.
					//modal                 : true
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