package;

import flixel.*;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends LevelState
{
	var bg:BG;
	var ground:BG;
	var groundHit:FlxSprite;
	var ceiling:FlxSprite;

	var portal:Portals;
	var spike:Spike;

	public static var songToPlay:String;
	public static var levelToLoad:String;

	public static var player:Player;

	override public function create()
	{
		Player.isDead = false;
		FlxG.sound.playMusic(Paths.music(songToPlay));
		FlxG.worldBounds.set(0, 0, FlxG.width, FlxG.height);

		bg = new BG(0, 0, Paths.image("bgs/game_bg_01_001-hd"), 0x287dff, X, 0, 0, false);
		bg.screenCenter();
		bg.velocity.set(-150, 0);
		add(bg);

		ground = new BG(0, 550, Paths.image("blocks/groundSquare_01_001-hd"), 0x0066ff, X, 0, 0, true);
		ground.velocity.set(-350, 0);
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

		createLevel();

		/*portal = new Portals(1920, 445, FlxColor.RED);
			portal.portalType = 3;
			// add(portal);

			spike = new Spike(2120, 492, "spike_01");
			add(spike); */

		super.create();
	}

	override public function update(elapsed:Float)
	{
		collide(player, groundHit);
		collide(player, ceiling);

		if (FlxG.overlap(player, spike) && !Player.isDead)
		{
			bg.velocity.set(0, 0);
			ground.velocity.set(0, 0);
			remove(player); // TODO: Explosion
			Player.isDead = true;
			wait(3);
			FlxG.switchState(new PlayState());
		}

		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(new MainMenu());
		}

		super.update(elapsed);
	}
}
