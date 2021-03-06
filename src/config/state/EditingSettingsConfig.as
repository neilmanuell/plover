package config.state
{
import flash.events.IEventDispatcher;

import plover.controller.cmds.settings.PopSettingsDialogue;
import plover.controller.cmds.thenChangeStateTo;
import plover.controller.state.StateConstant;

import robotlegs.bender.framework.api.IConfig;

import statemachine.flow.api.EventFlowMap;

import tools.statemachine.StateEvent;

public class EditingSettingsConfig implements IConfig
{

    [Inject]
    public var flow:EventFlowMap;

    [Inject]
    public var dispatcher:IEventDispatcher;


    public function configure():void
    {


        flow
                .on( StateConstant.START_EDITING_SETTINGS, StateEvent )
                .always.execute( PopSettingsDialogue, thenChangeStateTo( StateConstant.NEXT, dispatcher ) );


    }


}
}
