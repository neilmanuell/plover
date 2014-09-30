package plover.controller.cmds
{
import flash.events.Event;
import flash.events.IEventDispatcher;

import tools.statemachine.StateEvent;

public function changeStateTo( action:String, dispatcher:IEventDispatcher ):Function
{
    return function ( event:Event= null ):void
    {
        dispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, action ) )
    }
}

}
