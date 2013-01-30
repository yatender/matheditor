interface learnmath.mathml.edit.operators.Operator{

	public function addOperatorToText(xml:XML, node:XMLNode, leftString:String):XMLNode;
	public function replaceMRow(xml:XML, node:XMLNode):XMLNode;
	public function replaceMOver(xml:XML, node:XMLNode):XMLNode;
	public function replaceMUnder(xml:XML, node:XMLNode):XMLNode;
	public function replaceMSup(xml:XML, node:XMLNode):XMLNode;

}