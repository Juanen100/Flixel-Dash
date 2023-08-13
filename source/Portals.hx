package;

import flixel.*;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Portals extends FlxSprite
{
	public static var SPEED:Int = -350;

	public var portalType:Int;

	public function new(x:Float = 0, y:Float = 0, color:FlxColor)
	{
		super(x, y);
		makeGraphic(64, 104, color);

		// velocity.x -= SPEED;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		velocity.x = SPEED;
		if (overlaps(PlayState.player) && portalType > 0)
		{
			Player.playerState = portalType;
		}
	}
}
