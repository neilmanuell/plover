package plover.controller.guards
{
import plover.model.files.ImportFileModel;

public class ListFileDoesExist
{
    [Inject]
    public var model:ImportFileModel;

    public function approve():Boolean
    {
        return model.listExists
    }
}
}
