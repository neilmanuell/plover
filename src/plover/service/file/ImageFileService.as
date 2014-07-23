package plover.service.file
{
import flash.filesystem.File;

public class ImageFileService
{

    private const EXTENTIONS:Vector.<String> = new <String>["jpg", "png", "jpeg"];


    public function retrieveImages( file:File ):Vector.<File>
    {
        const contents:Array = file.getDirectoryListing();
        const out:Array = contents.filter( function ( item:File, index:int, a:Array ):Boolean
        {
            return (!item.isDirectory && EXTENTIONS.indexOf( item.extension.toLowerCase() ) != -1);
        } );
        return Vector.< File>(out);
    }

}
}
