package plover.controller.cmds
{
import flash.events.Event;
import flash.events.IEventDispatcher;

import tools.statemachine.StateEvent;

public function thenChangeStateTo( action:String, dispatcher:IEventDispatcher ):Function
{
    return function ( event:Event ):void
    {
        const changed:Function = function ():void
        {
            dispatcher.removeEventListener( StateEvent.CHANGED, changed );
            dispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, action ) );
        };
        dispatcher.addEventListener( StateEvent.CHANGED, changed );
    }
}

}
