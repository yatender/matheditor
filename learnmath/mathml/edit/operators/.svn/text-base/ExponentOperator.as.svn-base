/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.edit.operators.*;
import learnmath.mathml.*;

class learnmath.mathml.edit.operators.ExponentOperator implements Operator{

	var _operator:Number;

	public function ExponentOperator(operator:Number){
		_operator = operator;
	}

	public function addOperatorToText(xml:XML, node:XMLNode, leftString:String):XMLNode{
		// this need to be a mtext node
		if(node.nodeName=="mtext"){
			var parentOfMtext = node.parentNode;

			OperatorManager.splitTextNode(xml, node, leftString);
			
			if(_operator==Constant.EXPONENT_01){
				return createSupExp(xml, node);
			}else if(_operator==Constant.EXPONENT_02){
				return createSubExp(xml, node);
			}else if(_operator==Constant.EXPONENT_03){
				return createSupSubExp(xml, node);
			}else if(_operator==Constant.EXPONENT_04){
				return createOverExp(xml, node);
			}else if(_operator==Constant.EXPONENT_05){
				return createUnderExp(xml, node);
			}else if(_operator==Constant.EXPONENT_06){
				return createUnderOverExp(xml, node);
			}

		}
	}
	
	public function replaceMRow(xml:XML, node:XMLNode):XMLNode{
		return null;
	}

	function createUnderOverExp(xml:XML, node:XMLNode):XMLNode{
			var munderover:XMLNode = xml.createElement("munderover");
			var o:XMLNode = xml.createElement("mtext");
			var tNode1:XMLNode = xml.createTextNode("...");
			o.appendChild(tNode1);
			munderover.appendChild(o);
			
			var mtext2:XMLNode = xml.createElement("mtext");
			var tNode2:XMLNode = xml.createTextNode("...");
			mtext2.appendChild(tNode2);
			munderover.appendChild(mtext2);
			
			var mtext3:XMLNode = xml.createElement("mtext");
			var tNode3:XMLNode = xml.createTextNode("...");
			mtext3.appendChild(tNode3);
			munderover.appendChild(mtext3);
			
			OperatorManager.insertSiblingNode(xml, node, munderover);
			OperatorManager.insertEndNode(xml, munderover);
			return tNode1;
	}

	function createUnderExp(xml:XML, node:XMLNode):XMLNode{
			var munder:XMLNode = xml.createElement("munder");
			var mtext1:XMLNode = xml.createElement("mtext");
			var tNode1:XMLNode = xml.createTextNode("...");
			mtext1.appendChild(tNode1);
			munder.appendChild(mtext1);
			
			var mtext2:XMLNode = xml.createElement("mtext");
			var tNode2:XMLNode = xml.createTextNode("...");
			mtext2.appendChild(tNode2);
			munder.appendChild(mtext2);
			
			OperatorManager.insertSiblingNode(xml, node, munder);
			OperatorManager.insertEndNode(xml, munder);
			return tNode1;
	}

	function createOverExp(xml:XML, node:XMLNode):XMLNode{
			var mover:XMLNode = xml.createElement("mover");
			var mtext1:XMLNode = xml.createElement("mtext");
			var tNode1:XMLNode = xml.createTextNode("...");
			mtext1.appendChild(tNode1);
			mover.appendChild(mtext1);
			
			var mtext2:XMLNode = xml.createElement("mtext");
			var tNode2:XMLNode = xml.createTextNode("...");
			mtext2.appendChild(tNode2);
			mover.appendChild(mtext2);
			
			OperatorManager.insertSiblingNode(xml, node, mover);
			OperatorManager.insertEndNode(xml, mover);
			return tNode1;
	}

	function createSupSubExp(xml:XML, node:XMLNode):XMLNode{
			var msubsup:XMLNode = xml.createElement("msubsup");
			var mtext1:XMLNode = xml.createElement("mtext");
			var tNode1:XMLNode = xml.createTextNode("...");
			mtext1.appendChild(tNode1);
			msubsup.appendChild(mtext1);
			
			var mtext2:XMLNode = xml.createElement("mtext");
			var tNode2:XMLNode = xml.createTextNode("...");
			mtext2.appendChild(tNode2);
			msubsup.appendChild(mtext2);
			
			var mtext3:XMLNode = xml.createElement("mtext");
			var tNode3:XMLNode = xml.createTextNode("...");
			mtext3.appendChild(tNode3);
			msubsup.appendChild(mtext3);

			OperatorManager.insertSiblingNode(xml, node, msubsup);
			OperatorManager.insertEndNode(xml, msubsup);
			return tNode1;
	}

	function createSupExp(xml:XML, node:XMLNode):XMLNode{
			var msup:XMLNode = xml.createElement("msup");
			var mtext1:XMLNode = xml.createElement("mtext");
			var tNode1:XMLNode = xml.createTextNode("...");
			mtext1.appendChild(tNode1);
			msup.appendChild(mtext1);
			
			var mtext2:XMLNode = xml.createElement("mtext");
			var tNode2:XMLNode = xml.createTextNode("...");
			mtext2.appendChild(tNode2);
			msup.appendChild(mtext2);
			
			OperatorManager.insertSiblingNode(xml, node, msup);
			OperatorManager.insertEndNode(xml, msup);
			return tNode1;
	}

	function createSubExp(xml:XML, node:XMLNode):XMLNode{
			var msub:XMLNode = xml.createElement("msub");
			var mtext1:XMLNode = xml.createElement("mtext");
			var tNode1:XMLNode = xml.createTextNode("...");
			mtext1.appendChild(tNode1);
			msub.appendChild(mtext1);
			
			var mtext2:XMLNode = xml.createElement("mtext");
			var tNode2:XMLNode = xml.createTextNode("...");
			mtext2.appendChild(tNode2);
			msub.appendChild(mtext2);
			
			OperatorManager.insertSiblingNode(xml, node, msub);
			OperatorManager.insertEndNode(xml, msub);
			return tNode1;
	}
	public function replaceMOver(xml:XML, node:XMLNode):XMLNode{return null;}	
	public function replaceMUnder(xml:XML, node:XMLNode):XMLNode{return null;}	
	public function replaceMSup(xml:XML, node:XMLNode):XMLNode{return null;}
	
}