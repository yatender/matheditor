/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.edit.*;
import learnmath.mathml.edit.types.*;
import learnmath.mathml.edit.operators.*;
import learnmath.mathml.edit.style.*;


/*
*	Keep information about how to change a text box;
*/
class learnmath.mathml.edit.types.EditMTextManager extends EditMBoxManager{
	
	public function EditMTextManager(_textNode:XMLNode){
		super(_textNode);
	}
	
	public function insertOperator(xml:XML, operator:Number):XMLNode{
		return OperatorManager.callInsertOperatorToText(operator, xml, textNode);
	}
	
	public function deleteLeft(xml:XML):XMLNode{
		return deleteBox(xml);
	}
	
	public function deleteBox(xml:XML):XMLNode{
		var parent = textNode.parentNode;
		if(parent.childNodes.length>1 & (parent.nodeName=="mrow" | parent.nodeName=="mfenced" | parent.nodeName=="msqrt")){
			var	newNode = goRight(false);
			textNode.removeNode();
			if(newNode==null){
				newNode = parent.lastChild;
			}
			return newNode;
		}else if(parent.nodeName=="munderover"){
			var pos = getPosition(textNode);
			if(pos==0){
				textNode.childNodes[0].nodeValue="...";
				textNode.childNodes[0].attributes["manager"]=null;
			}else if(pos==1){
				var newParent:XMLNode = xml.createElement("mover");
				
				CustomStyleManager.copyStyle(parent, newParent);
				var pp = parent.parentNode;
				pp.insertBefore(newParent, parent);
				var child1 = parent.childNodes[0];
				var child2 = parent.childNodes[2];
				newParent.appendChild(child1);
				newParent.appendChild(child2);
				parent.removeNode();
			}else if(pos==2){
				var newParent:XMLNode = xml.createElement("munder");
				
				CustomStyleManager.copyStyle(parent, newParent);
				var pp = parent.parentNode;
				pp.insertBefore(newParent, parent);
				newParent.appendChild(parent.childNodes[0]);
				newParent.appendChild(parent.childNodes[1]);
				parent.removeNode();
			}
		}else if(parent.nodeName=="munder" | parent.nodeName=="mover" | parent.nodeName=="msub" | parent.nodeName=="msup"){
			var pos = getPosition(textNode);
			if(pos==0){
				textNode.childNodes[0].nodeValue="...";
				textNode.childNodes[0].attributes["manager"]=null;
			}else if(pos==1){
				var pp = parent.parentNode;
				pp.insertBefore(parent.childNodes[0], parent);
				parent.removeNode();
			}
		}else if(parent.nodeName=="msubsup"){
			var pos = getPosition(textNode);
			if(pos==0){
				textNode.childNodes[0].nodeValue="...";
				textNode.childNodes[0].attributes["manager"]=null;
			}else if(pos==1){
				var newParent:XMLNode = xml.createElement("msup");
				
				CustomStyleManager.copyStyle(parent, newParent);
				var pp = parent.parentNode;
				pp.insertBefore(newParent, parent);
				var child1 = parent.childNodes[0];
				var child2 = parent.childNodes[2];
				newParent.appendChild(child1);
				newParent.appendChild(child2);
				parent.removeNode();
			}else if(pos==2){
				var newParent:XMLNode = xml.createElement("msub");
				
				CustomStyleManager.copyStyle(parent, newParent);
				var pp = parent.parentNode;
				pp.insertBefore(newParent, parent);
				newParent.appendChild(parent.childNodes[0]);
				newParent.appendChild(parent.childNodes[1]);
				parent.removeNode();
			}
		}else{
			textNode.childNodes[0].nodeValue="...";
			textNode.childNodes[0].attributes["manager"]=null;
		}
	}
	
}