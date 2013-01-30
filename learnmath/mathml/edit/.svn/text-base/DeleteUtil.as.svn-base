/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.edit.*;
import learnmath.mathml.edit.types.*;
import learnmath.mathml.edit.style.*;
import learnmath.mathml.edit.operators.*;


/*
*	Keep information about what box is selected; For each box it is instance of 
*   Edit Manager and a Cursor Manager.
*/
class learnmath.mathml.edit.DeleteUtil{
	
	public static function deleteGarbage(xml:XML, currentNode:XMLNode){
		//search for mrow with one child
		//var search:Boolean = true;
		//do{
		//	var mrow:XMLNode = getMrowWithOneChildMrow(xml.childNodes[0].childNodes);
		//	if(mrow!=null){
		//		var parent:XMLNode = mrow.parentNode;
		//		var child:XMLNode = mrow.childNodes[0];
		//		parent.insertBefore(child, mrow);
		//		mrow.removeNode();
		//	}else{
		//		search = false;
		//	}
		//}while(search);
		
		for(var i=0; i<xml.childNodes.length; i++){
			mergeMTextNearMText(xml.childNodes[i]);
		}
	}
	
	public static function mergeMTextNearMText(child:XMLNode){
		if(child.nodeName=="mrow" | 
		   child.nodeName=="merror" | 
		   child.nodeName=="mfenced" | 
		   child.nodeName=="msqrt" | 
		   child.nodeName=="mphantom"){
			var deletedNodes = new Array();
			for(var i=0; i<child.childNodes.length; i++){
				var n1 = child.childNodes[i];
				var n2 = child.childNodes[i+1];
				if(n1!=null & n2!=null){
					if(n1.nodeName=="mtext" & n2.nodeName=="mtext"){
						// TODO the style must be diferent
						if(CustomStyleManager.hasSameStyle(n1, n2)){
							var t1 = n1.childNodes[0].nodeValue;
							var t2 = n2.childNodes[0].nodeValue;
							if(t1=="..."){ t1 = "";}
							if(t2=="..."){ t2 = "";}
							t2 = t1 + t2;
							if(t2==""){ t2 = "...";}
							n2.childNodes[0].nodeValue = t2;
							deletedNodes[deletedNodes.length] = n1;
						}
					}
				}
			}
			
			if(deletedNodes.length>0){
				for(var i=0; i<deletedNodes.length; i++){
					deletedNodes[i].removeNode();
				}
			}
		}
		
		for(var i=0; i<child.childNodes.length; i++){
			mergeMTextNearMText(child.childNodes[i]);
		}
	}
	
	public static function getMrowWithOneChildMrow(children:Array):XMLNode{
		if(children==null){
			return null;
		}
		for(var i=0; i<children.length; i++){
			var n = children[i];
			if(n.nodeName=='mrow' & n.childNodes.length==1 & n.childNodes[0].nodeName=="mrow"){
				return n;
			}

			var s = getMrowWithOneChildMrow(n.childNodes);
			if(s!=null) return s;
		}
	}
	
	
}