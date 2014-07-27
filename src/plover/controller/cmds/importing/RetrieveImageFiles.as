package plover.controller.cmds.importing
{
import plover.model.files.FileModel;
import plover.service.file.ImageFileService;

public class RetrieveImageFiles
{
    [Inject]
    public var service:ImageFileService;

    [Inject]
    public var model:FileModel;

    public function execute():void
    {
        model.setImageFiles( service.retrieveImages( model.parent ) );
    }
}
}
