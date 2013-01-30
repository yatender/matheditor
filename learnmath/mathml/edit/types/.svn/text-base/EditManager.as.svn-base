/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;

interface learnmath.mathml.edit.types.EditManager{
	
	public function drawCursor(graph:MovieClip);
	public function clearCursor(graph:MovieClip);
	
	public function addCharToCurrentPosition(c:String);
	public function deleteRight(xml:XML):XMLNode;
	public function deleteLeft(xml:XML):XMLNode;
	public function goBegin(selection:Boolean):XMLNode;
	public function goEnd(selection:Boolean):XMLNode;
	public function goLeft(selection:Boolean):XMLNode;
	public function goRight(selection:Boolean):XMLNode;
	public function goUp(selection:Boolean):XMLNode;
	public function goDown(selection:Boolean):XMLNode;
	public function insertOperator(xml:XML, operator:Number):XMLNode;

	public function changeStyle(style:Style);
}