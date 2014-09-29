package plover.controller.cmds
{
import plover.controller.events.ActionEvent;

import tools.mouse.DragControllerMap;

public class ChangeDragControl
{

    [Inject]
    public var controller:DragControllerMap;

    [Inject]
    public var event:ActionEvent;

    public function execute():void
    {
        controller.currentControl = event.name;
    }
}
}
