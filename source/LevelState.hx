package;

import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledObjectLayer;
import flixel.group.FlxGroup.FlxTypedGroup;

class LevelState extends NewFlxState
{
	function createLevel()
	{
		final map = new TiledMap("assets/data/" + PlayState.levelToLoad + "/lvl.tmx");
		final spikeLayers:TiledObjectLayer = cast(map.getLayer("Spikes"));
		final spikesGroup = new FlxTypedGroup<Spike>();

		trace(spikeLayers, "trace");
		for (spike in spikeLayers.objects)
		{
			final spikeSpr = new Spike(spike.x, spike.y + 492, "spike_01");
			spikeSpr.flipY = spike.flippedVertically;
			spikesGroup.add(spikeSpr);
		}

		add(spikesGroup);
	}
}
