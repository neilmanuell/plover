package plover.controller.cmds.importing
{
import plover.model.files.ImportFileModel;
import plover.service.file.ImageFileService;

public class RetrieveImageFiles
{
    [Inject]
    public var service:ImageFileService;

    [Inject]
    public var model:ImportFileModel;

    public function execute():void
    {
        model.setImageFiles( service.retrieveImages( model.parent ) );
    }
}
}
