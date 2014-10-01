package plover.controller.cmds
{
import flash.events.Event;
import flash.events.IEventDispatcher;

import tools.statemachine.StateEvent;

public function thenChangeStateTo( action:String, dispatcher:IEventDispatcher, data:* = null ):Function
{
    return function ( event:Event ):void
    {
        const changed:Function = function ():void
        {
            if ( data != null && typeof data == "function" )
            {
                data = data();
            }

            dispatcher.removeEventListener( StateEvent.CHANGED, changed );
            dispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, action, data ) );
        };
        dispatcher.addEventListener( StateEvent.CHANGED, changed );
    }
}

}
