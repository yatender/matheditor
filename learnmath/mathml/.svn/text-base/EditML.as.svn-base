/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.util.*;
import learnmath.mathml.edit.*;
import learnmath.mathml.edit.input.*;
import learnmath.mathml.*;
import learnmath.mathml.edit.style.*;
import flash.geom.*;


class learnmath.mathml.EditML{
	
	
	var formulaIndex:Number = 0;
	var listOfXml:Array;
	var listOfMathML:Array;
	static var uniqueId:Number = 0;
	var pannels:Array;
	

	var parentMovie:MovieClip;
	var _defaultStyle:Style;
	var startPoint:Point;
	
	static var selectBox:SelectBox;
	static var keyboardManager:KeyboardManager;
	static var mouseManager:MouseManager;
	var needReDraw:Boolean = true;
	var displayMathML:DisplayMathML;
	
	public function EditML(xml:String, defaultStyle:Style){
		pannels = new Array();
		_defaultStyle = defaultStyle.getCopy();
		
		loadXmls(xml);
		
		setCurrentFormula(0);
		displayMathML = new DisplayMathML(listOfXml);
	}
	

	public function loadNewXML(xml:String, defaultStyle:Style){
		_defaultStyle = defaultStyle.getCopy();
		uniqueId = 1;
		if(selectBox!=null){
			selectBox.clearSelection();
			selectBox.clearCursor(listOfMathML[formulaIndex].dE.mc);
			mouseManager.overText.attributes["over"] = null;
			mouseManager.overText = null;
		}
		for(var i=0; i<pannels.length; i++){
			pannels[i].removeMovieClip();
		}
		pannels = new Array();
		listOfXml = new Array();
		listOfMathML = new Array();
		
		loadXmls(xml);
		setCurrentFormula(0);
		displayMathML = new DisplayMathML(listOfXml);
		needReDraw = true;
	}

	public function initGraph(graph:MovieClip, start:Point){
		parentMovie = graph;
		startPoint = start;
	}
	

	public function drawCurrentFormula(style:Style){
		drawFormula(formulaIndex, style);
	}

	
	public function drawFormula(i:Number, style:Style){
		if(listOfMathML[i]!=null){
			listOfMathML[i].dE.clear();
		}
		
		var xml = listOfXml[i];
		listOfMathML[i] = new MathML(xml, startPoint);
		
		var x = listOfXml[i].childNodes[0].attributes["x"];
		var y = listOfXml[i].childNodes[0].attributes["y"];
		if(listOfXml[i].childNodes[0].childNodes[0]!=null){
			CustomStyleManager.setDefaultForNode(listOfXml[i].childNodes[0].childNodes[0], _defaultStyle);
		}
		listOfMathML[i].drawFormula(getDragablePannel(i, x, y), style);
	}

	
	function getDragablePannel(index:Number, x:Number, y:Number):MovieClip{
		if(pannels[index]!=null) return pannels[index];
		
		var mc = parentMovie.createEmptyMovieClip("mc"+ (uniqueId++), parentMovie.getNextHighestDepth());
		if(x & y){
			mc._x = x;
			mc._y = y;
		}else{
			mc._y = mc._y + (uniqueId-1)*30;
		}
		mc.node = listOfXml[index].childNodes[0];
		mc.node.attributes["x"] = mc._x;
		mc.node.attributes["y"] = mc._y;
		
		mc.onPress = function(){ 
			startDrag(this); 
		}
		mc.onRelease = function(){ 
			this.node.attributes["x"] = this._x;
			this.node.attributes["y"] = this._y;
			stopDrag(); 
		}
		
		pannels[index] = mc;
		return mc;
		
	}

	function loadXmls(xml:String){
		listOfXml = new Array();
		listOfMathML = new Array();
		if(xml==null | xml.length==0){
			loadXml(getNewFormula(_defaultStyle));
			return;
		}
		
		while(xml.indexOf("</m:math>")>-1){
			var endIndex = 	xml.indexOf("</m:math>") + 9;		
			var newFormula = xml.substring(0, endIndex);		

			loadXml(StringUtil.trim(newFormula));
			xml = xml.substring(endIndex);
		}
		
		xml = StringUtil.trim(xml);
		if(xml.length>10){
			loadXml(xml);
		}
	}
	
