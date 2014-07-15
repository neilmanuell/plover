package plover.service.file
{
import flash.filesystem.File;

public class ImageServiceResults
{
    public var status:String;
    public var files:Vector.<File>;

    public function ImageServiceResults( status:String, files:*)
    {
        this.status = status;
        this.files = ( files is Array) ? Vector.<File>( files ) : files;
    }
}
}
