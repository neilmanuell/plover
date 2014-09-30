package plover.controller.cmds.importing
{
import flash.display.BitmapData;

import plover.model.files.ImportFileModel;
import plover.model.slides.SlideCarriage;
import plover.service.memory.BitmapMemoryModel;

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
    public var files:ImportFileModel;

    [Inject]
    public var memory:BitmapMemoryModel;


    public function execute():void
    {

        service.on.itemComplete.add( function ( url:String ):void
        {
            const bmp:BitmapData = provider.getBitmapData( url );

            const resizedBmp:BitmapData = memory.resize( bmp, files.length );
            model.add( files.getFileFromURL( url ), resizedBmp );      //bmp, 1600, 1200

        } );

    }


}
}
