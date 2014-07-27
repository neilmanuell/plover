package plover.controller.cmds.importing
{
import plover.model.files.FileModel;
import plover.model.slides.SlideCarriage;

public class FlushImageModel
{

    [Inject]
    public var slides:SlideCarriage;

    [Inject]
    public var files:FileModel;


    public function execute():void
    {
        slides.flush();
    }
}
}
