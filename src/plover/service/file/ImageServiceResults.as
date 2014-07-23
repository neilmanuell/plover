package plover.service.file
{
public class ImageServiceResults
{
    public var success:Boolean;
    public var file:*;

    public function ImageServiceResults( status:Boolean, file:*)
    {
        this.success = status;

        this.file = file;
    }
}
}
