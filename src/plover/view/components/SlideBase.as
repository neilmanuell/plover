package plover.view.components
{
import mx.containers.Canvas;

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


    public function get selectedIndex():int
    {
        return data.selectedIndex;
    }

    public function set selectedIndex( value:int ):void
    {
        bottomImage.source = data.selectedItem;
        topImage.source = data.getItemAt( value + 1 );

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
