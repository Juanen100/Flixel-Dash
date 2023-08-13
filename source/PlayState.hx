package;

import flixel.*;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends NewFlxState
{
	var ground:FlxSprite;
	var ceiling:FlxSprite;

	var portal:Portals;

	public static var player:Player;

	override public function create()
	{
		FlxG.worldBounds.set(0, 0, FlxG.width, FlxG.height);

		ground = new FlxSprite(0, 600).makeGraphic(1920, 120, FlxColor.BLUE);
		ground.immovable = true;
		add(ground);

		ceiling = new FlxSprite(0, -115).makeGraphic(1920, 120, FlxColor.BLUE);
		ceiling.immovable = true;
		add(ceiling);

		player = new Player(0, 536.188);
		add(player);

		portal = new Portals(1920, 475);
		portal.portalType = 4;
		add(portal);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		collide(player, ground);
		collide(player, ceiling);

		super.update(elapsed);
	}
}
