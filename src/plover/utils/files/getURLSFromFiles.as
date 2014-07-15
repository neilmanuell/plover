package plover.utils.files
{
import flash.filesystem.File;

public function getURLSFromFiles( files:Vector.<File> ):Array
{
    const out:Array = [];
    files.forEach( function ( file:File, index:int, v:Vector.<File> ):void
    {
        out.push( file.url );
    } );

    return out;
}

}
