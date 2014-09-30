package plover.view.components.slide
{
import plover.model.slides.SlideCarriage;

import robotlegs.bender.bundles.mvcs.Mediator;

public class SlideMediator extends Mediator
{

    [Inject]
    public var view:Slide;

    [Inject]
    public var model:SlideCarriage;

    override public function initialize():void
    {
        view.data = model;
    }


}
}
