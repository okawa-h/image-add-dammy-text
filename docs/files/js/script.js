// Generated by Haxe 3.4.2
(function () { "use strict";
var DummyImage = function() { };
DummyImage.generate = function(src) {
	var image = new Image();
	image.onload = function() {
		var width = image.width;
		var height = image.height;
		var canvas = window.document.createElement("canvas");
		canvas.width = Math.floor(width);
		canvas.height = Math.floor(height);
		var ctx = canvas.getContext("2d",null);
		ctx.drawImage(image,0,0);
		var boxW = width * .25;
		var boxH = height * .12;
		var x = width - boxW - 10;
		var y = height - boxH - 10;
		ctx.beginPath();
		ctx.fillStyle = "#ff00ff";
		ctx.fillRect(x,y,boxW,boxH);
		ctx.fillStyle = "#ffffff";
		ctx.font = Math.floor(boxH * .6) + "px bold";
		ctx.textAlign = "center";
		ctx.textBaseline = "middle";
		ctx.fillText("ダミー",x + boxW * .5,y + boxH * .5,boxW);
		Main.onCreateImage(canvas.toDataURL());
	};
	image.src = src;
};
var Main = function() { };
Main.main = function() {
	window.document.addEventListener("DOMContentLoaded",function() {
		Read.init();
	});
};
Main.onRead = function(src) {
	window.document.getElementById("image").innerHTML = "<img src=\"" + src + "\">";
	DummyImage.generate(src);
};
Main.onCreateImage = function(src) {
	window.document.getElementById("data").innerHTML = "<img src=\"" + src + "\">";
};
var Read = function() { };
Read.init = function() {
	Read._readElm = window.document.querySelector("input[name=\"read-file\"]");
	window.addEventListener("drop",Read.onDrop);
	window.addEventListener("dragenter",Read.onEnter);
	window.addEventListener("dragover",Read.onOver);
	Read._readElm.addEventListener("change",Read.onChange);
	window.document.getElementById("button").addEventListener("click",($_=Read._readElm,$bind($_,$_.click)));
};
Read.readFile = function(file) {
	var fileReader = new FileReader();
	fileReader.onload = function(event) {
		Main.onRead(fileReader.result);
	};
	fileReader.readAsDataURL(file);
};
Read.onChange = function(event) {
	Read.readFile(Read._readElm.files[0]);
};
Read.onDrop = function(event) {
	Read.cancel(event);
	Read.readFile(event.dataTransfer.files[0]);
	return false;
};
Read.onEnter = function(event) {
	Read.cancel(event);
	return false;
};
Read.onOver = function(event) {
	Read.cancel(event);
	return false;
};
Read.cancel = function(event) {
	event.preventDefault();
	event.stopPropagation();
};
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
DummyImage.TEXT = "ダミー";
DummyImage.FONT_COLOR = "#ffffff";
DummyImage.DUMMY_COLOR = "#ff00ff";
Main.main();
})();
