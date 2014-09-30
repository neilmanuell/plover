package plover.controller.cmds.opening
{
import flash.display.DisplayObject;

import mx.core.FlexGlobals;
import mx.managers.PopUpManager;

import plover.view.components.dialogues.ProgressDialogue;

import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.extensions.viewManager.api.IViewManager;

public class PopProgressDialogue
{

    [Inject]
    public var contextView:ContextView;

    [Inject]
    public var viewManager:IViewManager;

    public function execute():void
    {

        const dialogue:ProgressDialogue = new ProgressDialogue();
        viewManager.addContainer( dialogue );
        PopUpManager.addPopUp( dialogue, FlexGlobals.topLevelApplication as DisplayObject );
        dialogue.x = contextView.view.width - dialogue.width - 10;
        dialogue.y = contextView.view.height - dialogue.height;

    }
}
}
