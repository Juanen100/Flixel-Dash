package;

import flixel.FlxG;
import flixel.FlxState;

class NewFlxState extends FlxState
{
	public function print(content:Dynamic)
	{
		trace(content);
	}

	public function addWatch(object:Dynamic, string:String)
	{
		FlxG.watch.add(object, string);
	}

	public function collide(object, theOtherObject)
	{
		FlxG.collide(object, theOtherObject);
	}

	public function wait(theTime:Float)
	{
		#if sys
		Sys.sleep(theTime);
		#end
	}
}
