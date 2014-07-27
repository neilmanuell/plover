package config
{
import flash.events.IEventDispatcher;

import plover.controller.cmds.state.SetupIdling;
import plover.controller.cmds.state.TearDownIdling;
import plover.controller.state.StateConstant;

import robotlegs.bender.framework.api.IConfig;

import statemachine.flow.api.EventFlowMap;

import tools.statemachine.StateEvent;
import tools.statemachine.StateHistory;

public class IdlingConfig implements IConfig
{

    [Inject]
    public var flow:EventFlowMap;

    [Inject]
    public var dispatcher:IEventDispatcher;

    [Inject]
    public var stateHistory:StateHistory;


    public function configure():void
    {

        flow
                .on( StateConstant.SETUP_IDLING, StateEvent )
                .all.execute( SetupIdling );

        flow
                .on( StateConstant.TEARDOWN_IDLING, StateEvent )
                .all.execute( TearDownIdling );

    }


}
}
