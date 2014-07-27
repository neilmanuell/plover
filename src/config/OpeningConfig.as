package config
{
import flash.events.IEventDispatcher;

import plover.controller.cmds.onQueueCompleteChangeStateTo;
import plover.controller.cmds.opening.AcquireList;
import plover.controller.cmds.state.RemoveAllLoaderServiceListeners;
import plover.controller.cmds.state.TearDownAcquiring;
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
                .all.execute( RemoveAllLoaderServiceListeners );

        flow
                .on( StateConstant.START_OPENING, StateEvent )
                .all.execute( AcquireList )
                .and.all.execute( onQueueCompleteChangeStateTo(StateConstant.IMPORT, injector) );


    }


}
}
