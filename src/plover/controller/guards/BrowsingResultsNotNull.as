package plover.controller.guards
{
import plover.service.file.BrowseFileService;

public class BrowsingResultsNotNull
{
    [Inject]
    public var service:BrowseFileService;

    public function approve():Boolean
    {
        return service.results != null;
    }
}
}
