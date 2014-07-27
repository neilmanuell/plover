package plover.service.file
{
import flash.events.Event;
import flash.filesystem.File;

import tools.signals.Signal1;

public class BrowseImageFileService implements BrowseFileService
{
    private const _complete:Signal1 = new Signal1( ImageServiceResults );
    private const EXTENTIONS:Vector.<String> = new <String>["jpg", "png", "jpeg"];
    private var _results:ImageServiceResults;

    public function browse():Signal1
    {
        const file:File = File.documentsDirectory;
        file.addEventListener( Event.SELECT, onSelected );
        file.addEventListener( Event.CANCEL, onCancel );
        file.browseForDirectory( "Select a directory" );

        return _complete;
    }

    public function get browseComplete():Signal1
    {
        return _complete;
    }

    private function onCancel( event:Event ):void
    {
        dispatch( false, null );
    }

    private function onSelected( event:Event ):void
    {
        const file:File = event.target as File;
        dispatch( true, file );
    }


    private function dispatch( success:Boolean, file:File ):void
    {
        _results = new ImageServiceResults( success, file );
        _complete.dispatch( _results );
    }

    public function get results():ImageServiceResults
    {
        return _results;
    }
}
}
