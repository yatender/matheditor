/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.*;
import learnmath.mathml.edit.*;
import learnmath.mathml.edit.types.*;
import learnmath.mathml.edit.text.*;
import learnmath.mathml.edit.operators.*;
import learnmath.mathml.edit.style.*;


/*
*	Keep information about how to change a text box;
*/
class learnmath.mathml.edit.types.EditTextManager implements EditManager{
	
	var textNode:XMLNode;
	var sT:SelectText;
	var cM:CursorManager;
	var text:String;
	
	
	public function EditTextManager(_textNode:XMLNode){
		textNode = _textNode;
		text = textNode.childNodes[0].nodeValue;
		sT = new SelectText(_textNode);
		cM = new CursorManager(_textNode);
	}
	
	function drawCursor(graph:MovieClip){
		cM.drawCursor(graph);
	}
	
	function clearCursor(graph:MovieClip){
		cM.clearCursor(graph);
	}
	
	public function addCharToCurrentPosition(c:String){
		var newText = textNode.childNodes[0].nodeValue;
		if(newText!=text){
			text = textNode.childNodes[0].nodeValue;
			sT = new SelectText(textNode);
			cM = new CursorManager(textNode);			
		}
		if(text=="..."){
			cM.leftString = c;
			text = c;
		}else{
			if(sT.getBeginSelection()==sT.getEndSelection()){
				text = text.substring(0, cM.getIndex()) + c +  text.substring(cM.getIndex());
				cM.leftString = cM.leftString + c;
			}else{
				text = text.substring(0, sT.getBeginSelection()) + c +  text.substring(sT.getEndSelection());
				cM.leftString = text.substring(0, sT.getBeginSelection()) + c;
			}
		}
		updateNode();
		sT.resetSelection();
	}
	
	public function updateNode(){
		if(text==""){
			text="...";
		}
		textNode.childNodes[0].nodeValue = text;
		textNode.attributes["box"].text = text;
	}
	
	public function deleteRight(xml:XML):XMLNode{
		if(text=="..."){
			return;
		}else{
			if(sT.isSelection){
				text = text.substring(0, sT.getBeginSelection()) +  text.substring(sT.getEndSelection());
				cM.leftString = text.substring(0, sT.getBeginSelection());
			}else{
				if(cM.getIndex()<text.length){
					text = text.substring(0, cM.getIndex()) + text.substring(cM.getIndex()+1);
				}
			}
		}
		updateNode();
		sT.resetSelection();
		return null;
	}
	
	
	public function deleteLeft(xml:XML):XMLNode{
		if(text=="..."){
			return;
		}else{
			if(sT.isSelection){
				text = text.substring(0, sT.getBeginSelection()) +  text.substring(sT.getEndSelection());
				cM.leftString = text.substring(0, sT.getBeginSelection());
			}else{
				if(cM.getIndex()>0){
					text = text.substring(0, cM.getIndex()-1) + text.substring(cM.getIndex());
					cM.leftString = cM.leftString.substring(0, cM.getIndex()-1);
				}
			}
		}
		updateNode();
		sT.resetSelection();
		return null;
	}

	public function goBegin(selection:Boolean):XMLNode{
		sT.selectBefore(selection, cM.getIndex());
		cM.leftString = "";
		sT.selectAfter(selection, cM.getIndex());
		return null;
	}

	public function goEnd(selection:Boolean):XMLNode{
		sT.selectBefore(selection, cM.getIndex());
		cM.leftString = text;
		sT.selectAfter(selection, cM.getIndex());
		return null;
	}

	public function goLeft(selection:Boolean):XMLNode{
		sT.selectBefore(selection, cM.getIndex());
		if(cM.getIndex()>0){
			cM.leftString = text.substring(0, cM.getIndex()-1);
		}
		sT.selectAfter(selection, cM.getIndex());
		return null;
	}

	public function goRight(selection:Boolean):XMLNode{
		sT.selectBefore(selection, cM.getIndex());
		if(text.length>cM.getIndex()){
			cM.leftString = text.substring(0, cM.getIndex()+1);
		}
		sT.selectAfter(selection, cM.getIndex());
		return null;
	}

	public function goUp(selection:Boolean):XMLNode{
		if(textNode.parentNode.nodeName!=null){
			return(textNode);
		}
		return null;
	}

	public function goDown(selection:Boolean):XMLNode{
		return null;
	}
	
	public function insertOperator(xml:XML, operator:Number):XMLNode{
		if((operator>=Constant.BCHAR_01 & operator<=Constant.LCHAR_32)){
			addCharToCurrentPosition(CharOperator.getChar(operator));
			return textNode.childNodes[0];
		}
		return OperatorManager.callInsertOperatorToText(operator, xml, textNode, cM.leftString);
	}

	
	public function changeStyle(style:Style){
		CustomStyleManager.changeStyleForNode(textNode, style);
	}
	
}