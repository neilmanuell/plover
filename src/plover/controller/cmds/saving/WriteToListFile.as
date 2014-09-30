package plover.controller.cmds.saving
{
import plover.model.files.ImportFileModel;
import plover.model.slides.SlideCarriage;
import plover.service.file.DataFileOutService;

public class WriteToListFile
{
    [Inject]
    public var service:DataFileOutService;

    [Inject]
    public var data:SlideCarriage;

    [Inject]
    public var files:ImportFileModel;

    public function execute():void
    {
        const data:String = data.serialise();
        service.write( files.list, data );
    }
}
}
