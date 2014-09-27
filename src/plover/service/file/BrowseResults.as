package plover.service.file
{
public class BrowseResults
{
    public var success:Boolean;
    public var file:*;

    public function BrowseResults( status:Boolean, file:*)
    {
        this.success = status;

        this.file = file;
    }
}
}
