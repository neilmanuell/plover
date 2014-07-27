package config.state
{
import plover.controller.cmds.state.AddInputControl;
import plover.controller.cmds.state.RemoveInputControl;
import plover.controller.state.StateConstant;

import robotlegs.bender.framework.api.IConfig;

import statemachine.flow.api.EventFlowMap;

import tools.statemachine.StateEvent;

public class IdlingConfig implements IConfig
{

    [Inject]
    public var flow:EventFlowMap;


    public function configure():void
    {

        flow
                .on( StateConstant.SETUP_IDLING, StateEvent )
                .always.execute( AddInputControl );

        flow
                .on( StateConstant.TEARDOWN_IDLING, StateEvent )
                .always.execute( RemoveInputControl );

    }


}
}
