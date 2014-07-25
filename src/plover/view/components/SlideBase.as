package plover.view.components
{
import flash.display.BitmapData;

import mx.containers.Canvas;

import plover.model.slides.SlideCarriage;

import spark.components.Image;

public class SlideBase extends Canvas
{
    public var bottomImage:Image;
    public var topImage:Image;

    public function SlideBase()
    {
        this.mouseEnabled = false;
        this.mouseChildren = false;
    }

    public function get slideData():SlideCarriage
    {
        return data as SlideCarriage
    }


    public function get selectedIndex():int
    {
        return data.selectedIndex;
    }

    public function set selectedIndex( value:int ):void
    {
        const bm1:BitmapData = bottomImage.bitmapData;
        const bm2:BitmapData = topImage.bitmapData;

        bottomImage.source = slideData.selectedItem;
        topImage.source = slideData.getItemAt( value + 1 );

        bm1.dispose();
        bm2.dispose();

    }

    public function  set topAlpha( value:Number ):void
    {
        topImage.alpha = value;
    }

    //  private var _data:SlideCarriage;

    /*   [Bindable]
     public function get data():SlideCarriage
     {
     return _data;
     }

     public function set data( value:SlideCarriage ):void
     {
     _data = value;

     }*/
}
}
