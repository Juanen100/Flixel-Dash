package;

import flixel.*;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Player extends FlxSprite
{
	final GRAVITY:Int = 615;

	public static var playerState:Int = 0;
	public static var isMini:Bool = false;

	var inverted:Bool = false;

	public static var isDead:Bool = false;

	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);

		scale.set(0.85, 0.85);

		playerState = 0;

		if (FlxG.save.data.playerColor == null)
			color = FlxColor.WHITE;
		else
			color = FlxG.save.data.playerColor;

		acceleration.y = GRAVITY * 2.5;
	}

	override function update(elapsed:Float)
	{
		x = 340;

		switch (playerState)
		{
			case 0: // Cube
				loadGraphic(Paths.image("modes/cube"));
				updateHitbox();
				acceleration.y = GRAVITY * 2.2;
				if (FlxG.keys.pressed.SPACE && isTouching(FLOOR) || FlxG.mouse.pressed && isTouching(FLOOR))
				{
					velocity.y -= GRAVITY;
				}

				if (!isTouching(FLOOR))
				{
					angle += 3.75;
				}
				else
				{
					angle = 0;
				}
			case 1: // Inverse Cube
				loadGraphic(Paths.image("modes/cube"));
				updateHitbox();
				acceleration.y = GRAVITY * -2.2;
				if (FlxG.keys.pressed.SPACE && isTouching(CEILING) || FlxG.mouse.pressed && isTouching(CEILING))
				{
					velocity.y += GRAVITY;
				}

				if (!isTouching(CEILING))
				{
					angle += 3.75;
				}
				else
				{
					angle = 0;
				}
			case 2: // Ship
				loadGraphic(Paths.image("modes/ship"));
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
				loadGraphic(Paths.image("modes/wave"));
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
			case 4: // Ball
				loadGraphic(Paths.image("modes/cube"));
				updateHitbox();
				acceleration.y = 0;
				if (FlxG.keys.pressed.SPACE && !inverted || FlxG.mouse.pressed && !inverted)
				{
					velocity.y = -GRAVITY;
					if (isTouching(CEILING))
						inverted = true;
				}
				else if (FlxG.keys.pressed.SPACE && inverted || FlxG.mouse.pressed && inverted)
				{
					velocity.y = GRAVITY;
					if (isTouching(FLOOR))
						inverted = false;
				}
				angle += 6.75;
			default:
				loadGraphic(Paths.image("modes/cube"));
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
		}

		super.update(elapsed);
	}
}
