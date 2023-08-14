package;

import flixel.FlxG;

class LevelSelector extends NewFlxState
{
	var bg:BG;
	var ground:BG;

	override function create()
	{
		bg = new BG(0, 0, Paths.image("bgs/game_bg_01_001-hd"), 0x287dff, X, 0, 0, false);
		bg.screenCenter();
		add(bg);

		ground = new BG(0, 550, Paths.image("blocks/groundSquare_01_001-hd"), 0x0066ff, X, 0, 0, true);
		add(ground);

		super.create();
	}

	override function update(elapsed:Float)
	{
		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(new MainMenu());
		}

		if (FlxG.keys.justPressed.ENTER)
		{
			PlayState.songToPlay = "StereoMadness";
			PlayState.levelToLoad = "Stereo Madness";
			FlxG.switchState(new PlayState());
		}
		super.update(elapsed);
	}
}
