package plover.view
{
import plover.model.slides.SlideCarriage;
import plover.view.components.SlideBase;

import robotlegs.bender.bundles.mvcs.Mediator;

public class SlideMediator extends Mediator
{

    [Inject]
    public var view:SlideBase;

    [Inject]
    public var model:SlideCarriage;

    override public function initialize():void
    {
        view.data = model;
    }


}
}
