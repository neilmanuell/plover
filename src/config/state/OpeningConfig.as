package config.state
{
import plover.controller.cmds.onLoadQueueCompleteChangeStateTo;
import plover.controller.cmds.opening.AcquireList;
import plover.controller.cmds.state.RemoveAllLoaderServiceListeners;
import plover.controller.state.StateConstant;

import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

import statemachine.flow.api.EventFlowMap;

import tools.statemachine.StateEvent;

public class OpeningConfig implements IConfig
{

    [Inject]
    public var flow:EventFlowMap;

    [Inject]
    public var injector:IInjector;


    public function configure():void
    {

        flow
                .on( StateConstant.TEARDOWN_OPENING, StateEvent )
                .always.execute( RemoveAllLoaderServiceListeners );

        flow
                .on( StateConstant.START_OPENING, StateEvent )
                .always.execute( AcquireList, onLoadQueueCompleteChangeStateTo(StateConstant.IMPORT, injector) );


    }


}
}