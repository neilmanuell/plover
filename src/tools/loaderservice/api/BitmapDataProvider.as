package tools.loaderservice.api
{
import flash.display.BitmapData;

public interface BitmapDataProvider
{
    function getBitmapData( name:String, unload:Boolean = false ):BitmapData
}
}
