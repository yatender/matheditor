/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.edit.*;
import learnmath.mathml.edit.types.*;
import learnmath.mathml.edit.style.*;

/*
*	Keep information about how to change a box(mrow);
*/
class learnmath.mathml.edit.types.EditMBoxManager implements EditManager{
	
	var textNode:XMLNode;
	var cM:CursorManager;
	
	
	public function EditMBoxManager(_textNode:XMLNode){
		textNode = _textNode;
		cM = new CursorManager(_textNode);
	}
	
	function drawCursor(graph:MovieClip){
		cM.drawBoxCursor(graph);
	}
	
	function clearCursor(graph:MovieClip){
		cM.clearCursor(graph);
	}
	
	public function addCharToCurrentPosition(c:String){
	}
	
	public function deleteRight(xml:XML):XMLNode{
		return deleteBox(xml);
	}
	
	public function deleteLeft(xml:XML):XMLNode{
		return deleteBox(xml);
	}

	public function deleteBox(xml:XML):XMLNode{
		if(textNode.parentNode.nodeName=="mfrac"){
			return null;
		}
		if(textNode.parentNode.childNodes.length>1){		
			var	newNode = goRight(false);
			var parent = textNode.parentNode;
			textNode.removeNode();
			if(newNode==null){
				newNode = parent.lastChild;
			}
			return newNode;
		}
		return null;
	}

	public function goBegin(selection:Boolean):XMLNode{
		return(textNode.parentNode.firstChild);
	}

	public function goEnd(selection:Boolean):XMLNode{
		return(textNode.parentNode.lastChild);
	}

	public function goLeft(selection:Boolean):XMLNode{
		if(textNode.parentNode.nodeName=="mfrac"){
			if(textNode.parentNode.nodeName!=null){
				return(textNode.parentNode);
			}
		}
		return(textNode.previousSibling);
	}

	public function goRight(selection:Boolean):XMLNode{
		if(textNode.parentNode.nodeName=="mfrac"){
			if(textNode.firstChild!=null){
				return(textNode.firstChild);
			}
		}
		return(textNode.nextSibling);
	}

	public function goUp(selection:Boolean):XMLNode{
		if(textNode.parentNode.nodeName=="mfrac" ){
			var n = textNode.previousSibling
			if(n!=null){
				return(textNode.previousSibling);
			}
		}
		if(textNode.parentNode.nodeName!=null){
			return(textNode.parentNode);
		}
		return null;
	}

	public function goDown(selection:Boolean):XMLNode{
		if(textNode.parentNode.nodeName=="mfrac"){
			var n = textNode.nextSibling
			if(n!=null){
				return(textNode.nextSibling);
			}else{
				return(textNode.parentNode);
			}
		}
		if(textNode.firstChild!=null){
			return(textNode.firstChild);
		}
		return null;
	}
	
	public function insertOperator(xml:XML, operator:Number):XMLNode{
		return null;
	}

	
	public function changeStyle(style:Style){
		CustomStyleManager.changeStyleForNode(textNode, style);
	}
	
	public function getPosition(node:XMLNode):Number{
		var parent = node.parentNode;
		var pos = 0;
		for(var i=0; i<parent.childNodes.length; i++){
			if(parent.childNodes[i]==node){
				pos = i;
				break;
			}
		}
		return pos;
	}
	
}