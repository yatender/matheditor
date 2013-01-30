/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.edit.operators.*;
import learnmath.mathml.*;

class learnmath.mathml.edit.operators.DivisionOperator implements Operator{

	var _operator:Number;

	public function DivisionOperator(operator:Number){
		_operator = operator;
	}

	public function addOperatorToText(xml:XML, node:XMLNode, leftString:String):XMLNode{
		// this need to be a mtext node
		if(node.nodeName=="mtext"){
			var parentOfMtext = node.parentNode;

			OperatorManager.splitTextNode(xml, node, leftString);
			
			var mfrac:XMLNode = xml.createElement("mfrac");
			mfrac.attributes["linethickness"] = "2";
			if(_operator==Constant.DIVISION_02){
				mfrac.attributes["bevelled"] = "true";
			}
			var mtext1:XMLNode = xml.createElement("mtext");
			var mtext2:XMLNode = xml.createElement("mtext");
			var tNode1:XMLNode = xml.createTextNode("...");
			var tNode2:XMLNode = xml.createTextNode("...");
			mtext1.appendChild(tNode1);
			mtext2.appendChild(tNode2);
			mfrac.appendChild(mtext1);
			mfrac.appendChild(mtext2);
			
			OperatorManager.insertSiblingNode(xml, node, mfrac);
			OperatorManager.insertEndNode(xml, mfrac);
			return tNode1;
		}
	}

	public function replaceMRow(xml:XML, node:XMLNode):XMLNode{
		return null;
	}

	public function replaceMOver(xml:XML, node:XMLNode):XMLNode{return null;}	
	public function replaceMUnder(xml:XML, node:XMLNode):XMLNode{return null;}	
	public function replaceMSup(xml:XML, node:XMLNode):XMLNode{return null;}
	
}