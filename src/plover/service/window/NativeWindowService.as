package plover.service.window
{
import flash.display.NativeWindow;

public class NativeWindowService implements WindowService
{
    public function NativeWindowService( window:NativeWindow )
    {
        _window = window;
    }

    //
    private var _window:NativeWindow;

    public function get width():Number
    {
        return _window.width;
    }

    public function get height():Number
    {
        return _window.height;
    }

    public function maximise():void
    {
    }
}
}
