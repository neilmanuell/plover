package config
{
import flash.events.IEventDispatcher;

import plover.controller.cmds.exiting.ExitApplication;
import plover.controller.state.StateConstant;

import robotlegs.bender.framework.api.IConfig;

import statemachine.flow.api.EventFlowMap;

import tools.statemachine.StateEvent;
import tools.statemachine.StateHistory;

public class ExitingConfig implements IConfig
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
                .on( StateConstant.START_EXITING_APPLICATION, StateEvent )
                .all.execute( ExitApplication );





    }


}
}
