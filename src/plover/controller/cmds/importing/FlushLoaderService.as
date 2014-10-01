package plover.controller.cmds.importing
{
import tools.loaderservice.api.LoaderService;

public class FlushLoaderService
{

    [Inject]
    public var service:LoaderService;

    public function execute():void
    {
        service.on.removeAll();
        service.flush();
    }
}
}
