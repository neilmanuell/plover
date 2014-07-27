package plover.controller.cmds
{
import plover.controller.cmds.importing.OnLoadQueueCompleteChangeStateTo;

import robotlegs.bender.framework.api.IInjector;

import tools.statemachine.StateEvent;

public function onQueueCompleteChangeStateTo( action:String, injector:IInjector ):Function
{
    return function ( event:StateEvent ):void
    {
        const cmd:OnLoadQueueCompleteChangeStateTo = new OnLoadQueueCompleteChangeStateTo(action);
        injector.injectInto(cmd);
        cmd.execute();
    }
}

}
