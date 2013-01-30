/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.edit.*;

/*
*	Keep information about how to change a text box;
*/
class learnmath.mathml.edit.text.SelectText{
	
	var textNode:XMLNode;
	var isSelection = false;

	public function SelectText(_textNode:XMLNode){
		textNode = _textNode;
	}
	
	public function getBeginSelection(){
		var box = textNode.attributes["box"];
		if(box.selectionStart<box.selectionEnd){
			return box.selectionStart;
		}else{
			return box.selectionEnd;
		}
	}
	
	public function getEndSelection(){
		var box = textNode.attributes["box"];
		if(box.selectionStart<box.selectionEnd){
			return box.selectionEnd;
		}else{
			return box.selectionStart;
		}
	}

	function selectBefore(selection:Boolean, index:Number){
		var box = textNode.attributes["box"];
		if(!selection){
			resetSelection();
			return;
		}else{
			if(!isSelection){
				isSelection = true;
				box.selectionStart = index;
			}
		}
	}

	function selectAfter(selection:Boolean, index:Number){
		var box = textNode.attributes["box"];
		if(selection){
			box.selectionEnd = index;
		}else{
			resetSelection();
		}
	}
	
	function resetSelection(){
		var box = textNode.attributes["box"];
		box.selectionStart = 0;
		box.selectionEnd = 0;
		isSelection = false;
	}
	
}