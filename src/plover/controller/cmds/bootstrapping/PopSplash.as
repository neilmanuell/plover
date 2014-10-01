package plover.controller.cmds.bootstrapping
{
import flash.display.DisplayObject;

import mx.core.FlexGlobals;
import mx.managers.PopUpManager;

import plover.view.components.splash.Splash;

import robotlegs.bender.extensions.viewManager.api.IViewManager;

public class PopSplash
{
    [Inject]
    public var viewManager:IViewManager;

    public function execute():void
    {
        const image:Splash = new Splash();
        viewManager.addContainer( image );
        PopUpManager.addPopUp( image, FlexGlobals.topLevelApplication as DisplayObject );
        PopUpManager.centerPopUp( image );
    }
}
}
