package config.state
{
import plover.controller.cmds.bootstrapping.CreateView;
import plover.controller.cmds.bootstrapping.PopSplash;
import plover.controller.cmds.bootstrapping.RemoveSplash;
import plover.controller.state.StateConstant;

import robotlegs.bender.framework.api.IConfig;

import statemachine.flow.api.EventFlowMap;

import tools.statemachine.StateEvent;

public class BootstrapingConfig implements IConfig
{

    [Inject]
    public var flow:EventFlowMap;


    public function configure():void
    {
        flow
                .on( StateConstant.TEARDOWN_BOOTSTRAPING, StateEvent )
                .always.execute( RemoveSplash, CreateView );

        flow
                .on( StateConstant.START_BOOTSTRAPPING, StateEvent )
                .always.execute( PopSplash );

    }


}
}
