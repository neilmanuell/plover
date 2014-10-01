package plover.controller.cmds
{
import flash.events.Event;
import flash.events.IEventDispatcher;

import tools.statemachine.StateEvent;

public function changeStateTo( action:String, dispatcher:IEventDispatcher, data:* = null ):Function
{
    return function ( event:Event = null ):void
    {
        if ( data != null && typeof data == "function" )
        {
            data = data();
        }

        dispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, action, data ) )
    }
}

}
