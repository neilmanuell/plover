package plover.view.components.dialogues
{
import flash.events.Event;
import flash.events.ProgressEvent;

import mx.managers.PopUpManager;

import plover.controller.events.PloverProgressEvent;

import robotlegs.bender.bundles.mvcs.Mediator;
import robotlegs.bender.extensions.viewManager.api.IViewManager;

public class ProgressDialogueMediator extends Mediator
{

    [Inject]
    public var view:ProgressDialogue;

    [Inject]
    public var viewManager:IViewManager;

    override public function initialize():void
    {
        addContextListener( PloverProgressEvent.COMPLETE, close );
        addContextListener( PloverProgressEvent.LOAD_PROGRESS, onProgress );

    }

    private function onProgress( event:ProgressEvent ):void
    {
        view.totalLoadProgress = event.bytesTotal;
        view.loadProgress = event.bytesLoaded;


    }



    private function close(event:Event):void
    {
        PopUpManager.removePopUp( view );
        viewManager.removeContainer( view );
    }




}
}
{

}