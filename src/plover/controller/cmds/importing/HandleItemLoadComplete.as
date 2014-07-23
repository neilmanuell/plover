package plover.controller.cmds.importing
{
import flash.display.BitmapData;

import plover.model.files.FileModel;
import plover.model.slides.SlideCarriage;
import plover.utils.bmp.limitBitmapDataSize;

import tools.loaderservice.api.BitmapDataProvider;
import tools.loaderservice.api.LoaderService;

public class HandleItemLoadComplete
{
    [Inject]
    public var model:SlideCarriage;

    [Inject]
    public var service:LoaderService;

    [Inject]
    public var provider:BitmapDataProvider;

    [Inject]
    public var event:FileModel;


    public function execute():void
    {
        service.on.itemComplete.add( function ( url:String ):void
        {
            const bmp:BitmapData = provider.getBitmapData( url );
            model.add( event.getFileFromURL( url ), limitBitmapDataSize( bmp, 1600, 1200 ) );
        } );

    }


}
}
