package plover.controller.cmds.state
{
import plover.service.image.ImportEvent;

import statemachine.flow.api.EventFlowMap;

import tools.loaderservice.api.LoaderService;

public class TearDownImporting
{
    [Inject]
    public var flow:EventFlowMap;

    [Inject]
    public var service:LoaderService;

    public function execute():void
    {
        flow.remove( ImportEvent.LOAD_REQUEST );
        service.on.removeAll();
    }
}
}
