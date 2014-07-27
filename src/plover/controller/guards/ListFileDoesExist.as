package plover.controller.guards
{
import plover.model.files.FileModel;

public class ListFileDoesExist
{
    [Inject]
    public var model:FileModel;

    public function approve():Boolean
    {
        return model.listExists
    }
}
}
