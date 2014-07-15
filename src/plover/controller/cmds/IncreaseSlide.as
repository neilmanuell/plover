package plover.controller.cmds
{
import plover.model.slides.SlideCarriage;

public class IncreaseSlide
{

    [Inject]
    public var model:SlideCarriage;
;

    public function execute():void
    {
        model.selectedIndex++;

    }
}
}
