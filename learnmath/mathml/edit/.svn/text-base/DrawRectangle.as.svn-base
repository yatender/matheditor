/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.geom.*;

class learnmath.mathml.edit.DrawRectangle{
	
	
	static function drawOver(graph:MovieClip, bounds:Rectangle){
		graph.lineStyle(0, 0xff0000, 100);
		graph.dashTo(bounds.x, bounds.y, bounds.x + bounds.width, bounds.y, 2, 3);
		graph.dashTo(bounds.x + bounds.width, bounds.y, bounds.x + bounds.width, bounds.y + bounds.height, 2, 3);
		graph.dashTo(bounds.x + bounds.width, bounds.y + bounds.height, bounds.x, bounds.y + bounds.height, 2, 3);
		graph.dashTo(bounds.x, bounds.y + bounds.height, bounds.x, bounds.y, 2, 3);

	}

	static function draw(graph:MovieClip, bounds:Rectangle){
		graph.lineStyle(0, 0x000000, 60);
		graph.dashTo(bounds.x, bounds.y, bounds.x + bounds.width, bounds.y, 2, 3);
		graph.dashTo(bounds.x + bounds.width, bounds.y, bounds.x + bounds.width, bounds.y + bounds.height, 2, 3);
		graph.dashTo(bounds.x + bounds.width, bounds.y + bounds.height, bounds.x, bounds.y + bounds.height, 2, 3);
		graph.dashTo(bounds.x, bounds.y + bounds.height, bounds.x, bounds.y, 2, 3);

	}
	
	static function drawF(graph:MovieClip, x1, y1, x2, y2){
		graph.lineStyle(1, 0x000000, 100);
		draw2(graph, x1, y1, x2, y2);
	}

	static function draw2(graph:MovieClip, x1, y1, x2, y2){
		graph.moveTo(x1, y1);
		graph.lineTo(x2, y1);
		graph.lineTo(x2, y2);
		graph.lineTo(x1, y2);
		graph.lineTo(x1, y1);

	}

}