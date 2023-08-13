package;

import flixel.addons.display.FlxBackdrop;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;

class BG extends FlxBackdrop
{
	public var repeaterAxes:FlxAxes = XY;

	public function new(xAx:Float, yAx:Float, graphic:FlxGraphicAsset, colour:FlxColor, repeaterAxes = XY, spacingX = 0, spacingY = 0, ground:Bool)
	{
		super(graphic, repeaterAxes, spacingX, spacingY);
		x = xAx;
		y = yAx;

		color = colour;
		scrollFactor.set();
		velocity.set(-250, 0);
		scale.set(1.35, 1.35);
		updateHitbox();
		if (!ground)
			screenCenter();
	}
}
