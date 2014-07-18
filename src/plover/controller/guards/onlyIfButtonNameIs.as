package plover.controller.guards
{
import plover.controller.events.ButtonClickEvent;

public function onlyIfButtonNameIs( name:String ):Function
{
    return function ( event:ButtonClickEvent ):Boolean
    {
        return (event.name == name);
    }
}
}
