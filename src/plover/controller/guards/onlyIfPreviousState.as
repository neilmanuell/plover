package plover.controller.guards
{
import tools.statemachine.StateEvent;
import tools.statemachine.StateHistory;

public function onlyIfPreviousState( name:String, history:StateHistory ):Function
{
    return function ( event:StateEvent ):Boolean
    {
        return ( history.previousStateName == name);
    }
}
}
