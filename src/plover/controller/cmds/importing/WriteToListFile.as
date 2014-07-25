package plover.controller.cmds.importing
{
import plover.model.files.FileModel;
import plover.model.slides.SlideCarriage;
import plover.service.file.DataFileOutService;

public class WriteToListFile
{
    [Inject]
    public var service:DataFileOutService;

    [Inject]
    public var data:SlideCarriage;

    [Inject]
    public var files:FileModel;

    public function execute():void
    {
        const data:String =  data.serialise();
        service.write( files.list, data );
    }
}
}
