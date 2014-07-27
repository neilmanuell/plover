package plover.controller.guards
{
import flash.events.KeyboardEvent;

public function keyIs( keyCode:uint, shift:Boolean = false ):Function
{
    return function ( event:KeyboardEvent ):Boolean
    {
        return ((event.keyCode == keyCode) && (event.shiftKey == shift));
    }
}
}
