package plover.service.memory
{
import flash.display.BitmapData;
import flash.events.IEventDispatcher;
import flash.geom.Rectangle;

import plover.controller.events.PloverProgressEvent;
import plover.model.settings.BitmapMemorySettings;
import plover.utils.bmp.fitRectangle;
import plover.utils.bmp.limitBitmapDataSize;

public class BitmapMemoryModel
{
    public function BitmapMemoryModel( settings:BitmapMemorySettings, dispatcher:IEventDispatcher )
    {
        _settings = settings;
        _dispatcher = dispatcher;
    }
    private var _settings:BitmapMemorySettings;
    private var _dispatcher:IEventDispatcher;
    private var _calculatedSize:Rectangle;
    private var _actualTotal:Number = 0;

    public function flush():void
    {
        _calculatedSize = null;
        _actualTotal = 0;
    }

    public function resize( bmp:BitmapData, numbBmp:int ):BitmapData
    {
        if ( _calculatedSize == null )
        {
            calculateSize( new Rectangle( 0, 0, bmp.width, bmp.height ), numbBmp )
        }
        const out:BitmapData = limitBitmapDataSize( bmp, _calculatedSize.width, _calculatedSize.height );
        _actualTotal += calculateBitmapBytes( out.width, out.height );
        if ( _actualTotal > _settings.bitmapMemoryAllocation )
        {
            trace( "STOP" )
        }

        else
        {
            _dispatcher.dispatchEvent( new PloverProgressEvent( PloverProgressEvent.MEMORY_ALLOCATION_PROGRESS, _actualTotal, _settings.bitmapMemoryAllocation ) );
        }

        return out;

    }

    private function calculateTotalBitmapBytes( width:Number, height:Number, numbBmp:int ):Number
    {
        return (Math.max( 1, height * (width / 64) >> 0 ) * 256) * numbBmp;
    }

    private function calculateBitmapBytes( width:Number, height:Number ):Number
    {
        return (Math.max( 1, height * (width / 64) >> 0 ) * 256);
    }

    private function calculateSize( rect:Rectangle, numbBmp:int ):void
    {
        var limit:Rectangle = _settings.maxRectangle;

        do {
            _calculatedSize = fitRectangle( rect, limit.width, limit.height );
            var predictedTotal:Number = calculateTotalBitmapBytes( _calculatedSize.width, _calculatedSize.height, numbBmp )
            limit.width -= limit.width >> 2;
            limit.height -= limit.height >> 2;
        }
        while ( predictedTotal > _settings.bitmapMemoryAllocation );


    }
}
}
