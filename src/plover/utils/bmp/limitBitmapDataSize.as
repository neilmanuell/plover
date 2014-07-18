package plover.utils.bmp
{
import flash.display.BitmapData;

public function limitBitmapDataSize( bmp:BitmapData, maxWidth:Number, maxHeight:Number ):BitmapData
{
    if ( bmp.width > maxWidth || bmp.height > maxHeight )
    {
        return resizeBitmapDataByEdges( bmp, maxWidth, maxHeight, true );
    }
    else
    {
        return bmp;
    }
}
}
