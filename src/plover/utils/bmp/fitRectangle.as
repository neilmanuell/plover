package plover.utils.bmp
{
import flash.geom.Rectangle;

public function fitRectangle( rect:Rectangle, maxWidth:int, maxHeight:int ):Rectangle
{

    if ( rect.width > maxWidth || rect.height > maxHeight )
    {
        var currentLongest:int = Math.max( rect.width, rect.height );
        var currentShortest:int = Math.min( rect.width, rect.height );
        var longestRatio:Number = maxWidth / currentLongest;
        var shortestRatio:Number = maxHeight / currentShortest;
        // first try longest side
        var newShortest:int = currentShortest * longestRatio;
        if ( newShortest <= maxHeight )
        {

            return new Rectangle( 0, 0, rect.width * longestRatio, rect.height * longestRatio );
        } else
        {
            return new Rectangle( 0, 0, rect.width * shortestRatio, rect.height * shortestRatio );
        }
    }
    else
    {
        return rect;
    }


}

}