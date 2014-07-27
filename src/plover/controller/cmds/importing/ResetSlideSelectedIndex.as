package plover.controller.cmds.importing
{
import plover.model.slides.SlideCarriage;

public class ResetSlideSelectedIndex
{
    [Inject]
    public var model:SlideCarriage;


    public function execute():void
    {

        model.selectedIndex = 0;

    }
}
}
