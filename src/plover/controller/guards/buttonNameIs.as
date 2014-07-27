package plover.controller.guards
{
import plover.controller.events.ButtonClickEvent;

public function buttonNameIs( name:String ):Function
{
    return function ( event:ButtonClickEvent ):Boolean
    {
        return (event.name == name);
    }
}
}
