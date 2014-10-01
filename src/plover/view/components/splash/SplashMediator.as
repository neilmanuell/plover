package plover.view.components.splash
{
import mx.managers.PopUpManager;

import plover.controller.events.SplashEvent;

import robotlegs.bender.bundles.mvcs.Mediator;
import robotlegs.bender.extensions.viewManager.api.IViewManager;

public class SplashMediator extends Mediator
{
    [Inject]
    public var view:Splash;


    [Inject]
    public var viewManager:IViewManager;

    override public function initialize():void
    {
        addContextListener(SplashEvent.REMOVE, onClose)
    }

    private function onClose(event:SplashEvent):void
    {
        PopUpManager.removePopUp( view );
        viewManager.removeContainer( view );
    }


}
}
