/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.edit.operators.*;
import learnmath.mathml.*;

class learnmath.mathml.edit.operators.MatrixOperator implements Operator{

	var _operator:Number;

	public function MatrixOperator(operator:Number){
		_operator = operator;
	}
	
	public function addOperatorToText(xml:XML, node:XMLNode, leftString:String):XMLNode{
		// this need to be a mtext node
		if(node.nodeName=="mtext"){
			var parentOfMtext = node.parentNode;
			OperatorManager.splitTextNode(xml, node, leftString);
			
			var mrow:XMLNode = xml.createElement("mrow");
			var mtable:XMLNode = xml.createElement("mtable");
			
			var nbRows = getNbRows();
			for(var i=0; i<nbRows; i++){
				var mtr:XMLNode = xml.createElement("mtr");
				
				var nbCol = getNbColumns();
				for(var j=0; j<nbCol; j++){
					var mtd:XMLNode = xml.createElement("mtd");
					var mtext:XMLNode = xml.createElement("mtext");
					var tNode:XMLNode = xml.createTextNode("...");
					mtext.appendChild(tNode);
					
					mtd.appendChild(mtext);
					mtr.appendChild(mtd);
				}
				mtable.appendChild(mtr);
			}
			mrow.appendChild(mtable);

			OperatorManager.insertSiblingNode(xml, node, mrow);
			var nextNode = OperatorManager.insertEndNode(xml, mrow);
			return nextNode;
		}
	}
	
	

	function getNbRows():Number{
		if(_operator==Constant.MX_01 | _operator==Constant.MX_04){
			return 1;
		}else if(_operator==Constant.MX_02 | _operator==Constant.MX_03){
			return 2;
		}else if(_operator==Constant.MX_05 | _operator==Constant.MX_06){
			return 3;
		}else if(_operator==Constant.MX_09 ){
			return int(_root.setmatrixMovieInst.nbRows.value);
		}
		return 2;
	}
	
	function getNbColumns():Number{
		if(_operator==Constant.MX_01 | _operator==Constant.MX_03){
			return 2;
		}else if(_operator==Constant.MX_02 | _operator==Constant.MX_05){
			return 1;
		}else if(_operator==Constant.MX_04 | _operator==Constant.MX_06){
			return 3;
		}else if(_operator==Constant.MX_09 ){
			return int(_root.setmatrixMovieInst.nbColumns.value);
		}
		return 2;
	}

	public function replaceMRow(xml:XML, node:XMLNode):XMLNode{
		return null;
	}
	
	public function replaceMOver(xml:XML, node:XMLNode):XMLNode{
		return null;
	}
	
	public function replaceMUnder(xml:XML, node:XMLNode):XMLNode{
		return null;
	}
		
	public function replaceMSup(xml:XML, node:XMLNode):XMLNode{
		return null;
	}
	

}