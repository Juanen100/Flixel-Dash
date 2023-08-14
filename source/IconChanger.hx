package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class IconChanger extends NewFlxState
{
	var bg:BG;
	var otherBlackThing:FlxSprite;

	var redButton:FlxSprite;
	var whiteButton:FlxSprite;
	var blackButton:FlxSprite;
	var greenButton:FlxSprite;
	var blueButton:FlxSprite;
	var yellowButton:FlxSprite;

	var player:FlxSprite;

	override public function create():Void
	{
		FlxG.mouse.visible = true;
		FlxG.mouse.useSystemCursor = true;

		bg = new BG(0, 0, Paths.image("bgs/game_bg_01_001-hd"), 0x287dff, X, 0, 0, false);
		bg.screenCenter();
		// bg.velocity.set(-150, 0);
		add(bg);

		otherBlackThing = new FlxSprite(135, 455).makeGraphic(1012, 120, FlxColor.BLACK);
		otherBlackThing.alpha = 0.6;
		otherBlackThing.scrollFactor.set();
		add(otherBlackThing);

		redButton = new FlxSprite(155, 485).makeGraphic(64, 64, FlxColor.RED);
		redButton.scrollFactor.set();
		add(redButton);

		whiteButton = new FlxSprite(255, 485).makeGraphic(64, 64, FlxColor.WHITE);
		whiteButton.scrollFactor.set();
		add(whiteButton);

		blackButton = new FlxSprite(355, 485).makeGraphic(64, 64, FlxColor.BLACK);
		blackButton.scrollFactor.set();
		add(blackButton);

		greenButton = new FlxSprite(455, 485).makeGraphic(64, 64, FlxColor.GREEN);
		greenButton.scrollFactor.set();
		add(greenButton);

		blueButton = new FlxSprite(555, 485).makeGraphic(64, 64, FlxColor.BLUE);
		blueButton.scrollFactor.set();
		add(blueButton);

		yellowButton = new FlxSprite(655, 485).makeGraphic(64, 64, FlxColor.YELLOW);
		yellowButton.scrollFactor.set();
		add(yellowButton);

		player = new FlxSprite(565, 170).loadGraphic(Paths.image("modes/cube"));
		player.scale.set(2, 2);
		player.updateHitbox();
		if (FlxG.save.data.playerColor != null)
			player.color = FlxG.save.data.playerColor;
		add(player);

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		if (FlxG.mouse.overlaps(redButton))
		{
			if (FlxG.mouse.justPressed)
			{
				FlxG.save.data.playerColor = FlxColor.RED;
				player.color = FlxG.save.data.playerColor;
			}
		}

		if (FlxG.mouse.overlaps(whiteButton))
		{
			if (FlxG.mouse.justPressed)
			{
				FlxG.save.data.playerColor = FlxColor.WHITE;
				player.color = FlxG.save.data.playerColor;
			}
		}

		if (FlxG.mouse.overlaps(blackButton))
		{
			if (FlxG.mouse.justPressed)
			{
				FlxG.save.data.playerColor = FlxColor.BLACK;
				player.color = FlxG.save.data.playerColor;
			}
		}

		if (FlxG.mouse.overlaps(greenButton))
		{
			if (FlxG.mouse.justPressed)
			{
				FlxG.save.data.playerColor = FlxColor.GREEN;
				player.color = FlxG.save.data.playerColor;
			}
		}

		if (FlxG.mouse.overlaps(blueButton))
		{
			if (FlxG.mouse.justPressed)
			{
				FlxG.save.data.playerColor = FlxColor.BLUE;
				player.color = FlxG.save.data.playerColor;
			}
		}

		if (FlxG.mouse.overlaps(greenButton))
		{
			if (FlxG.mouse.justPressed)
			{
				FlxG.save.data.playerColor = FlxColor.GREEN;
				player.color = FlxG.save.data.playerColor;
			}
		}

		if (FlxG.mouse.overlaps(yellowButton))
		{
			if (FlxG.mouse.justPressed)
			{
				FlxG.save.data.playerColor = FlxColor.YELLOW;
				player.color = FlxG.save.data.playerColor;
			}
		}

		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(new MainMenu());
		}

		super.update(elapsed);
	}
}
