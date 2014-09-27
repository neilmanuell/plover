package config.state
{
import flash.events.IEventDispatcher;

import plover.controller.cmds.saving.WriteToListFile;
import plover.controller.cmds.thenChangeStateTo;
import plover.controller.state.StateConstant;

import robotlegs.bender.framework.api.IConfig;

import statemachine.flow.api.EventFlowMap;

import tools.statemachine.StateEvent;

public class SavingConfig implements IConfig
{

    [Inject]
    public var flow:EventFlowMap;

    [Inject]
    public var dispatcher:IEventDispatcher;


    public function configure():void
    {

        flow
                .on( StateConstant.START_SAVING_LIST, StateEvent )
                .always.execute( WriteToListFile, thenChangeStateTo( StateConstant.IDLE, dispatcher )  )


    }


}
}
