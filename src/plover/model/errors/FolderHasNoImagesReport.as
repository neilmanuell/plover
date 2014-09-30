package plover.model.errors
{
public class FolderHasNoImagesReport implements ErrorReport
{
    public function get report():String
    {
        return "No images found in folder"
    }

    public function get title():String
    {
        return "WARNING";
    }
}
}
