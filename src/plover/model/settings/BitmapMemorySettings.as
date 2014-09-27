package plover.model.settings
{
import flash.geom.Rectangle;

public class BitmapMemorySettings
{
    public var bitmapMemoryAllocation:uint = 300000000;
    public var maxBitmapWidth:Number = 1600;
    public var maxBitmapHeight:Number = 900;

    public function parse( json:Object ):void
    {
        bitmapMemoryAllocation = json.bitmapMemoryAllocation || bitmapMemoryAllocation;
        maxBitmapWidth = json.maxBitmapWidth || maxBitmapWidth;
        maxBitmapHeight = json.maxBitmapHeight || maxBitmapHeight

    }

    public function get maxRectangle():Rectangle
    {
        return new Rectangle(0,0, maxBitmapWidth, maxBitmapHeight);
    }
}
}
