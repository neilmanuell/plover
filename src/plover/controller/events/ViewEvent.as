package plover.controller.events
{
import flash.events.Event;

import mx.core.INavigatorContent;

import plover.controller.constants.ScreenInfo;

public class ViewEvent extends Event
{
    public static const ADD:String = "ViewEvent.ADD";

    public function ViewEvent( eventType:String, screen:ScreenInfo, view:INavigatorContent ):void
    {
        super( eventType );
        _screen = screen;
        _view = view;

    }

    private var _screen:ScreenInfo;

    public function get screen():ScreenInfo
    {
        return _screen;
    }

    private var _view:INavigatorContent;

    public function get view():INavigatorContent
    {
        return _view;
    }

    override public function clone():Event
    {
        return new ViewEvent( type, _screen, _view );
    }
}
}
