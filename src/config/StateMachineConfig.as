package config
{
import config.state.BootstrapingConfig;
import config.state.BrowsingConfig;
import config.state.ClosingConfig;
import config.state.EditingSettingsConfig;
import config.state.ErroringConfig;
import config.state.ExitingConfig;
import config.state.ExportingConfig;
import config.state.IdlingConfig;
import config.state.ImportingConfig;
import config.state.OpeningConfig;
import config.state.SavingConfig;

import flash.events.IEventDispatcher;

import plover.controller.state.StateConstant;

import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IContext;

import tools.statemachine.FSMInjector;
import tools.statemachine.StateHistory;
import tools.statemachine.StateMachine;

public class StateMachineConfig implements IConfig
{


    [Inject]
    public var context:IContext;

    [Inject]
    public var eventDispatcher:IEventDispatcher;


    public function configure():void
    {
        const fsmInjector:FSMInjector = new FSMInjector( StateConstant.FSM );
        const stateMachine:StateMachine = new StateMachine( eventDispatcher );
        const stateHistory:StateHistory = new StateHistory( eventDispatcher );

        fsmInjector.inject( stateMachine );

        context.injector.map( StateHistory ).toValue( stateHistory );
        context.injector.map( StateMachine ).toValue( stateMachine );


        context.configure(
                BootstrapingConfig,
                OpeningConfig,
                ExitingConfig,
                IdlingConfig,
                ClosingConfig,
                EditingSettingsConfig,
                ImportingConfig,
                BrowsingConfig,
                ExportingConfig,
                SavingConfig,
                ErroringConfig
        )
    }
}
}