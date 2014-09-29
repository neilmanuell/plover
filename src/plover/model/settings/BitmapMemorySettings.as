package plover.model.settings
{
import flash.geom.Rectangle;
import flash.net.SharedObject;

public class BitmapMemorySettings
{
    public function BitmapMemorySettings()
    {
        _so = SharedObject.getLocal( "BitmapMemorySettings" );

        if ( _so.data.lastUpdated == undefined )
        {
            bitmapMemoryAllocation = 299892736;
            maxBitmapWidth = 1600;
            maxBitmapHeight = 900;
            persist();
        }
        else{
            reset();
        }
    }
    private var _maxBitmapHeight:Number;
    private var _so:SharedObject;

    private var _bitmapMemoryAllocation:uint;

    [Bindable]
    public function get bitmapMemoryAllocation():uint
    {
        return  _bitmapMemoryAllocation;
    }

    public function set bitmapMemoryAllocation( value:uint ):void
    {
        _bitmapMemoryAllocation = value;
        bitmapMemoryAllocationString = Number(Math.floor( ((_bitmapMemoryAllocation / (1024 * 1024)) * 100) ) / 100).toFixed(2) + " MB";
    }

    private var _maxBitmapWidth:Number;

    [Bindable]
    public function get maxBitmapWidth():Number
    {
        return _maxBitmapWidth
    }

    public function set maxBitmapWidth(value:Number):void
    {
        _maxBitmapWidth = value
    }

    [Bindable]
    public function get maxBitmapHeight():Number
    {
        return _maxBitmapHeight
    }

    public function set maxBitmapHeight(value:Number):void
    {
        _maxBitmapHeight = value
    }

    private var _bitmapMemoryAllocationString:String;

    [Bindable]
    public function get bitmapMemoryAllocationString():String
    {
        return _bitmapMemoryAllocationString
    }

    public function set bitmapMemoryAllocationString(value:String):void
    {
        _bitmapMemoryAllocationString = value
    }

    public function get maxRectangle():Rectangle
    {
        return new Rectangle( 0, 0, _so.data.maxBitmapWidth, _so.data.maxBitmapHeight );
    }

    public function persist():void
    {
        _so.data.lastUpdated = new Date().getTime();
        _so.data.bitmapMemoryAllocation = _bitmapMemoryAllocation;
        _so.data.maxBitmapWidth = _maxBitmapWidth;
        _so.data.maxBitmapHeight = _maxBitmapHeight;
        _so.flush();
    }

    public function reset():void
    {
        bitmapMemoryAllocation = _so.data.bitmapMemoryAllocation;
        maxBitmapWidth = _so.data.maxBitmapWidth;
        maxBitmapHeight = _so.data.maxBitmapHeight

    }

}
}
