package plover.controller.events
{
import flash.events.Event;

import plover.controller.constants.ScreenInfo;

public class ViewStackEvent extends Event
{
    public static const CHANGE:String = "ViewStackEvent.CHANGE";
    private var _screen:ScreenInfo;


    public function ViewStackEvent( screen:ScreenInfo):void
    {
        super( CHANGE );
        _screen = screen;
    }

    override public function clone():Event
    {
        return new ViewStackEvent( _screen );
    }


    public function get screen():ScreenInfo
    {
        return _screen;
    }


}
}
