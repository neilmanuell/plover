package plover.view.components.dialogues
{
import mx.managers.PopUpManager;

import plover.model.settings.BitmapMemorySettings;

import robotlegs.bender.bundles.mvcs.Mediator;
import robotlegs.bender.extensions.viewManager.api.IViewManager;

public class MemorySettingsFormMediator extends Mediator
{
    [Inject]
    public var view:MemorySettingsForm;

    [Inject]
    public var model:BitmapMemorySettings;


    [Inject]
    public var viewManager:IViewManager;

    override public function initialize():void
    {
        view.dataProvider = model;
        view.closeRequest.addOnce( close );
    }

    private function close():void
    {
        PopUpManager.removePopUp( view );
        viewManager.removeContainer( view );
    }


}
}
