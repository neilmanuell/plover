package plover.controller.cmds
{
import tools.mouse.DragControllerMap;

public class EnableDrag
{

    [Inject]
    public var controller:DragControllerMap;

    public function execute():void
    {
        controller.enabled = true;

    }
}
}
