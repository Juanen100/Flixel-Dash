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
			final spikeSpr = new Spike(spike.x, spike.y - 12191.7, "spike_01");
			spikesGroup.add(spikeSpr);
		}

		add(spikesGroup);
	}
}
