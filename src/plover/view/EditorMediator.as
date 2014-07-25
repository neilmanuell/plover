package plover.view
{
import plover.model.slides.SlideCarriage;
import plover.view.components.Editor;

import robotlegs.bender.bundles.mvcs.Mediator;

public class EditorMediator extends Mediator
{

    [Inject]
    public var view:Editor;

    [Inject]
    public var model:SlideCarriage;

    override public function initialize():void
    {
        view.dataProvider = model.dataProvider;
    }


}
}
