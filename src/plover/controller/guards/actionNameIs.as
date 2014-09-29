package plover.controller.guards
{
import plover.controller.events.ActionEvent;

public function actionNameIs( name:String ):Function
{
    return function ( event:ActionEvent ):Boolean
    {
        return (event.name == name);
    }
}
}
