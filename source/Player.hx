package;

import flixel.*;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Player extends FlxSprite
{
	final GRAVITY:Int = 615;

	public static var playerState:Int = 0;
	public static var isMini:Bool = false;

	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);

		playerState = 0;

		color = FlxColor.WHITE;

		acceleration.y = GRAVITY * 2.2;
	}

	override function update(elapsed:Float)
	{
		x = 340;

		switch (playerState)
		{
			case 0: // Cube
				loadGraphic(Paths.image("cube"));
				updateHitbox();
				acceleration.y = GRAVITY * 2.2;
				if (FlxG.keys.pressed.SPACE && isTouching(FLOOR) || FlxG.mouse.pressed && isTouching(FLOOR))
				{
					velocity.y -= GRAVITY;
				}

				if (!isTouching(FLOOR))
				{
					angle += 3.25;
				}
				else
				{
					angle = 0;
				}
			case 1: // Inverse Cube
				loadGraphic(Paths.image("cube"));
				updateHitbox();
				acceleration.y = GRAVITY * -2.2;
				if (FlxG.keys.pressed.SPACE && isTouching(CEILING) || FlxG.mouse.pressed && isTouching(CEILING))
				{
					velocity.y += GRAVITY;
				}

				if (!isTouching(CEILING))
				{
					angle += 3.25;
				}
				else
				{
					angle = 0;
				}
			case 2: // Ship
				loadGraphic(Paths.image("ship"));
				updateHitbox();
				acceleration.y = 0;
				if (FlxG.keys.pressed.SPACE || FlxG.mouse.pressed)
				{
					acceleration.y -= GRAVITY;
				}
				else
				{
					acceleration.y += GRAVITY;
				}
			case 3: // Wave
				loadGraphic(Paths.image("wave"));
				updateHitbox();
				acceleration.y = 0;
				if (FlxG.keys.pressed.SPACE || FlxG.mouse.pressed)
				{
					velocity.y = -GRAVITY;
				}
				else
				{
					velocity.y = GRAVITY;
				}

				// Doesn't convince me but whatev
				if (velocity.y == -GRAVITY && !isTouching(FLOOR) && !isTouching(CEILING))
				{
					angle = -45;
				}
				else if (velocity.y == GRAVITY && !isTouching(FLOOR) && !isTouching(CEILING))
				{
					angle = 45;
				}
				else
				{
					angle = 0;
				}
		}

		super.update(elapsed);
	}
}
