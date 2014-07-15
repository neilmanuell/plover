package plover.controller.cmds
{
import flash.events.IEventDispatcher;

import plover.service.file.ImageFileService;
import plover.service.file.ImageServiceResults;
import plover.service.file.ImageServiceStatus;
import plover.service.image.LoadImageEvent;

public class OpenImportDialogue
{
    [Inject]
    public var service:ImageFileService;

    [Inject]
    public var dispatcher:IEventDispatcher;

    public function execute():void
    {
        service.get().addOnce( function ( result:ImageServiceResults ):void
        {
            if ( result.status == ImageServiceStatus.SUCCESS )
            {
                dispatcher.dispatchEvent( new LoadImageEvent( LoadImageEvent.LOAD_REQUEST, result.files ) );
            }
        } )
    }
}
}