	function loadXml(xml:String){
		var _xmlML:XML = new XML()
		_xmlML.ignoreWhite=true;
		_xmlML.parseXML(xml);
		listOfXml[listOfXml.length] = _xmlML;
		drawFormula(listOfXml.length-1, _defaultStyle);
	}
	
	public function clear(defaultStyle:Style){
		_defaultStyle = defaultStyle.getCopy();
		var _xmlML = new XML();
		_xmlML.parseXML(getNewFormula(defaultStyle));
		
		listOfXml[formulaIndex] = _xmlML;
		setCurrentFormula(formulaIndex);
		
	}
	
	function setCurrentFormula(newIndex:Number){
		if(selectBox!=null){
			selectBox.clearSelection();
			selectBox.clearCursor(listOfMathML[formulaIndex].dE.mc);
			mouseManager.overText.attributes["over"] = null;
			mouseManager.overText = null;
		}
		formulaIndex = newIndex;
		selectBox = new SelectBox(listOfXml[formulaIndex]);
		keyboardManager = new KeyboardManager(selectBox);
		mouseManager = new MouseManager(selectBox, listOfXml[formulaIndex]);
		needReDraw = true;
	}

	public function createNewFormula(){
		loadXml(getNewFormula(_defaultStyle));
		setCurrentFormula(listOfXml.length-1);
	}

	public function processKey(Key){
		if(Key.isDown(Key.ENTER)){
			createNewFormula();
			needReDraw=true;
			return;
		}
		needReDraw = keyboardManager.processKey(Key);
	}
	
	public function insert(v:Number){
		selectBox.insert(v);
		needReDraw = true;
	}

	public function changeStyle(style:Style){
		selectBox.changeStyle(style)
		needReDraw = true;
	}
	
	public function moveCursor(graph:MovieClip, x:Number, y:Number){
	
		var mc = pannels[formulaIndex];
		
		var r:Rectangle = getRectangleForFormula(formulaIndex);
		var p:Point = new Point(x, y);

		if(r.containsPoint(p)){
			x = x - mc._x;
			y = y - mc._y;
			if(mouseManager.moveCursor(graph, x, y)){
				needReDraw = true;
			}
		}else{
			if(mouseManager.overText!=null){
				mouseManager.overText.attributes["over"] = null;
				mouseManager.overText = null;
				needReDraw = true;
			}
		}
	}
	
	public function clickEvent(graph:MovieClip, x:Number, y:Number){
		var p:Point = new Point(x, y);
		for(var i=0; i<pannels.length; i++){
			if(i==formulaIndex) continue;
			var r:Rectangle = getRectangleForFormula(i);
			if(r.containsPoint(p)){
				setCurrentFormula(i);
				needReDraw = true;
				break;
			}
		}
		
		if(mouseManager.clickEvent(graph, x, y)){
			needReDraw = true;
		}
	}
	
	function getRectangleForFormula(i:Number){
		var mc = pannels[i];
		var bounds = mc.getBounds(mc._parent);
		var r2:Rectangle = new Rectangle(bounds.xMin, bounds.yMin, bounds.xMax - bounds.xMin, bounds.yMax - bounds.yMin);
		return r2;
	}
	

	public function drawRectangles(){
		selectBox.drawRectangles(listOfMathML[formulaIndex].dE.mc);
	}

	public function drawCursor(){
		selectBox.drawCursor(listOfMathML[formulaIndex].dE.mc);
	}

	

	public function getMathMLString():String{
		return displayMathML.getText();
	}

	public function getSelectedLine():Number{
		return displayMathML.getLine();
	}
	
	public function getStyleForCurrentNode():Style{
		return selectBox.getStyleForCurrentNode();
	}
	
	function getNewFormula(style:Style){
		return '<m:math xmlns:m="http://www.w3.org/1998/Math/MathML"><mrow fontsize="'+style.size+'" fontfamily="'+style.font+'"><mtext>...</mtext></mrow></math>';
	}
}