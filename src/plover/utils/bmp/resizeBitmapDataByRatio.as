package plover.utils.bmp
{
import flash.display.BitmapData;
import flash.geom.Matrix;

public function resizeBitmapDataByRatio( bitmapData:BitmapData, ratio:Number, dispose:Boolean = false ):BitmapData
{

    var matrix:Matrix = new Matrix();
    matrix.scale( ratio, ratio );

    var bmpData:BitmapData = new BitmapData( bitmapData.width * ratio,
                    bitmapData.height * ratio,
            true, 0x000000 );

    bmpData.draw( bitmapData, matrix, null, null, null, true );

    if ( dispose )bitmapData.dispose();

    return bmpData;
}

}