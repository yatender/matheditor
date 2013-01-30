/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.*;
import learnmath.mathml.edit.*;
import learnmath.mathml.edit.types.*;
import learnmath.mathml.edit.style.*;
import learnmath.mathml.edit.operators.*;


/*
*	Keep information about what box is selected; For each box it is instance of 
*   Edit Manager and a Cursor Manager.
*/
class learnmath.mathml.edit.SelectBox{
	
	var xml:XML;
	var editManager:EditManager;
	var currentNode:XMLNode;
	
	function SelectBox(_xmlML:XML){
		xml = _xmlML;
		var textNodeSelected = selectFirstText(xml.childNodes);
		if(textNodeSelected!=null){
			init(textNodeSelected.childNodes[0]);
		}
	}
	
	public function init(node:XMLNode){
		if(node==null) return;
		
		trace(node.parentNode.nodeName);
		if(!verifyIsAlive(node)){
			node = selectFirstText(xml.childNodes);
		}
		if(currentNode!=null){
			currentNode.attributes["selected"]=false;
		}
		node.attributes["selected"]=true;
		if(node.attributes["manager"]!=null){
			editManager = node.attributes["manager"];
		}else{
			if(node.parentNode.nodeName=="mtext"){
				editManager = new EditTextManager(node.parentNode);
			}else if(node.nodeName=="mtext"){
				editManager = new EditMTextManager(node);
			}else if(node.nodeName=="mrow"){
				editManager = new EditMRowManager(node);
			}else if(node.nodeName=="mfrac"){
				editManager = new EditMFracManager(node);
			}else if(node.nodeName=="mfenced"){
				editManager = new EditMFencedManager(node);
			}else if(node.nodeName=="msqrt"){
				editManager = new EditMSqrtManager(node);
			}else if(node.nodeName=="mover"){
				editManager = new EditMOverManager(node);
			}else if(node.nodeName=="munder"){
				editManager = new EditMUnderManager(node);
			}else if(node.nodeName=="msup"){
				editManager = new EditMSupManager(node);
			}else if(node.nodeName=="mo"){
				editManager = new EditMoManager(node);
			}else{
				editManager = new EditMBoxManager(node);
			}
			node.attributes["manager"] = editManager;
		}
		currentNode = node;

	}
	
	public function clearSelection(){
		if(currentNode!=null){
			currentNode.attributes["selected"]=false;
		}
	}

	public function drawCursor(graph:MovieClip){
		editManager.drawCursor(graph);
	}

	public function clearCursor(graph:MovieClip){
		editManager.clearCursor(graph);
	}
	
	public function drawRectangles(graph:MovieClip){
		drawRectanglesRecursiv(xml.childNodes, graph);
	}
	

	public function drawRectanglesRecursiv(children:Array, graph:MovieClip){
		if(children==null){
			return;
		}
		for(var i=0; i<children.length; i++){
			if(children[i].nodeName=='mtext' | children[i].nodeName=='mo'){
				var box:Box = children[i].attributes["box"];
				if(children[i].attributes["over"]){
					DrawRectangle.drawOver(graph, box.finalBounds);
				}else{
					DrawRectangle.draw(graph, box.finalBounds);
				}
			}
			drawRectanglesRecursiv(children[i].childNodes, graph);
		}
	}

	
	function selectFirstText(children:Array):XMLNode{
		if(children==null){
			return null;
		}
		for(var i=0; i<children.length; i++){
			if(children[i].nodeName=='mtext'){
				return children[i];
			}

			var s = selectFirstText(children[i].childNodes);
			if(s!=null) return s;
		}
	}
	
	
	public function insert(operator:Number){
		if(operator>=Constant.BCHAR_01 & operator<=Constant.LCHAR_34){
			addCharToCurrentPosition(CharOperator.getChar(operator));
		}else{
			var newNode = editManager.insertOperator(xml, operator);
			init(newNode);
		}
	}
	
	public function addCharToCurrentPosition(c:String){
		if(currentNode.nodeName=="mtext"){
			init(currentNode.childNodes[0]);
		}else if(currentNode.nodeName!=null){
			//verify the next Sibling
			var next:XMLNode = currentNode.nextSibling;
			if(next!=null & next.nodeName=="mtext"){
				init(next.childNodes[0]);
			}else{
				if(currentNode.parentNode.nodeName=="math" | currentNode.parentNode.nodeName=="m:math") return;
				
				var newnode = OperatorManager.insertEndNode(xml, currentNode);
				init(newnode);
			}
		}
		editManager.addCharToCurrentPosition(c);
		DeleteUtil.deleteGarbage(xml);
	}
	
