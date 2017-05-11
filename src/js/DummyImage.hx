package ;

import js.Browser.document as Document;
import js.html.Image;
import js.html.CanvasElement;
import js.html.CanvasRenderingContext2D;

class DummyImage {

	private static inline var TEXT : String = 'ダミー';
	private static inline var FONT_COLOR  : String = '#ffffff';
	private static inline var DUMMY_COLOR : String = '#ff00ff';

	/* =======================================================================
		Generate
	========================================================================== */
	public static function generate(src:String):Void {

		var image : Image = new Image();
		image.onload = function() {

			var width  : Int = image.width;
			var height : Int = image.height;
			var canvas : CanvasElement = Document.createCanvasElement();
			canvas.width  = Math.floor(width);
			canvas.height = Math.floor(height);

			var ctx : CanvasRenderingContext2D = canvas.getContext2d();
			ctx.drawImage(image,0,0);

			var boxW : Float = width*.25;
			var boxH : Float = height*.12;
			var x    : Float = width - boxW - 10;
			var y    : Float = height - boxH - 10;
			ctx.beginPath();
			ctx.fillStyle = DUMMY_COLOR;
			ctx.fillRect(x,y,boxW,boxH);

			ctx.fillStyle    = FONT_COLOR;
			ctx.font         = Math.floor(boxH * .6) + 'px bold';
			ctx.textAlign    = 'center';
			ctx.textBaseline = 'middle';
			ctx.fillText(TEXT,x + boxW*.5,y + boxH*.5,boxW);
			Main.onCreateImage(canvas.toDataURL());

		};
		image.src = src;

	}

}