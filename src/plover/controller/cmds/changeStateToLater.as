package plover.controller.cmds
{
import flash.events.Event;
import flash.events.IEventDispatcher;
import flash.utils.setTimeout;

import tools.statemachine.StateEvent;

public function changeStateToLater( action:String, dispatcher:IEventDispatcher, interval:int = 1 ):Function
{
    return function ( event:Event ):void
    {
        setTimeout(
                function ():void
                {
                    dispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, action ) );
                },
                interval );
    }
}

}
