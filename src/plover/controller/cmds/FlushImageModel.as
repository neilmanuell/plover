package plover.controller.cmds
{
import plover.model.slides.SlideCarriage;

public class FlushImageModel
{

    [Inject]
    public var model:SlideCarriage;


    public function execute():void
    {
        model.flush();

    }
}
}
