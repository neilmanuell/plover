package plover.controller.cmds.browsing
{
import plover.controller.cmds.sendErrorReport;
import plover.model.files.ImportFileModel;
import plover.service.file.BrowseFileService;
import plover.service.file.BrowseResults;

import robotlegs.bender.framework.api.IInjector;

public class BrowseForOpenDialogue
{
    [Inject]
    public var service:BrowseFileService;

    [Inject]
    public var model:ImportFileModel;

    [Inject]
    public var inject:IInjector;

    public function execute():void
    {
        service.browse().addOnce( function ( result:BrowseResults ):void
                {
                    if ( result.isError )
                    {
                        sendErrorReport( result.errorReport, inject );
                    }

                    else if ( result.success && !result.wasCancelled )
                    {
                        model.setParentFile( result.data );
                    }

                }
        );
    }
}
}
