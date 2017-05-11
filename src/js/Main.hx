package ;

import js.Browser.document as Document;

class Main {

	/* =======================================================================
		Constractor
	========================================================================== */
	public static function main():Void {

		Document.addEventListener('DOMContentLoaded',function() {
			Read.init();
		});

	}

	/* =======================================================================
		On Read
	========================================================================== */
	public static function onRead(src:String):Void {

		Document.getElementById('image').innerHTML = '<img src="${src}">';
		DummyImage.generate(src);

	}

	/* =======================================================================
		On Create Image
	========================================================================== */
	public static function onCreateImage(src:String):Void {

		Document.getElementById('data').innerHTML = '<img src="${src}">';

	}

}