	public function deleteRight(){
		if(editManager instanceof EditTextManager){
			editManager.deleteRight(xml);
		}else{
			var nextNode = getNextText();
			editManager.deleteRight(xml);
			DeleteUtil.deleteGarbage(xml);
			init(nextNode);
		}
	}
	
	public function deleteLeft(){
		if(editManager instanceof EditTextManager){
			editManager.deleteLeft(xml);
		}else{
			var nextNode = getNextText();
			editManager.deleteLeft(xml);
			DeleteUtil.deleteGarbage(xml);
			init(nextNode);
		}
	}

	public function goBegin(selection:Boolean){
		var newNode = editManager.goBegin(selection);
		init(newNode);
	}

	public function goEnd(selection:Boolean){
		var newNode = editManager.goEnd(selection);
		init(newNode);
	}

	public function goLeft(selection:Boolean){
		if(editManager instanceof EditTextManager){
			var editM = EditTextManager(editManager);
			if(editM.cM.leftString.length==0){
				goTab(true);
			}
		}
		var newNode = editManager.goLeft(selection);
		init(newNode);
	}

	public function goRight(selection:Boolean){
		if(editManager instanceof EditTextManager){
			var editM = EditTextManager(editManager);
			if(editM.cM.leftString.length==editM.text.length){
				goTab(false);
			}
		}
		var newNode = editManager.goRight(selection);
		init(newNode);
	}

	public function goUp(selection:Boolean){
		if(currentNode.parentNode.nodeName=="math" | currentNode.parentNode.nodeName=="m:math") return;
		var newNode = editManager.goUp(selection);
		init(newNode);
	}

	public function goDown(selection:Boolean){
		var newNode = editManager.goDown(selection);
		init(newNode);
	}

	public function goTab(selection:Boolean){
		var newNode;
		if(!selection){
			newNode = getNextText();
		}else{
			newNode = getPrevText();
		}
		init(newNode);
	}
	
	function getNextText():XMLNode{
		var allTextArray:Array = new Array();
		getAllTextChildren(allTextArray, xml.childNodes);
		
		var isInText = editManager instanceof EditTextManager;
		if(isInText){
			var newNode = getNextTextNode(allTextArray, currentNode.parentNode);
			return newNode.childNodes[0];
		}
		return getNextTextNode(allTextArray, currentNode);
	}
	
	function getNextTextNode(list:Array, cNode:XMLNode):XMLNode{
		for(var i=0; i<list.length; i++){
			if(list[i]==cNode){
				if(i<(list.length-1)){
					return list[i+1];
				}else{
					return list[0];
				}
			}
		}
		return list[0];
	}

	function getPrevText():XMLNode{
		var allTextArray:Array = new Array();
		getAllTextChildren(allTextArray, xml.childNodes);
		var isInText = editManager instanceof EditTextManager;
		if(isInText){
			var newNode = getPrevTextNode(allTextArray, currentNode.parentNode);
			return newNode.childNodes[0];
		}
		return getPrevTextNode(allTextArray, currentNode);
	}
	
	function getPrevTextNode(list:Array, cNode:XMLNode):XMLNode{
		for(var i=0; i<list.length; i++){
			if(list[i]==cNode){
				if(i>0){
					return list[i-1];
				}else{
					return list[list.length-1];
				}
			}
		}
		return list[list.length-1];
	}

	function getAllTextChildren(list:Array, children:Array){
		for(var i=0; i<children.length; i++){
			if(children[i].nodeName=='mtext'){
				list[list.length] = children[i];
			}
			getAllTextChildren(list, children[i].childNodes);
		}
	}
	
	public function changeStyle(style:Style){
		var isInText = editManager instanceof EditTextManager;
		if(isInText & EditTextManager(editManager).text!="..." & EditTextManager(editManager).text!=""){
			
			if(CustomStyleManager.isStyleChanged(currentNode.parentNode, style)){
				// add a new text box
				var newNode = OperatorManager.addNewSiblingTextChild(xml, currentNode.parentNode);
				init(newNode);
			}
		}
		editManager.changeStyle(style);
	}
	
	function verifyIsAlive(node:XMLNode):Boolean{
		return hasChild(xml.childNodes, node);
		
	}
	
	function hasChild(children:Array, node:XMLNode){
		for(var i=0; i<children.length; i++){
			if(children[i]==node) return true;
			
			var ret = hasChild(children[i].childNodes, node);
			if(ret) return true;
		}
	}
	
	public function getStyleForCurrentNode():Style{
		return CustomStyleManager.getStyleForCurrentNode(currentNode);
	}
	

}