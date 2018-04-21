package;

import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
using flixel.util.FlxSpriteUtil;

class Court extends FlxSprite {

    public function new(W:Int, H:Int) {
        super();

        makeGraphic(W,H, 0xff000000);
        antialiasing = false;
        pixelPerfectRender=true;


        // how much margin?
        var topSpace = 0.3;
        var margin = 0.05;
        var taper = 0.25;

        var widthProp = (0.5-taper-margin)/(0.5-margin);

        var points = [];
        points.push(new FlxPoint(margin+taper, margin+topSpace));
        points.push(new FlxPoint(1-margin-taper, margin+topSpace));
        points.push(new FlxPoint(1-margin, 1-margin));
        points.push(new FlxPoint(margin, 1-margin));

        points = points.map(function(p){ p.x *= W; p.y *= H; return p; });

        drawPolygon(points, FlxColor.GREEN, {color:FlxColor.WHITE,thickness:1,
            pixelHinting:false});

        drawLine((margin+taper+0.1*widthProp)*W, 
                 (margin+topSpace)*H,
                 (margin+0.1)*W,
                 (1-margin)*H, 
                 {color:FlxColor.WHITE,thickness:1,pixelHinting:false}); 

        drawLine((1-margin-taper-0.1*widthProp)*W, 
                 (margin+topSpace)*H,
                 (1-margin-0.1)*W,
                 (1-margin)*H, 
                 {color:FlxColor.WHITE,thickness:1,pixelHinting:false}); 

        var top = topSpace+margin;
        var bottom = 1-margin;
        // top = 0.35
        // bottom = 0.95
        // middle = 0.65
        var middle = 0.5 + topSpace/2;
        function taperDist(d):Float {
            if(d < top) return 0;
            if(d > bottom) return 0;
            
            return (1-(d-top)/(bottom-top));
        }

        // horizontal lines
        for(l in [0.6, 0.46, 0.75]) {
            
        drawLine((margin+taperDist(l)*taper+(1-taperDist(l)*widthProp)*0.1)*W-2,
                 l*H,
                 (1-margin-taperDist(l)*taper-(1-taperDist(l)*widthProp)*0.1)*W+1,
                 l*H,
                 {color:FlxColor.WHITE,thickness:1,pixelHinting:false});
        }

    }

}
