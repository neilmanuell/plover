package config.state
{
import plover.controller.cmds.erroring.PopupAlert;
import plover.controller.state.StateConstant;

import robotlegs.bender.framework.api.IConfig;

import statemachine.flow.api.EventFlowMap;

import tools.statemachine.StateEvent;

public class ErroringConfig implements IConfig
{

    [Inject]
    public var flow:EventFlowMap;


    public function configure():void
    {

        flow
                .on( StateConstant.START_ERRORING, StateEvent )
                .always.execute( PopupAlert );



    }


}
}
