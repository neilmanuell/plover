package plover.controller.cmds.browsing
{
import flash.events.IEventDispatcher;

import plover.model.files.ImportFileModel;
import plover.service.file.BrowseFileService;
import plover.service.file.BrowseResults;

public class BrowseForOpenDialogue
{
    [Inject]
    public var service:BrowseFileService;

    [Inject]
    public var model:ImportFileModel;

    [Inject]
    public var dispatcher:IEventDispatcher;

    public function execute():void
    {
        service.browse().addOnce( function ( result:BrowseResults ):void
                {
                    if ( result.success )
                    {
                        model.setParentFile( result.file );
                    }
                }
        );
    }
}
}
