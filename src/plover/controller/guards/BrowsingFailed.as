package plover.controller.guards
{
import plover.service.file.BrowseFileService;

public class BrowsingFailed
{
    [Inject]
    public var service:BrowseFileService;

    public function approve():Boolean
    {
        return !service.results.success
    }
}
}
