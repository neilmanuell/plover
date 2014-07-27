package config.state
{
import plover.controller.cmds.exiting.ExitApplication;
import plover.controller.state.StateConstant;

import robotlegs.bender.framework.api.IConfig;

import statemachine.flow.api.EventFlowMap;

import tools.statemachine.StateEvent;

public class ExitingConfig implements IConfig
{

    [Inject]
    public var flow:EventFlowMap;

    public function configure():void
    {

        flow
                .on( StateConstant.START_EXITING_APPLICATION, StateEvent )
                .always.execute( ExitApplication );


    }


}
}
