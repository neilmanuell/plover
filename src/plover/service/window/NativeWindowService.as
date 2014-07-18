package plover.service.window
{
import flash.display.NativeWindow;

public class NativeWindowService   implements WindowService
{
    private var _window:NativeWindow;

   //
    public function get width():Number
    {
        return _window.width;
    }

    public function get height():Number
    {
        return _window.height;
    }

    public function NativeWindowService(window:NativeWindow)
    {
        _window = window;
    }

    public function maximise():void
    {
    }
}
}
