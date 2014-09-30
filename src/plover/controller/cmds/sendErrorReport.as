package plover.controller.cmds
{
import flash.events.Event;

import plover.model.errors.ErrorRegistry;
import plover.model.errors.ErrorReport;

import robotlegs.bender.framework.api.IInjector;

public function sendErrorReport( report:ErrorReport, injector:IInjector ):Function
{
    return function ( event:Event= null ):void
    {
        const registry:ErrorRegistry = injector.getInstance(ErrorRegistry);
        registry.activeReport = report;
    }
}

}
