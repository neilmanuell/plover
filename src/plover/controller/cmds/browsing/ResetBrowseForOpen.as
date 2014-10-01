package plover.controller.cmds.browsing
{
import plover.service.file.BrowseFileService;

public class ResetBrowseForOpen
{
    [Inject]
    public var service:BrowseFileService;



    public function execute():void
    {
        service.reset();

    }
}
}
