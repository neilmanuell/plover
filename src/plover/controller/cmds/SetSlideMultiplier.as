package plover.controller.cmds
{
import plover.model.slides.SlideCarriage;

import tools.mouse.MouseDragEvent;

public class SetSlideMultiplier
{

    [Inject]
    public var model:SlideCarriage;

    [Inject]
    public var event:MouseDragEvent;
;

    public function execute():void
    {
        model.multiplier = event.multiplier;

    }
}
}
