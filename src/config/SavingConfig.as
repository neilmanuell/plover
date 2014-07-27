package config
{
import flash.events.IEventDispatcher;

import plover.controller.cmds.importing.RetrieveImageFiles;
import plover.controller.cmds.saving.WriteToListFile;
import plover.controller.cmds.thenChangeStateTo;
import plover.controller.guards.OnlyIfImagesAreLoaded;
import plover.controller.guards.OnlyIfListFileDoesNotExist;
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
                .on( StateConstant.START_SAVING, StateEvent )
                //.all.onApproval( OnlyIfListFileDoesNotExist ).execute( RetrieveImageFiles )
                .all.execute( WriteToListFile, thenChangeStateTo( StateConstant.IDLE, dispatcher ) )
                /*.and.either.onApproval( OnlyIfImagesAreLoaded ).execute( thenChangeStateTo( StateConstant.IDLE, dispatcher ) )
                .or.execute( thenChangeStateTo( StateConstant.IMPORT, dispatcher ) )*/


    }


}
}
