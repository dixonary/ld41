package;

import flixel.FlxG;
import flixel.FlxState;
import openfl.display.StageQuality;

class PlayState extends FlxState
{
    override public function create():Void
    {
        super.create();

        add(new Court(FlxG.width, cast(FlxG.height*3/4, Int) ));
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }
}
