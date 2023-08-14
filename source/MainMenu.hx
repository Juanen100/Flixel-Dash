package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSave;

class MainMenu extends NewFlxState
{
	var bg:BG;
	var ground:BG;

	var logo:FlxSprite;

	// Buttons
	var play:FlxSprite;
	var icons:FlxSprite;
	var editor:FlxSprite;

	override function create()
	{
		FlxG.mouse.visible = true;
		FlxG.mouse.useSystemCursor = true;
		FlxG.sound.playMusic(Paths.music("menuLoop"));

		bg = new BG(0, 0, Paths.image("bgs/game_bg_01_001-hd"), 0x287dff, X, 0, 0, false);
		bg.screenCenter();
		bg.velocity.set(-150, 0);
		add(bg);

		ground = new BG(0, 550, Paths.image("blocks/groundSquare_01_001-hd"), 0x0066ff, X, 0, 0, true);
		ground.velocity.set(-350, 0);
		add(ground);

		logo = new FlxSprite(260, 75).loadGraphic(Paths.image("menu/logo"));
		logo.scale.set(0.75, 0.75);
		logo.updateHitbox();
		add(logo);

		play = new FlxSprite(520, 246).loadGraphic(Paths.image('menu/play'));
		play.updateHitbox();
		add(play);

		editor = new FlxSprite(850, 280).loadGraphic(Paths.image('menu/editor'));
		editor.updateHitbox();
		add(editor);

		icons = new FlxSprite(241, 279).loadGraphic(Paths.image('menu/icons'));
		icons.updateHitbox();
		add(icons);

		super.create();
	}

	override function update(elapsed:Float)
	{
		if (FlxG.mouse.overlaps(play))
		{
			if (FlxG.mouse.pressed)
			{
				play.scale.set(1.2, 1.2);

				/*PlayState.songToPlay = "StereoMadness";
					PlayState.levelToLoad = "Stereo Madness"; */
				FlxG.switchState(new LevelSelector());
			}
			else
			{
				play.scale.set(1, 1);
			}
		}

		if (FlxG.mouse.overlaps(editor))
		{
			if (FlxG.mouse.pressed)
			{
				editor.scale.set(1.2, 1.2);

				print("Not even the editor but whatev, not gonna make an online server anyways");
			}
			else
			{
				editor.scale.set(1, 1);
			}
		}

		if (FlxG.mouse.overlaps(icons))
		{
			if (FlxG.mouse.pressed)
			{
				icons.scale.set(1.2, 1.2);

				FlxG.switchState(new IconChanger());
			}
			else
			{
				icons.scale.set(1, 1);
			}
		}

		// addWatch(logo, 'x');
		super.update(elapsed);
	}
}
