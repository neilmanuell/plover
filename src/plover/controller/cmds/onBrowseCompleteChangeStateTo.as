package plover.controller.cmds
{
import plover.controller.cmds.browsing.OnBrowseCompleteChangeStateTo;

import robotlegs.bender.framework.api.IInjector;

import tools.statemachine.StateEvent;

public function onBrowseCompleteChangeStateTo( action:String, injector:IInjector ):Function
{
    return function ( event:StateEvent ):void
    {
        const cmd:OnBrowseCompleteChangeStateTo = new OnBrowseCompleteChangeStateTo(action);
        injector.injectInto(cmd);
        cmd.execute();
    }
}

}
