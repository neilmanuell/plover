package plover.controller.guards
{
import plover.model.files.FileModel;

public class ListFileDoesNotExist
{
    [Inject]
    public var model:FileModel;

    public function approve():Boolean
    {
        return !model.listExists
    }
}
}
