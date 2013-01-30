/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.edit.operators.*;
import learnmath.mathml.*;

class learnmath.mathml.edit.operators.RadicalOperator implements Operator{

	var _operator:Number;

	public function RadicalOperator(operator:Number){
		_operator = operator;
	}

	public function addOperatorToText(xml:XML, node:XMLNode, leftString:String):XMLNode{
		// this need to be a mtext node
		if(node.nodeName=="mtext"){
			var parentOfMtext = node.parentNode;

			OperatorManager.splitTextNode(xml, node, leftString);
			
			if(_operator==Constant.RADICAL_02){
				return addRootElement(xml, node);
			}else{
				return addSqrtElement(xml, node);
			}
		}
	}

	public function replaceMRow(xml:XML, node:XMLNode):XMLNode{
		if(node.nodeName=="mrow" | node.nodeName=="mfenced"){
			var parentOfMtext = node.parentNode;
			var msqrt:XMLNode = xml.createElement("msqrt");

			if(node.attributes["fontsize"]!=null){
				msqrt.attributes["fontsize"] = node.attributes["fontsize"];
			}
			parentOfMtext.insertBefore(msqrt, node);

			while(node.hasChildNodes()){
				msqrt.appendChild(node.childNodes[0]);
			}

			node.removeNode();
			return msqrt;
		}else if(node.nodeName=="msqrt"){
			return OperatorManager.changeToMRowNode(xml, node);
		}
		return null;
	}

	function addSqrtElement(xml:XML, node:XMLNode):XMLNode{
			var msqrt:XMLNode = xml.createElement("msqrt");

			var mtext1:XMLNode = xml.createElement("mtext");
			var tNode1:XMLNode = xml.createTextNode("...");
			mtext1.appendChild(tNode1);
			msqrt.appendChild(mtext1);

			OperatorManager.insertSiblingNode(xml, node, msqrt);
			OperatorManager.insertEndNode(xml, msqrt);
			return tNode1;
	}
	
	function addRootElement(xml:XML, node:XMLNode):XMLNode{
			var mroot:XMLNode = xml.createElement("mroot");
			mroot.attributes["linethickness"] = "1";
			var mtext1:XMLNode = xml.createElement("mtext");
			var tNode1:XMLNode = xml.createTextNode("...");
			mtext1.appendChild(tNode1);
			mroot.appendChild(mtext1);
			var mtext2:XMLNode = xml.createElement("mtext");
			var tNode2:XMLNode = xml.createTextNode("...");
			mtext2.appendChild(tNode2);
			mroot.appendChild(mtext2);
			OperatorManager.insertSiblingNode(xml, node, mroot);
			OperatorManager.insertEndNode(xml, mroot);
			return tNode2;
	}

	public function replaceMOver(xml:XML, node:XMLNode):XMLNode{return null;}	
	public function replaceMUnder(xml:XML, node:XMLNode):XMLNode{return null;}	
	public function replaceMSup(xml:XML, node:XMLNode):XMLNode{return null;}
}