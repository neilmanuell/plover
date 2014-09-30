package plover.service.file
{
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.filesystem.File;

import tools.signals.Signal1;

public class BrowseImageFileService implements BrowseFileService
{
    private const _complete:Signal1 = new Signal1( BrowseResults );
    private var _results:BrowseResults;

    public function browse():Signal1
    {
        const file:File = File.documentsDirectory;
        file.addEventListener( Event.SELECT, onSelected );
        file.addEventListener( Event.CANCEL, onCancel );
        file.addEventListener( IOErrorEvent.IO_ERROR, onIOError );

        try
        {
            file.browseForDirectory( "Select a directory" );
        }

        catch ( error:Error )
        {
            dispatch( false, error);
        }

        return _complete;
    }

    public function get browseComplete():Signal1
    {
        return _complete;
    }

    private function onCancel( event:Event ):void
    {
        dispatch( true, null );
    }

    private function onSelected( event:Event ):void
    {
        const file:File = event.target as File;
        dispatch( true, file );
    }

    private function onIOError( event:Event ):void
    {
        dispatch( false, event);
    }


    private function dispatch( success:Boolean, data:* ):void
    {
        _results = new BrowseResults( success, data );
        _complete.dispatch( _results );
    }

    public function get results():BrowseResults
    {
        return _results;
    }
}
}
