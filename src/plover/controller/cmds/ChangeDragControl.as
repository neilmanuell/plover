package plover.controller.cmds
{
import plover.controller.events.ChangeDragControlEvent;

import tools.mouse.DragControllerMap;

public class ChangeDragControl
{

    [Inject]
    public var controller:DragControllerMap;

    [Inject]
    public var event:ChangeDragControlEvent;

    public function execute():void
    {
        controller.currentControl = event.id;

    }
}
}
