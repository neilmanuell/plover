package plover.service.file
{
import flash.filesystem.File;

import plover.model.errors.ErrorReport;
import plover.model.errors.GenericErrorReport;

public class BrowseResults
{
    public var success:Boolean;
    public var isError:Boolean;
    public var wasCancelled:Boolean;
    public var data:*;

    public function BrowseResults( status:Boolean, data:*)
    {
        this.success = status;
        this.data = data;
        this.wasCancelled = (status && data == null);
        this.isError = (!status && !(data is File));
    }

    public function get errorReport():ErrorReport
    {
        return new GenericErrorReport(data);
    }
}
}
