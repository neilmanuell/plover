package plover.controller.cmds.importing
{
import plover.model.files.FileModel;
import plover.service.file.DataFileOutService;

public class WriteToListFile
{
    [Inject]
    public var service:DataFileOutService;

    [Inject]
    public var model:FileModel;

    public function execute():void
    {
        const data:String =  model.toString();
        service.write( model.list, data );
    }
}
}
