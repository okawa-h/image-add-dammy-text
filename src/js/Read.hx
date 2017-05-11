package ;

import js.Browser.window as Window;
import js.Browser.document as Document;
import js.html.Blob;
import js.html.DragEvent;
import js.html.Event;
import js.html.FileReader;
import js.html.InputElement;
import js.html.ProgressEvent;

class Read {

	private static var _readElm : InputElement;

	/* =======================================================================
		Constractar
	========================================================================== */
	public static function init():Void {

		_readElm = cast Document.querySelector('input[name="read-file"]');
		Window.addEventListener('drop',onDrop);
		Window.addEventListener('dragenter',onEnter);
		Window.addEventListener('dragover',onOver);
		_readElm.addEventListener('change',onChange);
		Document.getElementById('button').addEventListener('click',_readElm.click);

	}

	/* =======================================================================
		Read File
	========================================================================== */
	private static function readFile(file:Blob):Void {

		var fileReader : FileReader = new FileReader();
		fileReader.onload = function(event:ProgressEvent):Void {

			Main.onRead(fileReader.result);

		};

		fileReader.readAsDataURL(file);

	}

	/* =======================================================================
		On Change
	========================================================================== */
	private static function onChange(event:Event):Void {

		readFile(_readElm.files[0]);

	}

	/* =======================================================================
		On Drop
	========================================================================== */
	private static function onDrop(event:DragEvent):Bool {

		cancel(event);
		readFile(event.dataTransfer.files[0]);
		return false;

	}

	/* =======================================================================
		On Enter
	========================================================================== */
	private static function onEnter(event:DragEvent):Bool {

		cancel(event);
		return false;

	}

	/* =======================================================================
		On Over
	========================================================================== */
	private static function onOver(event:DragEvent):Bool {

		cancel(event);
		return false;

	}

	/* =======================================================================
		Cancel
	========================================================================== */
	private static function cancel(event:DragEvent):Void {

		event.preventDefault();
		event.stopPropagation();

	}

}