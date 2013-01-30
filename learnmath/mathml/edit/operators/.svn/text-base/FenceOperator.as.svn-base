/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.edit.operators.*;
import learnmath.mathml.*;

class learnmath.mathml.edit.operators.FenceOperator implements Operator{
	
	var _operator:Number;

	public function FenceOperator(operator:Number){
		_operator = operator;
	}
	
	public function addOperatorToText(xml:XML, node:XMLNode, leftString:String):XMLNode{
		// this need to be a mtext node
		if(node.nodeName=="mtext"){
			var parentOfMtext = node.parentNode;

			OperatorManager.splitTextNode(xml, node, leftString);
			
			var mfence:XMLNode = xml.createElement("mfenced");
			//mfence.attributes["linethickness"] = "1";
			
			addAttribute(mfence);
			var mtext1:XMLNode = xml.createElement("mtext");
			var tNode1:XMLNode = xml.createTextNode("...");
			mtext1.appendChild(tNode1);
			mfence.appendChild(mtext1);
			
			OperatorManager.insertSiblingNode(xml, node, mfence);
			OperatorManager.insertEndNode(xml, mfence);
			return tNode1;
		}
		return null;
	}

	public function replaceMRow(xml:XML, node:XMLNode):XMLNode{
		if(node.nodeName=="mrow" | node.nodeName=="msqrt"){
			var parentOfMtext = node.parentNode;
			var mfence:XMLNode = xml.createElement("mfenced");

			if(node.attributes["fontsize"]!=null){
				mfence.attributes["fontsize"] = node.attributes["fontsize"];
			}
			addAttribute(mfence);

			parentOfMtext.insertBefore(mfence, node);

			while(node.hasChildNodes()){
				mfence.appendChild(node.childNodes[0]);
			}

			node.removeNode();
			return mfence;
		}else if(node.nodeName=="mfenced"){
			return OperatorManager.changeToMRowNode(xml, node);
		}
		return null;
	}
	

	
	function addAttribute(mfence:XMLNode){
		if(_operator==Constant.FENCE_01){
		}else if(_operator==Constant.FENCE_02){
			mfence.attributes["open"] = "[";
			mfence.attributes["close"] = "]";
		}else if(_operator==Constant.FENCE_03){
			mfence.attributes["open"] = "{";
			mfence.attributes["close"] = "}";
		}else if(_operator==Constant.FENCE_04){
			mfence.attributes["open"] = "&langle;";
			mfence.attributes["close"] = "&rangle;";
		}else if(_operator==Constant.FENCE_05){
			mfence.attributes["open"] = "|";
			mfence.attributes["close"] = "|";
		}else if(_operator==Constant.FENCE_06){
			mfence.attributes["open"] = "&Verbar;";
			mfence.attributes["close"] = "&Verbar;";
		}else if(_operator==Constant.FENCE_07){
			mfence.attributes["open"] = "&lfloor;";
			mfence.attributes["close"] = "&rfloor;";
		}else if(_operator==Constant.FENCE_08){
			mfence.attributes["open"] = "&lceil;";
			mfence.attributes["close"] = "&rceil;";
		}else if(_operator==Constant.FENCE_09){
			mfence.attributes["open"] = "[";
			mfence.attributes["close"] = "[";
		}else if(_operator==Constant.FENCE_10){
			mfence.attributes["open"] = "]";
			mfence.attributes["close"] = "]";
		}else if(_operator==Constant.FENCE_11){
			mfence.attributes["open"] = "]";
			mfence.attributes["close"] = "[";
		}else if(_operator==Constant.FENCE_12){
			mfence.attributes["open"] = "[";
			mfence.attributes["close"] = ")";
		}else if(_operator==Constant.FENCE_13){
			mfence.attributes["open"] = "(";
			mfence.attributes["close"] = "]";
		}else if(_operator==Constant.FENCE_16){
			mfence.attributes["open"] = "(";
			mfence.attributes["close"] = "";
		}else if(_operator==Constant.FENCE_17){
			mfence.attributes["open"] = "";
			mfence.attributes["close"] = ")";
		}else if(_operator==Constant.FENCE_18){
			mfence.attributes["open"] = "[";
			mfence.attributes["close"] = "";
		}else if(_operator==Constant.FENCE_19){
			mfence.attributes["open"] = "";
			mfence.attributes["close"] = "]";
		}else if(_operator==Constant.FENCE_20){
			mfence.attributes["open"] = "{";
			mfence.attributes["close"] = "";
		}else if(_operator==Constant.FENCE_21){
			mfence.attributes["open"] = "";
			mfence.attributes["close"] = "}";
		}else if(_operator==Constant.FENCE_22){
			mfence.attributes["open"] = "&langle;";
			mfence.attributes["close"] = "";
		}else if(_operator==Constant.FENCE_23){
			mfence.attributes["open"] = "";
			mfence.attributes["close"] = "&rangle;";
		}else if(_operator==Constant.FENCE_24){
			mfence.attributes["open"] = "|";
			mfence.attributes["close"] = "";
		}else if(_operator==Constant.FENCE_25){
			mfence.attributes["open"] = "";
			mfence.attributes["close"] = "|";
		}else if(_operator==Constant.FENCE_26){
			mfence.attributes["open"] = "&Verbar;";
			mfence.attributes["close"] = "";
		}else if(_operator==Constant.FENCE_27){
			mfence.attributes["open"] = "";
			mfence.attributes["close"] = "&Verbar;";
		}else if(_operator==Constant.FENCE_28){
			mfence.attributes["open"] = "|";
			mfence.attributes["close"] = "&rangle;";
		}else if(_operator==Constant.FENCE_29){
			mfence.attributes["open"] = "&langle;";
			mfence.attributes["close"] = "|";
		}
	}

	public function replaceMOver(xml:XML, node:XMLNode):XMLNode{return null;}	
	public function replaceMUnder(xml:XML, node:XMLNode):XMLNode{return null;}	
	public function replaceMSup(xml:XML, node:XMLNode):XMLNode{return null;}

}