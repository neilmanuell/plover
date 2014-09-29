package plover.controller.cmds
{
import plover.controller.constants.ActionNames;
import plover.controller.events.ActionEvent;

public class ToggleDragControlMenuGroup
{

    [Inject]
    public var event:ActionEvent;

    public function execute():void
    {
        ActionNames.DRAG_CONTROLLERS.forEach( function ( item:String, index:int, a:Array ):void
        {
            if ( item != event.name )
            {
                event.deselectMenuItem( item );
            }
        } );


    }
}
}
