package;

import flixel.*;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Portals extends FlxSprite
{
	final SPEED = -300;

	public var portalType:Int;

	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);
		makeGraphic(64, 104, FlxColor.RED);

		// velocity.x -= SPEED;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		velocity.x = SPEED;
		if (overlaps(PlayState.player))
		{
			Player.playerState = portalType;
		}
	}
}
