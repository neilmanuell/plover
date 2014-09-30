package plover.controller.guards
{
import plover.controller.events.ActionEvent;

public function actionNameIsAny( names:Array ):Function
{
    return function ( event:ActionEvent ):Boolean
    {
        return (names.indexOf( event.name ) != -1);
    }
}
}
