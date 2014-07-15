package plover.controller.cmds
{
import flash.display.BitmapData;
import flash.filesystem.File;

import plover.model.slides.SlideCarriage;
import plover.service.image.LoadImageEvent;

import tools.loaderservice.api.BitmapDataProvider;

public class PopulateImageModel
{

    [Inject]
    public var model:SlideCarriage;

    [Inject]
    public var provider:BitmapDataProvider;

    [Inject]
    public var event:LoadImageEvent;

    public function execute():void
    {
        event.files.forEach( function ( file:File, index:int, v:Vector.<File> ):void
        {
            const bmp:BitmapData = provider.getBitmapData( file.url );
            model.add( file, bmp );
        } );

        model.selectedIndex = 0;

    }
}
}
