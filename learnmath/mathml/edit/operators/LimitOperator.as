/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.edit.operators.*;
import learnmath.mathml.*;

class learnmath.mathml.edit.operators.LimitOperator implements Operator{

	var _operator:Number;

	public function LimitOperator(operator:Number){
		_operator = operator;
	}

	public function addOperatorToText(xml:XML, node:XMLNode, leftString:String):XMLNode{
		// this need to be a mtext node
		if(node.nodeName=="mtext"){
			var parentOfMtext = node.parentNode;

			OperatorManager.splitTextNode(xml, node, leftString);
			
			var munder:XMLNode = xml.createElement("munder");
			var o1:XMLNode	= xml.createElement("mo");
			var o2:XMLNode = xml.createElement("mtext");
			var o3:XMLNode = xml.createElement("mtext");
			var arrow:XMLNode = xml.createElement("mo");						
			var row1:XMLNode = xml.createElement("mrow");
			var row2:XMLNode = xml.createElement("mrow");
			var tNode1:XMLNode = xml.createTextNode("lim");
			var tNode3:XMLNode = xml.createTextNode("...");
			var tNode2:XMLNode = xml.createTextNode("...");
			var tNode4:XMLNode = xml.createTextNode("&rarr;");
						
			o1.appendChild(tNode1);
			row1.appendChild(o1);
			
			o2.appendChild(tNode2);
			o3.appendChild(tNode3);
			arrow.appendChild(tNode4);
			
			row2.appendChild(o2);
			row2.appendChild(arrow);
			row2.appendChild(o3);
			munder.appendChild(row1);
			munder.appendChild(row2);
												
			OperatorManager.insertSiblingNode(xml, node, munder);
			OperatorManager.insertEndNode(xml, munder);
			return tNode2;
		}
	}

	public function replaceMRow(xml:XML, node:XMLNode):XMLNode{
		return null;
	}

	public function replaceMOver(xml:XML, node:XMLNode):XMLNode{return null;}	
	public function replaceMUnder(xml:XML, node:XMLNode):XMLNode{return null;}	
	public function replaceMSup(xml:XML, node:XMLNode):XMLNode{return null;}
	
}