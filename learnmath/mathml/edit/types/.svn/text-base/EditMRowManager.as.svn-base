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
class learnmath.mathml.edit.types.EditMRowManager extends EditMBoxManager{
	
	public function EditMRowManager(_textNode:XMLNode){
		super(_textNode);
	}
	
	public function insertOperator(xml:XML, operator:Number):XMLNode{
		return OperatorManager.replaceMRow(operator, xml, textNode);
	}

}