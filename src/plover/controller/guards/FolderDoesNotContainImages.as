package plover.controller.guards
{
import plover.model.files.ImportFileModel;
import plover.service.file.ImageFileService;

public class FolderDoesNotContainImages
{
    [Inject]
    public var service:ImageFileService;

    [Inject]
    public var model:ImportFileModel;

    public function approve():Boolean
    {
        return !service.containsImageFiles( model.parent );
    }
}
}
