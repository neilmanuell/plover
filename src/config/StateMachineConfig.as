package config
{
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

        context.injector.map( StateHistory ).toValue(stateHistory);
        context.injector.map( StateMachine ).toValue( stateMachine );


        context.configure(
                BootstrapingConfig,
                OpeningConfig,
                ExitingConfig,
                IdlingConfig,
                ImportingConfig,
                BrowsingConfig,
                SavingConfig
        )
    }
}
}