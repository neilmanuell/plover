package plover.controller.cmds.settings
{
import flash.display.DisplayObject;

import mx.core.FlexGlobals;
import mx.managers.PopUpManager;

import plover.view.components.dialogues.MemorySettingsForm;

import robotlegs.bender.extensions.viewManager.api.IViewManager;

public class PopSettingsDialogue
{


    [Inject] public var viewManager:IViewManager;

    public function execute():void
    {

        const w:MemorySettingsForm = new MemorySettingsForm();
        viewManager.addContainer(w);
        PopUpManager.addPopUp(w, FlexGlobals.topLevelApplication as DisplayObject);
        PopUpManager.centerPopUp(w);
    }
}
}
