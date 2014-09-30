package plover.controller.cmds
{
import flash.events.Event;
import flash.events.IEventDispatcher;

import plover.controller.constants.ScreenInfo;
import plover.controller.events.ViewStackEvent;

public function changeViewStackTo( screen:ScreenInfo, dispatcher:IEventDispatcher ):Function
{
    return function ( event:Event ):void
    {
        dispatcher.dispatchEvent( new ViewStackEvent( screen ) )
    }
}

}
