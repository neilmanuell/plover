package plover.utils.bmp
{
import flash.display.BitmapData;

public function resizeBitmapDataByEdges( bitmapData:BitmapData, longestEdge:int, shortestEdge:int, dispose:Boolean = false ):BitmapData
{
    var currentLongest:int = Math.max( bitmapData.width, bitmapData.height );
    var currentShortest:int = Math.min( bitmapData.width, bitmapData.height );
    var longestRatio:Number = longestEdge / currentLongest;
    var shortestRatio:Number = shortestEdge / currentShortest;
    // first try longest side
    var newShortest:int = currentShortest * longestRatio;
    if ( newShortest <= shortestEdge )
    {
        return resizeBitmapDataByRatio( bitmapData, longestRatio, dispose );
    } else
    {
        return resizeBitmapDataByRatio( bitmapData, shortestRatio, dispose )
    }
}

}