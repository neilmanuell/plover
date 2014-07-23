package plover.controller.events
{
import flash.display.DisplayObject;
import flash.events.Event;

import plover.controller.constants.ScreenInfo;

public class ViewEvent extends Event
{
    public static const ADD:String = "ViewEvent.ADD";
    private var _screen:ScreenInfo;
    private var _view:DisplayObject;

    public function ViewEvent( type:String, screen:ScreenInfo, view:DisplayObject ):void
    {
        super( type );
        _screen = screen;
        _view = view;

    }

    override public function clone():Event
    {
        return new ViewEvent( type,_screen, _view );
    }


    public function get screen():ScreenInfo
    {
        return _screen;
    }

    public function get view():DisplayObject
    {
        return _view;
    }
}
}
