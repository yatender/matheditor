/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.edit.*;
import learnmath.mathml.edit.types.*;
import learnmath.mathml.edit.operators.*;

/*
*	Keep information about how to change a text box;
*/
class learnmath.mathml.edit.types.EditMoManager extends EditMBoxManager{
	
	public function EditMoManager(_textNode:XMLNode){
		super(_textNode);
	}
	
	public function deleteBox(xml:XML):XMLNode{
		if(	textNode.parentNode.nodeName=="mover" | 
			textNode.parentNode.nodeName=="munder" |
			textNode.parentNode.nodeName=="munderover" |
			textNode.parentNode.nodeName=="msup" |
			textNode.parentNode.nodeName=="msubsup" |
			textNode.parentNode.nodeName=="sub"){
	
			var pos = getPosition(textNode);
			if(pos==1){
				var parent = textNode.parentNode;
				var pp = parent.parentNode;
				var text = parent.childNodes[0];
				pp.insertBefore(text, parent);
				parent.removeNode();
				return text;
			}
			return null;
		}else if(textNode.parentNode.nodeName=="munderover" |
			textNode.parentNode.nodeName=="msubsup"){
			return null;
		}
		return super.deleteBox(xml);
	}

}