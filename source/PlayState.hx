package;

import flixel.*;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends NewFlxState
{
	var bg:BG;
	var ground:BG;
	var groundHit:FlxSprite;
	var ceiling:FlxSprite;

	var portal:Portals;

	public static var player:Player;

	override public function create()
	{
		FlxG.worldBounds.set(0, 0, FlxG.width, FlxG.height);

		bg = new BG(0, 0, Paths.image("bgs/game_bg_01_001-hd"), 0x287dff, X, 0, 0, false);
		add(bg);

		ground = new BG(0, 550, Paths.image("blocks/groundSquare_01_001-hd"), 0x0066ff, X, 0, 0, true);
		add(ground);

		groundHit = new FlxSprite(0, 550).makeGraphic(1920, 120, FlxColor.BLUE);
		groundHit.immovable = true;
		groundHit.visible = false;
		add(groundHit);

		ceiling = new FlxSprite(0, -118).makeGraphic(1920, 120, FlxColor.BLUE);
		ceiling.immovable = true;
		ceiling.visible = false;
		add(ceiling);

		player = new Player(0, 495.788);
		add(player);

		portal = new Portals(1920, 455, FlxColor.RED);
		portal.portalType = 3;
		add(portal);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		collide(player, groundHit);
		collide(player, ceiling);

		super.update(elapsed);
	}
}
