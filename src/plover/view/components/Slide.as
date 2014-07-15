package plover.view.components
{
import plover.model.slides.SlideCarriage;

import spark.components.Image;

public class Slide extends Image
{
    public function Slide()
    {
        this.mouseEnabled = false;
        this.mouseChildren = false;
    }

    private var _data:SlideCarriage;

    [Bindable]
    public function get data():SlideCarriage
    {
        return _data;
    }

    public function set data( value:SlideCarriage ):void
    {
        _data = value;

    }
}
}
