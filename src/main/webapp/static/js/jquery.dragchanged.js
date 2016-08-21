/** simple jQuery plugin that fires an event named "drag:changed" and a boolean
 *	parameter of isDragging when drag on the passed elements begins or ends
 */
(function($) {

	$.fn.dragchanged = function(){

		var notDragging = { isDragging: false, isDown: false, offsetX: -1, offsetY: -1 };

		return this.each(function(){

			var $this = $(this);
			var dragState = $.extend({}, notDragging);

			function fireEvent() {

				$this.trigger("drag:changed", dragState.isDragging);
			}

			$this.on("mousedown", function(evt){

				dragState.isDown  = true;
				dragState.offsetX = evt.offsetX;
				dragState.offsetY = evt.offsetY;
			});

			$this.on("mousemove", function(evt){

				if (!dragState.isDown)
					return;

				if (dragState.offsetX == evt.offsetX && dragState.offsetY == evt.offsetY)
					return;

				var wasDragging = dragState.isDragging;

				dragState.isDragging = ((dragState.offsetX != evt.offsetX) || (dragState.offsetY == evt.offsetY));

				if (dragState.isDragging != wasDragging)
					fireEvent();
			});

			$this.on("mouseup", function(evt){

				var wasDragging = dragState.isDragging;

				dragState = $.extend({}, notDragging);

				if (wasDragging)
					fireEvent();
			});
		}); // return this.each(function(){
	}; // $.fn.dragchanged = function(){
}(jQuery));