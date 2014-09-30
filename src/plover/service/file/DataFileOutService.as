package plover.service.file
{
import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;

public class DataFileOutService
{

    public function write( file:File, data:String ):void
    {
        var stream:FileStream = new FileStream();
        stream.open( file, FileMode.WRITE );
        stream.writeUTFBytes( data );
        stream.close();
    }

}
}
