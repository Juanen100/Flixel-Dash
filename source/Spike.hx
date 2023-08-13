package;

import flixel.*;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Spike extends FlxSprite
{
	public static var SPEED:Int = -350;

	public function new(x:Float = 0, y:Float = 0, spikeType:String)
	{
		super(x, y);

		loadGraphic(Paths.image("spikes/" + spikeType));
		scale.set(0.115, 0.115);
		updateHitbox();
		width = 15;
		height = 45;
		offset.set(310, 280);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		velocity.x = SPEED;
	}
}
