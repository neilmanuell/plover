package plover.view
{
import flash.events.ProgressEvent;

import mx.controls.ProgressBar;

import robotlegs.bender.bundles.mvcs.Mediator;

public class ProgressBarMediator extends Mediator
{

    [Inject]
    public var view:ProgressBar;



    override public function initialize():void
    {

        addContextListener(ProgressEvent.PROGRESS, onProgress)
    }

    private function onProgress(event:ProgressEvent):void
    {


        trace("DDDD " +  (event.bytesLoaded / event.bytesTotal ));
        view.setProgress( event.bytesLoaded, event.bytesTotal);
    }


}
}
{

}