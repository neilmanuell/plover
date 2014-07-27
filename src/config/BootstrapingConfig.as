package config
{
import flash.events.IEventDispatcher;

import plover.controller.cmds.bootstrapping.CreateView;
import plover.controller.state.StateConstant;

import robotlegs.bender.framework.api.IConfig;

import statemachine.flow.api.EventFlowMap;

import tools.statemachine.StateEvent;
import tools.statemachine.StateHistory;

public class BootstrapingConfig implements IConfig
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
                .on( StateConstant.BOOTSTRAP, StateEvent )
                .all.execute( CreateView );







    }


}
}
