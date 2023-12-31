package;

import flixel.FlxGame;
import openfl.display.FPS;
import openfl.display.Sprite;

class Main extends Sprite
{
	public static var fps:FPS;

	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, MainMenu));

		#if debug
		fps = new FPS(10, 3, 0xFFFFFF);
		addChild(fps);
		#end
	}
}
