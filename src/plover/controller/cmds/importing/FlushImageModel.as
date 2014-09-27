package plover.controller.cmds.importing
{
import plover.model.files.ImportFileModel;
import plover.model.slides.SlideCarriage;
import plover.service.memory.BitmapMemoryModel;

public class FlushImageModel
{

    [Inject]
    public var slides:SlideCarriage;

    [Inject]
    public var memory:BitmapMemoryModel;


    public function execute():void
    {
        memory.flush();
        slides.flush();
    }
}
}
